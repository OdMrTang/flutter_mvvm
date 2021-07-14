import 'package:jvtd_shop_client/commons/constants/index.dart';

//用户购买信息
class MainMiddleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: KColor.splashColor,
      padding: EdgeInsets.only(bottom: 20.h),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 22.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: KColor.color_854,
              width: 44.w,
              alignment: Alignment.centerLeft,
              child: Image.asset(ImageHelper.wrapAssets('shop_user_icon.png'),
                  width: 44.w,
                  height: 44.w,
                  fit: BoxFit.contain),
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: 44.w,
              padding: EdgeInsets.only(left:2,right: 16.w),
              decoration: DecorationStyles.decoration854Cir32,
              child: Text("xxx昨天购买了一件昂贵的商品",style: TextStyles.text333Size24,),
            )
          ],
        ),
      ),
    );
  }

}
