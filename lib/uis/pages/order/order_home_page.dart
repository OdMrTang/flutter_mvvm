import 'package:flutter/material.dart';
import 'package:jvtd_shop_client/providers/provider_widget.dart';
import 'package:jvtd_shop_client/providers/view_state_widget.dart';
import 'package:jvtd_shop_client/uis/helpers/refresh_helper.dart';
import 'package:jvtd_shop_client/view_model/order/order_home_view_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

//订单首页
class OrderHomePage extends StatefulWidget {
  @override
  _OrderHomePageState createState() => _OrderHomePageState();
}

class _OrderHomePageState extends State<OrderHomePage> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<OrderHomeViewModel>(
        onModelReady: (model) => model.initData(),
        builder: (context, model, child) {
          // if (model.busy) {
          //   //正在加载中
          //   return ViewStateBusyWidget();
          // }
          return SafeArea(
              child: SmartRefresher(
            controller: model.refreshController,
            header: WaterDropMaterialHeader(
              semanticsValue: "22222",
              semanticsLabel: "111111",
            ),
            footer: RefresherFooter(),
            onRefresh: model.refresh,
            onLoading: model.loadMore,
            enablePullUp: true,
            //是否允许上啦加载更多
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 80,
                  child: Text("${index.toString()}" + model.list[index]),
                );
              },
              itemCount: model.list.length,
            ),
          ));
        },
        model: OrderHomeViewModel());
  }
}
