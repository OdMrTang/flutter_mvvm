import 'package:flutter/material.dart';
import 'package:jvtd_shop_client/providers/provider_widget.dart';
import 'package:jvtd_shop_client/view_model/customer_service/customer_service_home_view_model.dart';

//客服主页
class CustomerServiceHomepage extends StatefulWidget {
  @override
  _CustomerServiceHomepageState createState() =>
      _CustomerServiceHomepageState();
}

class _CustomerServiceHomepageState extends State<CustomerServiceHomepage> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<CustomerServiceHomeViewModel>(
        builder: (context, model, child) {
          return Container(
            child: Center(
              child: Text("客服"),
            ),
          );
        },
        model: CustomerServiceHomeViewModel());
  }
}
