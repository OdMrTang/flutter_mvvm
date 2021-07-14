import 'package:jvtd_shop_client/commons/constants/index.dart';

class MainCustomerAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Utils.openIDialog(context, ShopChoiceDialog(),EdgeInsets.only(top: 90.h));
            },
            child: Container(
              alignment: Alignment.centerLeft,
              child: Image.asset(ImageHelper.wrapAssets('shop_icon.png'),
                  width: 88.w,
                  height: 88.w,
                  fit: BoxFit.contain),
            ),
          ),
          Expanded(child: Container(
            alignment: Alignment.center,
            child: Text("微赢家精选",style: TextStyles.text333Size34,),
          )),
          Container(
            alignment: Alignment.centerLeft,
            child: Image.asset(ImageHelper.wrapAssets('news_icon.png'),
                width: 88.w,
                height: 88.w,
                fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}
