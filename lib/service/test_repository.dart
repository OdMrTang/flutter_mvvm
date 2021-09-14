import 'package:jvtd_shop_client/commons/nets/http.dart';
import 'package:jvtd_shop_client/models/test_home_model.dart';

class TestRepository{

  static Future createSearch(key) async {
    var response = await http
        .netFetch('default/index?store_id=2&_platform=wx', method: 'get', params: {'key': key});
    return HomeModel.fromJson(response.data);
  }

}