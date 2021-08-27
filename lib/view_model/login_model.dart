import 'package:jvtd_shop_client/commons/constants/index.dart';
import 'package:jvtd_shop_client/providers/view_state_model.dart';

//登录viewModel
class LoginModel extends ViewStateModel {
  //初始化请求
  initData() {
    setBusy();
    Future.delayed(Duration(seconds: 5)).then((value) => setIdle());
  }

  //登录请求
  login(BuildContext context) {
    setBusy();
    Future.delayed(Duration(seconds: 2)).then((value) {
      setIdle();
      Navigator.of(context).pushNamed(RouteName.tab);
    });
  }
}
