import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jvtd_shop_client/commons/constants/string.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 首页列表的header
class HomeRefreshHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var strings = RefreshLocalizations.of(context)?.currentLocalization ??
        EnRefreshString();
    return ClassicHeader(
      canTwoLevelText: KString.refreshTwoLevel,
      textStyle: TextStyle(color: Colors.white),
//      outerBuilder: (child) => HomeSecondFloorOuter(child),
      twoLevelView: Container(),
      height: 70 + MediaQuery.of(context).padding.top / 3,
//      refreshingIcon: ActivityIndicator(brightness: Brightness.dark),
      releaseText: strings.canRefreshText,
    );
  }
}

/// 通用的footer
///
/// 由于国际化需要context的原因,所以无法在[RefreshConfiguration]配置
class RefresherFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClassicFooter(
      //注意这里的footer因为axisDirection设置的关系是在屏幕上端，从而实现下拉加载消息历史
      loadingText: "加载中...",
      idleText: "",
      canLoadingText: "松开开始加载数据", //提示信息
      canLoadingIcon:Icon(Icons.arrow_downward,color:Colors.transparent,size: 20),//提示图标
      idleIcon:Icon(Icons.arrow_downward,color:Colors.transparent,size: 20),
      spacing: 5,
//      failedText: KString.loadMoreFailed,
//      idleText: KString.loadMoreIdle,
//      loadingText: KString.loadMoreLoading,
//      noDataText: KString.loadMoreNoData,
    );
  }
}
