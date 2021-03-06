import 'package:jvtd_shop_client/commons/nets/http.dart';
import 'package:jvtd_shop_client/models/campus_code_info_model.dart';
import 'package:jvtd_shop_client/models/user_model.dart';

class WalletRepository {
  static Future withdraw(code) async {
    var response = await http.netFetch('withdraw/', method: 'post', params: {
      'code': code
    });
    return response.data;
  }

  static Future updateWithdrawAccount({String alipayAccount, String wxPayAccount, User user}) async {
    var response = await http.netFetch('withdraw_account/1/', method: 'put', params: {
      "aly_pay_account": alipayAccount == null ? user.withdrawaccount.alyPayAccount: alipayAccount,
      "weixin_pay_account": wxPayAccount == null ? user.withdrawaccount.weixinPayAccount: wxPayAccount
    });
    return response.data;
  }

  static Future fetchCampusCodeInfoDetail({int page, int year, int month}) async {
    var response = await http.netFetch('campuscodeinfos/',
        params: {
          "page": page == null ? 1 : page,
          "year": year == null ? '' : year,
          "month": month == null ? '' : month
        },
        method: 'get');
    return CampusCodeInfoListModel.fromJson(response.data).data.data;
  }

  static Future fetchCampusCodeInfo({int year, int month}) async {
    var response = await http.netFetch('campuscodeinfos/',
        params: {
          "page": 1,
          "year": year == null ? '' : year,
          "month": month == null ? '' : month
        },
        method: 'get');
    return CampusCodeInfoListModel.fromJson(response.data).data;
  }
}
