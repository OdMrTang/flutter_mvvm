import 'package:jvtd_shop_client/models/test_home_model.dart';
import 'package:jvtd_shop_client/providers/view_state_refresh_list_with_date_filter.dart';
import 'package:jvtd_shop_client/service/test_repository.dart';

class OrderHomeViewModel extends ViewStateRefreshListDateFilterModel{

  List<String> _dataList = [];
  List<String> get dataList => _dataList;

  int count = 20;

  @override
  Future<List> loadData({int pageNum}) async{
    // TODO: implement loadData
    _dataList = await Future.delayed(Duration(seconds: 2),(){
      List<String> _testData = [];
      for(int i=0;i<count;i++){
        _testData.add("data${i}");
      }
      count --;
      return _testData;
    });
    refreshSystemMessageNum();
    return _dataList;
  }

  @override
  initData() {
    // TODO: implement initData
    return super.initData();
  }

  @override
  onCompleted(List data) {
    // TODO: implement onCompleted
    return super.onCompleted(data);
  }

  ///测试api
  refreshSystemMessageNum() async {
    Map<String, dynamic> key = Map<String, dynamic>();
    key = {
      "page_id": "2"
    };
    HomeModel response  = await TestRepository.createSearch(key);
    notifyListeners();
  }

}