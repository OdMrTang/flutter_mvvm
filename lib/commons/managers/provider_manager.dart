import 'package:jvtd_shop_client/view_model/theme_model.dart';
import 'package:jvtd_shop_client/view_model/user/user_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  // ...uiConsumableProviders
];

/// 独立的model
List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<ThemeModel>(
    create: (context) => ThemeModel(),
  ),
  ChangeNotifierProvider<UserModel>(
    create: (context) => UserModel(),
  ),
  ChangeNotifierProvider<UserModel>(
    create: (context) => UserModel(),
  ),
];

/// 需要依赖的model
///
/// UserModel依赖globalFavouriteStateModel
//List<SingleChildCloneableWidget> dependentServices = [
//  ChangeNotifierProxyProvider<GlobalFavouriteStateModel, UserModel>(
//    create: null,
//    update: (context, globalFavouriteStateModel, userModel) =>
//    userModel ??
//        UserModel(globalFavouriteStateModel: globalFavouriteStateModel),
//  )
//];

List<SingleChildWidget> uiConsumableProviders = [
//  StreamProvider<User>(
//    builder: (context) => Provider.of<AuthenticationService>(context, listen: false).user,
//  )
];
