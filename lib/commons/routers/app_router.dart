import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jvtd_shop_client/commons/routers/page_router_anim.dart';
import 'package:jvtd_shop_client/commons/routers/router.dart';
import 'package:jvtd_shop_client/uis/pages/customer_service/customer_service_home_page.dart';
import 'package:jvtd_shop_client/uis/pages/main/main_home_page.dart';
import 'package:jvtd_shop_client/uis/pages/order/order_home_page.dart';
import 'package:jvtd_shop_client/uis/pages/shop/choice/shop_choice_page.dart';
import 'package:jvtd_shop_client/uis/pages/splash_page.dart';
import 'package:jvtd_shop_client/uis/pages/tab/tab_nav_page.dart';
import 'package:jvtd_shop_client/uis/pages/user/login/login_phone_code.dart';
import 'package:jvtd_shop_client/uis/pages/user_home_page.dart';

//配置路由
final routes = {
  RouteName.splash : (context) => SplashPage(),//跳转到启动页
  RouteName.login : (context) => LoginPhoneCodePage(),//跳转到启动页
  RouteName.tab : (context) => TabNavigator(),//跳转到tab页面
  RouteName.main : (context) => MainHomePage(),//跳转到启动页
  RouteName.customerService : (context) => CustomerServiceHomepage(),//跳转到启动页
  RouteName.order : (context) => OrderHomePage(),//跳转到启动页
  RouteName.user : (context) => UserHomePage(),//跳转到启动页
  RouteName.shopChoice : (context) => ShopChoicePage(),//跳转到启动页
};

//固定写法
// ignore: missing_return, top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
// 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
      MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
//
// class Routers {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     print("enter routers ...'");
//     switch (settings.name) {
//       case RouteName.splash:
//         return NoAnimRouteBuilder(SplashPage());
//       case RouteName.login:
//         return CupertinoPageRoute(builder: (_) => LoginPhoneCodePage());
//       case RouteName.tab:
//         return CupertinoPageRoute(builder: (_) => TabNavigator());
//       case RouteName.main:
//         return CupertinoPageRoute(builder: (_) => MainHomePage());
//       case RouteName.customerService:
//         return CupertinoPageRoute(builder: (_) => CustomerServiceHomepage());
//       case RouteName.order:
//         return CupertinoPageRoute(builder: (_) => OrderHomePage());
//       case RouteName.user:
//         return CupertinoPageRoute(builder: (_) => UserHomePage());
//       case RouteName.shopChoice://商铺选择
//         return CupertinoPageRoute(builder: (_) => ShopChoicePage());
//       default:
//         return CupertinoPageRoute(
//             builder: (_) => Scaffold(
//                   body: Center(
//                     child: Text('No route defined for ${settings.name}'),
//                   ),
//                 ));
//     }
//   }
// }
