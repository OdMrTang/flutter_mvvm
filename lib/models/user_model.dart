import 'package:jvtd_shop_client/models/shop_model.dart';
import 'package:jvtd_shop_client/models/withdraw_account_model.dart';

class User {
  Shop shop;
  WithdrawaccountModel withdrawaccount;
  String username;
  int id;
  var timeCode;
  var campusCode;

  User(
      {this.shop, this.username, this.id, this.timeCode, this.campusCode, this.withdrawaccount});

  User.fromJson(Map<String, dynamic> json) {
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
    username = json['username'];
    id = json['id'];
    timeCode = json['time_code'];
    campusCode = json['campus_code'];
    withdrawaccount = json['withdrawaccount'] != null
        ? new WithdrawaccountModel.fromJson(json['withdrawaccount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shop != null) {
      data['shop'] = this.shop.toJson();
    }
    data['username'] = this.username;
    data['id'] = this.id;
    data['time_code'] = this.timeCode;
    data['campus_code'] = this.campusCode;
    if (this.withdrawaccount != null) {
      data['withdrawaccount'] = this.withdrawaccount.toJson();
    }
    return data;
  }

  //自造数据，用来展示
  static testData(){
    WithdrawaccountModel mWithdrawaccount = WithdrawaccountModel(id:1001,alyPayAccount: '100',weixinPayAccount:'101',
        date:'2020-10-10',updateDate:'2020-10-11',user:11);
    Shop mShop = Shop(isOpen: true,likeCommentNum: 100 , commentNumSum: 98);
    User mUser = User(shop:mShop,username:"张三",id:1,timeCode:'12',campusCode:'23',withdrawaccount:mWithdrawaccount);
    return mUser;
  }


}
