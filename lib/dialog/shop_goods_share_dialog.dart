import 'package:jvtd_shop_client/commons/constants/index.dart';

class ShopGoodsShareDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: DecorationStyles.decorationThemeCir8,
              margin: EdgeInsets.only(
                left: 40.w,
                right: 40.w,
                bottom: 30.h,
                top: 70.h,
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(40.r),
                    child: Column(
                      children: [
                        Row(
                          //商品名称
                          children: [
                            Container(
                              width: 64.w,
                              height: 64.h,
                              decoration: DecorationStyles.decorationWhiteCir32,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 22.w),
                              child: Text("微赢家精选",
                                  style: TextStyles.text333Size32),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          decoration: DecorationStyles.decorationWhiteCir8,
                          width: 480.r,
                          height: 480.r,
                          padding: EdgeInsets.all(7),
                          child: Image.asset(
                              ImageHelper.wrapAssets("main_shop_icon.png"),
                              width: 480.r,
                              height: 480.r,
                              fit: BoxFit.contain),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 332.h,
                    decoration: DecorationStyles.boxDecorationBottomWhiteRadius,
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "高级莫兰迪色系 臻密绒磨毛四件套高级莫兰,高级莫兰迪色系 臻密绒磨毛四件套高级莫兰"
                            ",高级莫兰迪色系 臻密绒磨毛四件套高级莫兰,",
                            style: TextStyles.text333Size28,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 6),
                          child: Text(
                            "厂家直供，买一套少一套",
                            style: TextStyles.text999Size24,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "￥800.00~900.00",
                                style: TextStyles.text001Size24,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              width: 120.r,
                              height: 120.r,
                              child: Image.asset(
                                  ImageHelper.wrapAssets("main_shop_icon.png"),
                                  width: 120.r,
                                  height: 120.r,
                                  fit: BoxFit.contain),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Wrap(
              children: [
                shareItem(context, "save_img_icon.png", "下载到相册"),
                shareItem(context, "share_wechat_size88_icon.png", "分享到微信"),
                shareItem(context, "share_friend_icon.png", "分享朋友圈"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //item
  Widget shareItem(BuildContext context, String iconsAssets, String text) {
    return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        padding: EdgeInsets.symmetric(vertical: 40.h),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImageHelper.wrapAssets(iconsAssets),
                width: 88.w,
                height: 88.w,
                fit: BoxFit.contain),
            Container(
                margin: EdgeInsets.only(top: 6),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.black54),
                ))
          ],
        ),
      ),
    );
  }
}
