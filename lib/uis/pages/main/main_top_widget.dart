import 'package:jvtd_shop_client/commons/constants/index.dart';

//上部信息
class MainTopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: KColor.splashColor,
      child: Container(
        decoration: DecorationStyles.decoration0laCir8,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 32.w),
        height: 172.h,
        child: Wrap(
          children: [
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(RouteName.tab);
              },
              child: releaseAndCenter(context,"release_icon.png","一键发布"),
            ),
            orderAndCustomer(context,"2","订单"),
            orderAndCustomer(context,"1","客户"),
            releaseAndCenter(context,"shop_user_icon.png","商家中心"),
          ],
        ),
      ),
    );
  }

  //一键发布 商家中心
  Widget releaseAndCenter(BuildContext context,String leftIcon, String rightText) {
    return Container(
      width: (MediaQuery.of(context).size.width - 64.w) / 4,
      height: 172.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,//设置居中
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 18.h),
            child: Image.asset(ImageHelper.wrapAssets(leftIcon),
                width: 64.w,
                height: 64.w,
                fit: BoxFit.contain),
          ),
          Container(
            child: Text(
              rightText,
              style: TextStyles.text333Size24,
            ),
          )
        ],
      ),
    );
  }

  //订单 客户
  Widget orderAndCustomer(BuildContext context,String leftText, String rightText) {
    return Container(
      width: (MediaQuery.of(context).size.width - 64.w) / 4,
      height: 172.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,//设置居中
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 18.h),
            child: Text(
              leftText,
              style: TextStyles.text333Size48,
            )
          ),
          Container(
            child: Text(
              rightText,
              style: TextStyles.text333Size24,
            ),
          )
        ],
      ),
    );
  }

}
