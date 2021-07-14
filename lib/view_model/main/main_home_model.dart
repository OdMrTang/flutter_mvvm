
import 'package:jvtd_shop_client/providers/view_state_model.dart';

class MainHomeModel extends ViewStateModel{

  //更新值
  String _value = "首页";
  String get value => _value;

  refresh(){
    _value = "这是更新后的值";
    this.notifyListeners();
  }

}