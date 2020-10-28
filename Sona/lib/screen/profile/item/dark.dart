import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/widget/space.dart';

class ItemDarkWidget extends StatefulWidget {
  ItemDarkWidget({Key key}) : super(key: key);

  @override
  _ItemDarkWidgetState createState() => _ItemDarkWidgetState();
}

class _ItemDarkWidgetState extends State<ItemDarkWidget> {
  bool dark = false;

  Widget darkSwitch() => Switch(
        activeColor: Theme.of(context).buttonColor,
        value: this.dark,
        onChanged: (v) {
          setState(() {
            this.dark = v;
          });
        },
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Container(
                child: Icon(Icons.dashboard),
              ),
              Container(
                height: horizon,
              )
            ],
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
              padding: EdgeInsets.fromLTRB(horizon, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Dark Theme',
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(right: horizon / 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [darkSwitch()],
                          ),
                        ),
                      )
                    ],
                  ),
                  paddingLine(context, horizon)
                ],
              )),
        ),
      ],
    );
  }
}
