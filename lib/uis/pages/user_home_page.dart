import 'package:flutter/material.dart';
import 'package:jvtd_shop_client/providers/provider_widget.dart';
import 'package:jvtd_shop_client/view_model/user/user_home_view_model.dart';

//用户主页
class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<UserHomeViewModel>(
        builder: (context, model, child) {
          return Container(
            child: Center(
              child: Text("我的"),
            ),
          );
        },
        model: UserHomeViewModel());
  }
}
