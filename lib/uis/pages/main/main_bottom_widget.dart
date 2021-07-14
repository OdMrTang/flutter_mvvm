import 'package:jvtd_shop_client/commons/constants/index.dart';


//用户购买信息
class MainBottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        mainBottomItemWidet(context),
        mainBottomItemWidet(context),
        mainBottomItemWidet(context),
        mainBottomItemWidet(context),
        mainBottomItemWidet(context),
        mainBottomItemWidet(context),
        mainBottomItemWidet(context),
      ],
    );
  }

  Widget mainBottomItemWidet(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
          left: 26.h,
          right: 26.h,
          top: 26.h),
      decoration: DecorationStyles.decorationWhiteCir8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 200.w,
            height: 200.w,
            margin: EdgeInsets.only(
                right: 16.w,
                top: 20.w,
                bottom: 20.w,
                left: 20.w),
            child: Image.asset(ImageHelper.wrapAssets('main_shop_icon.png'),
                width: 40.w,
                height: 40.w,
                fit: BoxFit.contain),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 430.w,
                child: Text(
                  "高级莫兰迪色系 臻密绒磨毛四件套高级莫兰",
                  style: TextStyles.text333Size28,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 8.h,
                    bottom: 38.h),
                child: Text(
                  "厂家直供，买一套少一套",
                  style: TextStyles.text999Size24,
                ),
              ),
              Container(
                width: 430.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "￥800.00~900.00",
                      style: TextStyles.text001Size24,
                    ),
                    InkWell(
                      onTap: (){
                        Utils.openIDialog(context, ShopGoodsShareDialog(), EdgeInsets.only(top: 40));
                      },
                      child: Container(
                        width: 44.w,
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                            ImageHelper.wrapAssets('weChat_icon.png'),
                            width: 40.w,
                            height: 40.w,
                            fit: BoxFit.contain),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
