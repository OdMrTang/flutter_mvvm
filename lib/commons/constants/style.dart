import 'index.dart';


class TextStyles {
  static const TextStyle textSize12 = const TextStyle(
    fontSize: Dimens.font_sp12,
  );

  //字体大小32 颜色 黑色 333
  static TextStyle text333Size32 = TextStyle(
      fontSize: 32.sp, color: KColor.loginBottonTextColor);


  //字体大小34 颜色 黑色 333
  static TextStyle text333Size34 = TextStyle(
      fontSize: 34.sp, color: KColor.loginBottonTextColor);

  //字体大小24 颜色 黑色 333
  static TextStyle text333Size24 = TextStyle(
      fontSize: 24.sp, color: KColor.loginBottonTextColor);

  //字体大小28 颜色 黑色 333
  static TextStyle text333Size28 = TextStyle(
      fontSize: 28.sp, color: KColor.loginBottonTextColor);

  //字体大小28 颜色 灰色 333
  static TextStyle text999Size24 =
      TextStyle(fontSize: 24.sp, color: KColor.color_999);

  //字体大小24 颜色 红色 333
  static TextStyle text001Size24 =
      TextStyle(fontSize: 24.sp, color: KColor.color_001);

  //字体大小48 颜色 黑色 333 加粗
  static TextStyle text333Size48 = TextStyle(
      fontSize: 48.sp,
      color: KColor.loginBottonTextColor,
      fontWeight: FontWeight.w500);
}

class DecorationStyles {
  //水平渐变 颜色 主题白色 圆角8
  static BoxDecoration decorationff4Cir8 = BoxDecoration(
    color: KColor.color_cf4,
    borderRadius: BorderRadius.circular(8),
  );

  // 颜色 主题浅黄 圆角8
  static BoxDecoration decoration0laCir8 = BoxDecoration(
    color: KColor.color_01a,
    borderRadius: BorderRadius.circular(8),
  );

  // 颜色 主题黄色
  static BoxDecoration decorationThemeCir19 = BoxDecoration(
    color: KColor.splashColor,
    borderRadius: BorderRadius.circular(19),
  );

  // 颜色 白色 圆角8
  static BoxDecoration decorationWhiteCir8 = BoxDecoration(
    color: KColor.color_fff,
    borderRadius: BorderRadius.circular(8),
  );

  // 颜色 白色 圆角8
  static BoxDecoration decorationWhiteCir32 = BoxDecoration(
    color: KColor.color_fff,
    borderRadius: BorderRadius.circular(32),
  );

  // 颜色 黄色 右边圆角8
  static BoxDecoration decorationThemeCir8 = BoxDecoration(
      color: KColor.splashColor, borderRadius: BorderRadius.circular(8));

  // 颜色 854浅黄色 右边圆角32
  static BoxDecoration decoration854Cir32 = BoxDecoration(
      color: KColor.color_854,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(32), bottomRight: Radius.circular(32)));

  //只有bottom有border
  static BoxDecoration boxDecorationBottomWhiteRadius = BoxDecoration(
      color: KColor.color_fff,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)));

  //只有bottom有border
  static BoxDecoration boxDecorationBottomRadius = BoxDecoration(
      color: Colors.white,
      border: Border(bottom: BorderSide(width: 1, color: KColor.color_e6)));
}
