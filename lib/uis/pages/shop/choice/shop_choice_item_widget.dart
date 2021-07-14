import 'package:jvtd_shop_client/commons/constants/index.dart';

class ShopChoiceItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushReplacementNamed(RouteName.main);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 144.h,
        margin: EdgeInsets.only(
            bottom: 32.h),
        padding: EdgeInsets.only(
            left: 36.w,
            right: 50.w),
        alignment: Alignment.centerLeft,
        decoration: DecorationStyles.decorationff4Cir8,
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: DecorationStyles.decorationThemeCir19,
              margin: EdgeInsets.only(right: 24),
            ),
            Text("微赢家赢商城",
                style: TextStyle(
                    fontSize: 36.sp,
                    color: KColor.loginBottonTextColor)),
            Expanded(
                child: Container(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.chevron_right,
                size: 14,
                color: Colors.grey,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
