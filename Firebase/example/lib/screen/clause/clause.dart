import 'dart:convert';
import 'dart:io';

import 'package:example/common/style/_contain.dart';
import 'package:example/widgets/button/outlineButton.dart';
import 'package:example/widgets/free/loading.dart';
import 'package:example/widgets/gradient/linear.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:webview_flutter/webview_flutter.dart';

class ClauseContent extends StatefulWidget {
  ClauseContent({Key key}) : super(key: key);

  @override
  _ClauseContentState createState() => _ClauseContentState();
}

class _ClauseContentState extends State<ClauseContent> {
  String rec = 'assets/html/cluse.html';

  Future<void> loadHtml(WebViewController _webViewController) async {
    final String path = await rootBundle.loadString(rec);
    _webViewController.loadUrl(Uri.dataFromString(path,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: WebView(
            initialUrl: 'https://flutter.cn',
            onWebViewCreated: (controller) => loadHtml(controller)));
  }
}

class ClauseScreen extends StatefulWidget {
  ClauseScreen({Key key}) : super(key: key);

  @override
  _ClauseScreenState createState() => _ClauseScreenState();
}

class _ClauseScreenState extends State<ClauseScreen> {
  Text simpleTxt(BuildContext context, String txt) => Text(
        txt,
        style: TextStyle(
            fontSize: 18, color: Theme.of(context).textTheme.bodyText2.color),
      );

  Widget txtContent() => Container(
        child: Column(
          children: [
            simpleTxt(context,
                '以下條款和條件構成您和悅榕酒店及度假村有限公司下稱“ banyantree.com”或“我們”，視具體情況而定）達成具有法律約束力的協議。'),
            SizedBox(
              height: horizon,
            ),
            simpleTxt(context,
                'com（下稱“本網站”），即表明您在不做任何變更的基礎上接受本協議載明的條款和條件我們經自行酌情裁量量後，無論通知與否均可以不時對此類條款和條件進行更改。'),
            SizedBox(
              height: horizon,
            ),
            simpleTxt(context, '您確認，如果您繼續使用本網站，即表明您同意遵守本協議載明的預先有效的所有條款和條件。'),
            SizedBox(
              height: horizon,
            ),
            simpleTxt(context, '如果您不同意以下條款和條件的任何部分，則您不得使用本網站或本網站所提供的服務。')
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(252, 252, 252, 1),
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
          onTap: () => Get.back(),
        ),
        title: Text(
          '条款及细则',
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          linearLine(context),
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: horizon, vertical: horizonL),
            child: txtContent(),
          ),
        ],
      ),
      floatingActionButton: Container(
          padding: EdgeInsets.symmetric(horizontal: horizon),
          width: double.infinity,
          child: outlinePink(context, '接受', () {
            Get.back();
          })),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
