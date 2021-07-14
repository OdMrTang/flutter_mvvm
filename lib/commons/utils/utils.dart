import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils{

  //Flutter十六进制颜色转换成颜色对象
  static Color hexToColor(String s) {
    // 如果传入的十六进制颜色值不符合要求，返回默认值
    if (s == null ||
        s.length != 7 ||
        int.tryParse(s.substring(1, 7), radix: 16) == null) {
      s = '#999999';
    }

    return new Color(int.parse(s.substring(1, 7), radix: 16) + 0xFF000000);
  }

  //打开展示dialog
  static openIDialog(BuildContext context,Widget widget,EdgeInsetsGeometry edgeInsetsGeometry){
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Color(0x3e000000),
        barrierLabel: MaterialLocalizations.of(context)
            .modalBarrierDismissLabel,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, secondaryAnimation) =>
            SlideTransition(
              //底部弹出动画
                position: Tween<Offset>(
                    begin: Offset(0.0, 1.0),
                    end: Offset(0.0, 0.0))
                    .animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.fastOutSlowIn)),
                child: Container(
                  margin: edgeInsetsGeometry,
                  child: widget,
                )));
  }

}