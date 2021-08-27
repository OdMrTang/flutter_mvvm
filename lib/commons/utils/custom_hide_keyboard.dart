import 'package:flutter/cupertino.dart';

class CustomHideKeyboard extends StatelessWidget {

  final Widget child;
  CustomHideKeyboard({@required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: child
    );
  }

}