import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class ImagerPicker extends StatefulWidget {
  ImagerPicker({Key key}) : super(key: key);

  @override
  _ImagerPickerState createState() => _ImagerPickerState();
}

class _ImagerPickerState extends State<ImagerPicker> {
  final storage = FirebaseStorage.instance;
  List<AssetImage> imgs;
  bool clicked = false;
  List<String> texts = List();
  String images;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImages();
  }

  void getImages() {
    imgs = List();
    imgs.add(AssetImage('assets/images/416.jpg'));
    imgs.add(AssetImage('assets/images/Miku.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[upToFire()],
      ),
    );
  }

  File _image;
  String _uploadedFileURL;
  final picker = ImagePicker();

  Widget gridImage() {
    return GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        itemCount: imgs.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 3.0, crossAxisSpacing: 3.0),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: Material(
              child: GestureDetector(
                child: Stack(
                  children: <Widget>[
                    this.images == imgs[index].assetName ||
                            texts.contains(imgs[index].assetName)
                        ? Positioned.fill(
                            child: Opacity(
                            opacity: 0.7,
                            child: Image.asset(
                              imgs[index].assetName,
                              fit: BoxFit.fill,
                            ),
                          ))
                        : Positioned.fill(
                            child: Opacity(
                            opacity: 1.0,
                            child: Image.asset(
                              imgs[index].assetName,
                              fit: BoxFit.fill,
                            ),
                          )),
                    this.images == imgs[index].assetName ||
                            texts.contains(imgs[index].assetName)
                        ? Positioned.fill(
                            left: 0,
                            bottom: 0,
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ))
                        : Visibility(
                            visible: false,
                            child: Icon(
                              Icons.check_circle_outline,
                              color: Colors.black,
                            ),
                          )
                  ],
                ),
                onTap: () {
                  setState(() {
                    if (texts.contains(imgs[index].assetName)) {
                      this.clicked = false;
                      texts.remove(imgs[index].assetName);
                      this.images = null;
                    } else {
                      this.images = imgs[index].assetName;
                      texts.add(this.images);
                      this.clicked = true;
                    }
                  });
                },
              ),
            ),
          );
        });
  }

  Widget upToFire() {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            'Selected Image',
            style: TextStyle(color: Color.fromRGBO(164, 164, 164, 1)),
          ),
          _image != null
              ? Image.asset(
                  _image.path,
                  height: 150,
                )
              : Container(
                  height: 150,
                ),
          _image == null
              ? RaisedButton(
                  child: Text(
                    'Choose File',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: chooseFile,
                  color: Colors.cyan,
                )
              : Container(),
          _image != null
              ? RaisedButton(
                  child: Text('Upload File',
                      style: TextStyle(color: Colors.white)),
                  onPressed: uploadFile,
                  color: Colors.cyan,
                )
              : Container(),
          _image != null
              ? RaisedButton(
                  child: Text('Clear Selection'),
                  onPressed: clearSelecttion,
                )
              : Container(),
          SizedBox(
            height: 30,
          ),
          Text('Uploaded Image'),
          _uploadedFileURL != null
              ? Image.network(
                  _uploadedFileURL,
                  height: 150,
                )
              : Container()
        ],
      ),
    );
  }

  // 调用 ImagerPicker
  Future chooseFile() async {
    print('Readly to choose File.');
    final _file = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(_file.path);
    });
  }

  // 上传
  Future uploadFile() async {
    print('chats/${Path.basename(_image.path)}');
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('chats/${Path.basename(_image.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Up Success ~');
    print('_uploadedFileURL = ${_uploadedFileURL}');
  }

  // 清除
  Future clearSelecttion() async {
    _image = null;
    _uploadedFileURL = '';
  }
}
