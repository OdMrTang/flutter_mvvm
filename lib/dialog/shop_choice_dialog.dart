import 'package:jvtd_shop_client/commons/constants/index.dart';

class ShopChoiceDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        color: Colors.transparent,
        child: ListView(
          children: [
            shopChoiceItem(context, true),
            shopChoiceItem(context, false),
            shopChoiceItem(context, false),
          ],
        ),
      ),
    );
  }

  Widget shopChoiceItem(BuildContext context, bool isChoose) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.sp),
        color: Colors.white,
        child: Container(
          height: 106.h,
          alignment: Alignment.centerLeft,
          decoration: DecorationStyles.boxDecorationBottomRadius,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "微赢家精选",
                style: TextStyles.text333Size28,
              ),
              if (isChoose)
                Container(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                      ImageHelper.wrapAssets('shop_choose_icon.png'),
                      width: 34.w,
                      height: 26.h,
                      fit: BoxFit.contain),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
