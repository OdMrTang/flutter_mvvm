import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jvtd_shop_client/commons/constants/config.dart';
import 'package:jvtd_shop_client/commons/managers/provider_manager.dart';
import 'package:jvtd_shop_client/commons/managers/storage_manager.dart';
import 'package:jvtd_shop_client/commons/routers/app_router.dart';
import 'package:jvtd_shop_client/commons/routers/router.dart';
import 'package:jvtd_shop_client/commons/utils/custom_hide_keyboard.dart';
import 'package:jvtd_shop_client/uis/pages/splash_page.dart';
import 'package:jvtd_shop_client/view_model/theme_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  await StorageManager.init();
  runApp(App());
  // Android状态栏透明 splash为白色,所以调整状态栏文字为黑色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child: Consumer<ThemeViewModel>(builder: (context, themeModel, child) {
          return RefreshConfiguration(
            hideFooterWhenNotFull: true, //列表数据不满一页,不触发加载更多
            child: Opacity(
              opacity: 0.9,
              child: CustomHideKeyboard(
                child: Center(
                  child: ScreenUtilInit(
                      designSize: Size(Config.DESIGNSIZE_WIDTH, Config.DESIGNSIZE_HEIGHT),
                      builder: () => MaterialApp(
                          debugShowCheckedModeBanner: false,
                          builder: BotToastInit(),
                          navigatorObservers: [BotToastNavigatorObserver()],
                          theme: themeModel.themeData(),
                          darkTheme:
                          themeModel.themeData(platformDarkMode: true),
                          localizationsDelegates: const [
                            // S.delegate,
                            RefreshLocalizations.delegate, //下拉刷新
                            // GlobalCupertinoLocalizations.delegate,
                            // GlobalMaterialLocalizations.delegate,
                            // GlobalWidgetsLocalizations.delegate
                          ],
                          initialRoute: RouteName.login,
                          //路由跳转地址
                          onGenerateRoute: onGenerateRoute,
                          //配置路由
                          // supportedLocales: KString. S.supportedLocales.supportedLocales,
                          home: SplashPage())),
                ),
              ),
            ),
          );
        }));
  }
}
