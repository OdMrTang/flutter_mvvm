import 'package:jvtd_shop_client/view_model/theme_view_model.dart';
import 'package:jvtd_shop_client/view_model/user/login_view_model.dart';
import 'package:jvtd_shop_client/view_model/user/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
];

/// 独立的model
List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<ThemeViewModel>(
    create: (context) => ThemeViewModel(),
  ),
  ChangeNotifierProvider<UserViewModel>(
    create: (context) => UserViewModel(),
  ),
  ChangeNotifierProvider<LoginViewModel>(
    create: (context) => LoginViewModel(),
  ),
];
