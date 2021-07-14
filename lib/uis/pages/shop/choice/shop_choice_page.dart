import 'package:jvtd_shop_client/commons/constants/index.dart';

//店铺选择
class ShopChoicePage extends StatefulWidget {
  @override
  _ShopChoicePageState createState() => _ShopChoicePageState();
}

class _ShopChoicePageState extends State<ShopChoicePage> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ShopChoiceModel>(
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: KColor.splashColor,
              body: Container(
                padding: EdgeInsets.only(
                    left: 80.w,
                    right: 80.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, //设置左对齐
                  children: [
                    Container(
                      height: 196.h,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          top: 134.h,
                          bottom: 24.h),
                      child: Image.asset(ImageHelper.wrapAssets('shop_user_icon.png'),
                          fit: BoxFit.contain),
                    ),
                    Text("Hi,阿七",
                        style: TextStyle(
                            fontSize: 40.sp,
                            color: KColor.loginBottonTextColor,
                            fontWeight: FontWeight.w500)),
                    Container(
                      margin: EdgeInsets.only(
                          top: 16.sp),
                      child: Text("您已开通3个店铺，请选择登录",
                          style: TextStyle(
                              fontSize: 32.sp,
                              color: KColor.loginBottonTextColor)),
                    ),
                    Expanded(
                        child: ListView(
                      shrinkWrap: true,
                      children: [
                        ShopChoiceItemWidget(),
                        ShopChoiceItemWidget(),
                        ShopChoiceItemWidget(),
                      ],
                    ))
                  ],
                ),
              ));
        },
        model: ShopChoiceModel());
  }
}
