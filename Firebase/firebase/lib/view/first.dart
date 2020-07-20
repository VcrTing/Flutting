import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class FirebaseTest extends StatefulWidget {
  @override
  _FirebaseTestState createState() => _FirebaseTestState();
}

class _FirebaseTestState extends State<FirebaseTest> {
  //指定url
  String url = "http://jsonplaceholder.typicode.com/posts";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FireBase Firestore"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //获取url中的数据
          http.Response res = await http.get(url);
          // 将response的内容decode成为一个list
          List j = jsonDecode(res.body);
          //将list中的数据全部通过firestore存储
          j.forEach((e) {
            //创建users文档并将list中的item以键值对的方式存储
            Firestore.instance.collection('/users').document().setData(e);
          });
        },
        child: Text("获取数据"),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('users')?.snapshots(),
        builder: (context, snap) {
          //没有数据的话显示空内容
          if (!snap.hasData) {
            return Container();
          }
          //有数据的话将数据存储到list中
          List<DocumentSnapshot> docs = snap.data.documents;
          return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                //获取到index位置的snapshot
                DocumentSnapshot doc = docs[index];
                return InkWell(
                    onTap: () {
                      //点击删除指定位置的内容
                      Firestore.instance
                          .collection('/users')
                          .document(doc.documentID)
                          .delete();
                    },
                    child: ListTile(
                      //将获取到的内容通过listtile展示出来
                      title: Text(doc['title']),
                      subtitle: Text(doc['body']),
                    ));
              });
        },
      ),
    );
  }
}
