import 'package:image_picker/image_picker.dart';
import 'package:jvtd_shop_client/commons/constants/index.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController _logoController;
  Animation<double> _animation;
  AnimationController _countdownController;

  @override
  void initState() {
    _logoController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    _animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(curve: Curves.easeInOutBack, parent: _logoController));

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _logoController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _logoController.forward();
      }
    });
    _logoController.forward();

    _countdownController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _countdownController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _logoController.dispose();
    _countdownController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.splashColor,
      body: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Stack(fit: StackFit.expand, children: <Widget>[
          AnimatedFlutterLogo(
            animation: _animation,
          ),
          Align(
            alignment: Alignment(0.0, -0.4),
            child: Container(
              width: 402.w,
              height: 84.h,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(ImageHelper.wrapAssets('splash_bg.png'),
                  fit: BoxFit.contain),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SafeArea(
              child: InkWell(
                onTap: () {
                  nextPage(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  // margin: EdgeInsets.only(right: 20, bottom: 20),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(40),
                  //   color: Colors.black.withAlpha(100),
                  // ),
                  child: AnimatedCountdown(
                    context: context,
                    animation: StepTween(begin: 1, end: 0)
                        .animate(_countdownController),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

//广告倒计时
class AnimatedCountdown extends AnimatedWidget {
  final Animation<int> animation;

  AnimatedCountdown({key, this.animation, context})
      : super(key: key, listenable: animation) {
    this.animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {//倒计时完毕
        nextPage(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var value = animation.value + 1;
    return Text("");
  }
}

class AnimatedFlutterLogo extends AnimatedWidget {
  AnimatedFlutterLogo({
    Key key,
    Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container();
    return AnimatedAlign(
      duration: Duration(milliseconds: 10),
      alignment: Alignment(0, 0.2 + animation.value * 0.3),
      curve: Curves.bounceOut,
      child: Image.asset(
        ImageHelper.wrapAssets('splash_flutter.png'),
        width: 280,
        height: 120,
      ),
    );
  }
}

class AnimatedAndroidLogo extends AnimatedWidget {
  AnimatedAndroidLogo({
    Key key,
    Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
//        Image.asset(
//          ImageHelper.wrapAssets('splash_fun.png'),
//          width: 140 * animation.value,
//          height: 80 * animation.value,
//        ),
//        Image.asset(
//          ImageHelper.wrapAssets('splash_android.png'),
//          width: 200 * (1 - animation.value),
//          height: 80 * (1 - animation.value),
//        ),
      ],
    );
  }
}

Future<void> nextPage(context) async {
  Navigator.of(context).pushReplacementNamed(RouteName.tab);
  // var isLogin = StorageManager.sharedPreferences.getBool(Config.IS_LOGIN_KEY);
  // if (isLogin == null) {
  //   String token = StorageManager.sharedPreferences.getString(Config.TOKEN_KEY);
  //   if (token != null) {
  //     Navigator.pushReplacementNamed(context, RouteName.login);
  //   } else {
  //     Navigator.of(context).pushReplacementNamed(RouteName.login);
  //   }
  // } else if (isLogin) {
  //   var statusInfo = await UserRepository.getVerificationStatus();
  //   int status = statusInfo["status"];
  //   if (status != 2) {
  //     Navigator.pushReplacementNamed(context, RouteName.login);
  //     return;
  //   }
  //   var model = Provider.of<UserModel>(context);
  //   model.refreshUserInfo();
  //   Navigator.of(context).pushReplacementNamed(RouteName.main);
    // if (model.user != null) {
    //   Navigator.of(context).pushReplacementNamed(RouteName.tab);
    // } else {
    //   Navigator.of(context).pushReplacementNamed(RouteName.login);
    // }
  // } else {
  //   Navigator.of(context).pushReplacementNamed(RouteName.main);
  //   // Navigator.of(context).pushReplacementNamed(RouteName.login);
  // }
}
