import 'package:flutter/cupertino.dart';
import 'package:jvtd_shop_client/commons/constants/config.dart';
import 'package:jvtd_shop_client/commons/managers/storage_manager.dart';
import 'package:jvtd_shop_client/models/user_model.dart';
import 'package:jvtd_shop_client/service/user_repository.dart';
import 'package:jvtd_shop_client/service/wallet_repository.dart';
import 'package:bot_toast/bot_toast.dart';

class UserViewModel extends ChangeNotifier {
  static const String kUser = Config.USER_KEY;

  User _user;

  User get user => _user;

  bool get hasUser => user != null;

  UserModel() {
    var userMap = StorageManager.localStorage.getItem(kUser);
    // _user = userMap != null ? User.fromJson(userMap) : null;
    _user = userMap != null ? User.fromJson(userMap) : User.testData();
  }

  saveUser(User user) {
    _user = user;
    notifyListeners();
    StorageManager.localStorage.setItem(kUser, user);
  }

  /// 清除持久化的用户数据
  clearUser() async {
    _user = null;
    notifyListeners();
    await StorageManager.localStorage.deleteItem(kUser);
    await StorageManager.sharedPreferences.remove(Config.IS_LOGIN_KEY);
    await StorageManager.sharedPreferences.remove(Config.VERIFYING_STATUS);
  }

  openOrCloseShop(context) async {
    int shopId = user.shop.id;
    String username = user.username;
    bool isOpen = user.shop.isOpen;
    try {
      await UserRepository.updateUserShopInfo(shopId, {
        "is_open": !isOpen,
      });
    } catch (e) {
      Future.microtask(() {
        BotToast.showText(text:e.response.data[0]);
      });
    }
    var newUser = await UserRepository.getUserInfo(username);
    saveUser(newUser);
  }

  refreshUserInfo() async {
    String username = "clear";
    var newUser = await UserRepository.getUserInfo(username);
    saveUser(newUser);
  }

  updateUserShopInfo(data, context) async {
    int shopId = user.shop.id;
    String username = user.username;
    try {
      await UserRepository.updateUserShopInfo(shopId, data);
      var newUser = await UserRepository.getUserInfo(username);
      saveUser(newUser);
      Future.microtask(() {
        BotToast.showText(text:"信息修改成功！");
      });
    } catch (e) {
      Future.microtask(() {
        BotToast.showText(text:e.response.data[0]);
      });
    }

  }

  updateUserWithdrawAccount(context, {String alipayAccount, String wxPayAccount}) async {
    String username = user.username;
    try {
      await WalletRepository.updateWithdrawAccount(alipayAccount: alipayAccount, wxPayAccount: wxPayAccount, user: user);
      var newUser = await UserRepository.getUserInfo(username);
      saveUser(newUser);
      Future.microtask(() {
        BotToast.showText(text:"信息修改成功！");
      });
    } catch (e) {
      Future.microtask(() {
        BotToast.showText(text:e.response.data[0]);
      });
    }
  }

}
