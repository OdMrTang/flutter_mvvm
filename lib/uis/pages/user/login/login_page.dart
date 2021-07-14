import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jvtd_shop_client/commons/utils/status_bar_utils.dart';
import 'package:jvtd_shop_client/uis/pages/user/login/login_phone_code_panel.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

import 'login_username_password_panel.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with AutomaticKeepAliveClientMixin
{
  @override
  bool get wantKeepAlive => true;


  @override
  void dispose() {
    valueNotifier.dispose();
    super.dispose();
  }
  int tabIndex;
  TabController tabController;
  List<String> tabs = ['密码登录', '验证码登录'];
  ValueNotifier<int> valueNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //获取主题颜色
    var primaryColor = Theme.of(context).primaryColor;
    //使用AnnotatedRegion包裹Scaffold，可以使得状态栏颜色改变，有dark和light两种
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: StatusBarUtils.systemUiOverlayStyle(context),
      child: ValueListenableProvider<int>.value(
        value: valueNotifier,
        child: DefaultTabController(
          length: tabs.length,
          initialIndex: valueNotifier.value,
          child: Builder(
            builder: (context) {
              if (tabController == null) {
                tabController = DefaultTabController.of(context);
                tabController.addListener(() {
                  valueNotifier.value = tabController.index;
                });
              }
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  actions: <Widget>[
                    RaisedButton(
                      elevation: 0,
                      focusElevation: 0,
                      child: Text(
                        "注册",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                      color: primaryColor,//设置北京颜色
                      disabledColor: primaryColor,//设置点击颜色
                      onPressed: () {
                        // Navigator.of(context).pushNamed(RouteName.register);
                      },
                    )
                  ],
                  centerTitle: true,
                  title: const Text('登录'),
                  bottom: new TabBar(
                    isScrollable: true,
                    indicatorPadding:EdgeInsets.only(bottom: 5),
                    tabs: tabs.map((choice) {
                      return new Tab(
                        text: choice,
                      );
                    }).toList(),
                  ),
                ),
                body: TabBarView(
                  children: [
                    LoginUsernamePasswordPanel(),
                    LoginPhoneCodePanel()
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
