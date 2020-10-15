import 'package:example/common/style/_contain.dart';
import 'package:example/common/style/_ui.dart';
import 'package:example/widgets/brand/brand.dart';
import 'package:example/widgets/button/primaryButton.dart';
import 'package:example/widgets/gradient/linear.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 文本框装饰
InputDecoration inputDecoration(BuildContext context, String hintTxt) {
  Color inputColor = Theme.of(context).backgroundColor;

  TextStyle inputSub = Theme.of(context)
      .textTheme
      .bodyText2
      .copyWith(fontSize: 20, color: Theme.of(context).hintColor);

  return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 0),
      fillColor: inputColor.withOpacity(0.8),
      focusColor: inputColor.withOpacity(0.8),
      hoverColor: inputColor.withOpacity(0.8),
      hintText: hintTxt,
      hintStyle: inputSub,
      prefixStyle: inputSub,
      helperStyle: inputSub.copyWith(fontSize: 14),
      suffixStyle: inputSub,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      border: InputBorder.none,
      suffix: null,
      prefix: null,
      counterText: '',
      prefixText: null,
      suffixText: null);
}

// 名字模版
class NamedPanel extends StatefulWidget {
  NamedPanel({Key key}) : super(key: key);

  @override
  _NamedPanelState createState() => _NamedPanelState();
}

class _NamedPanelState extends State<NamedPanel> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _nickNameController = TextEditingController();

  String firstName = '';
  String lastName = '';
  String nickName = '';

  void fromSubmit() {
    print('准备提交 =======》');

    if ((_formKey.currentState as FormState).validate()) {
      if (firstName == '') {
        print('firstName 为空');
      }
      if (lastName == '') {
        print('lastName 为空');
      }
      if (nickName == '') {
        print('nickName 为空');
      }
    }
  }

  Widget grandientInput(TextField _txt, String helperTxt,
          [bool helper = false]) =>
      Column(
        children: [
          _txt,
          Container(
            decoration: BoxDecoration(gradient: geadientLinear(context, 0.8)),
            height: 1,
          ),
          helper
              ? Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: distance),
                  child: Text(
                    helperTxt,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Theme.of(context).hintColor),
                  ),
                )
              : Container(
                  height: 0,
                ),
          SizedBox(
            height: horizon / 2,
          )
        ],
      );

  Widget namedForm() {
    return Form(
        key: _formKey,
        autovalidate: true,
        child: Column(
          children: [
            grandientInput(
                TextField(
                  decoration: inputDecoration(context, '名字 *'),
                  maxLength: 20,
                  maxLines: 1,
                  cursorColor:
                      Theme.of(context).primaryColorDark.withOpacity(0.2),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 24),
                  autofocus: true,
                  obscureText: false,
                  controller: _firstNameController,
                  onChanged: (String v) {
                    String e = v.trim().length < 1 ? null : '';
                    if (e != null) {
                      this.firstName = v;
                    }
                    print('e = ${e}, v = ${v}');
                  },
                ),
                ''),
            grandientInput(
                TextField(
                  decoration: inputDecoration(context, '姓 *'),
                  maxLength: 20,
                  maxLines: 1,
                  cursorColor:
                      Theme.of(context).primaryColorDark.withOpacity(0.2),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 24),
                  autofocus: true,
                  obscureText: false,
                  controller: _lastNameController,
                  onChanged: (String v) {
                    String e = v.trim().length < 1 ? null : '';
                    if (e != null) {
                      this.lastName = v;
                    }
                    print('e = ${e}, v = ${v}');
                  },
                ),
                '与香港身份证上的相同',
                true),
            grandientInput(
                TextField(
                  decoration: inputDecoration(context, '显示名称 *'),
                  maxLength: 20,
                  maxLines: 1,
                  cursorColor:
                      Theme.of(context).primaryColorDark.withOpacity(0.2),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 24),
                  autofocus: true,
                  obscureText: false,
                  controller: _nickNameController,
                  onChanged: (String v) {
                    String e = v.trim().length < 1 ? null : '';
                    if (e != null) {
                      this.nickName = v;
                    }
                    print('e = ${e}, v = ${v}');
                  },
                ),
                ''),
          ],
        ));
  }

  Widget namedPanel() => Container(
        padding: EdgeInsets.symmetric(
            horizontal: horizon * 2, vertical: horizon * 3),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: horizon * 2),
              child: Text(
                '请于下方填写你的详细资料',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            namedForm(),
            Padding(
              child: primaryButton(context, '开始', fromSubmit),
              padding: EdgeInsets.symmetric(vertical: horizonL * 2),
            )
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return namedPanel();
  }
}

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).backgroundColor,
          ),
          onTap: () => Get.back(),
        ),
        title: Text(
          '注册',
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          children: [linearLine(context), NamedPanel()],
        ),
      ),
    );
  }
}
