import 'package:jvtd_shop_client/commons/constants/index.dart';
import 'package:jvtd_shop_client/providers/view_state_model.dart';
import 'package:jvtd_shop_client/service/test_repository.dart';

//登录viewModel
class LoginViewModel extends ViewStateModel {
  //初始化模拟请求
  initData() {
    TestRepository.createSearch("1");
    setBusy();
    Future.delayed(Duration(seconds: 5)).then((value) => setIdle());
  }

  //模拟登录请求
  login(BuildContext context) {
    setBusy();
    Future.delayed(Duration(seconds: 2)).then((value) {
      setIdle();
      Navigator.of(context).pushNamed(RouteName.tab);
    });
  }
}
