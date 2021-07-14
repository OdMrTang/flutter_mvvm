import 'package:jvtd_shop_client/commons/constants/index.dart';

//首页
class MainHomePage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<MainHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<MainHomeModel>(
        onModelReady: (model){},
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: KColor.splashColor,
            appBar: AppBar(
              backgroundColor: KColor.splashColor,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Text("首页"),
            ),
            body: Center(
              child: Text("首页")
            ),
          );
        },
        model: MainHomeModel());
  }
}
