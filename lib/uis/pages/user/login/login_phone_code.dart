import 'package:jvtd_shop_client/commons/constants/index.dart';

//短信验证码登录
class LoginPhoneCodePage extends StatefulWidget {
  @override
  _LoginPhoneCodePageState createState() => _LoginPhoneCodePageState();
}

class _LoginPhoneCodePageState extends State<LoginPhoneCodePage> {
  TextEditingController _phoneController;
  TextEditingController _passwordController;
  final _pwdFocus = FocusNode();
  var isSent = false;
  var _seconds = 60;
  Timer _timer;
  var _verifyStr = "获取验证码";

  @override
  void initState() {
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _cancelTimer();
    super.dispose();
  }

  void _startTimer() {
    // 计时器（`Timer`）组件的定期（`periodic`）构造函数，创建一个新的重复计时器。
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        _cancelTimer();
        _seconds = 60;
        setState(() {
          isSent = false;
        });
        return;
      }
      _seconds--;
      setState(() {
        _verifyStr = '已发送$_seconds秒';
      });
      setState(() {});
      if (_seconds == 0) {
        _verifyStr = '重新发送';
        isSent = false;
      }
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.all(0),
              sliver: SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                    Container(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(top: 60, right: 20),
                      height: 110,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close),
                      ),
                    ),
                    Container(
                      height: 52,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 80.w),
                      child: Image.asset(ImageHelper.wrapAssets('login_icon.png'),
                          width: 120.w,
                          height: 46.h,
                          fit: BoxFit.contain),
                    ),
                    Container(
                      margin:
                      EdgeInsets.only(left: 80.w, top: 23),
                      child: Text("欢迎登录",
                          style: TextStyle(
                              fontSize: 48.sp,
                              fontWeight: FontWeight.w600)),
                    ),
                    LoginPanelForm(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            LoginTextField(
                              label: "请输入手机号",
                              // icon: Icons.call,
                              controller: _phoneController,
                              inputType: TextInputType.phone,
                              maxLength: 11,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (text) {
                                FocusScope.of(context).requestFocus(_pwdFocus);
                              },
                            ),
                            Stack(
                              children: <Widget>[
                                LoginTextField(
                                  controller: _passwordController,
                                  label: "请输入密码",
                                  // icon: Icons.vpn_key,
                                  obscureText: true,
                                  focusNode: _pwdFocus,
                                  textInputAction: TextInputAction.done,
                                ),
                              ],
                            ),
                            LoginButton(_phoneController, _passwordController, 1),
                            LoginWechat(InkWell(
                              //三方登录
                              onTap: () {
                              },
                              child: Image.asset(
                                  ImageHelper.wrapAssets('weChat_icon.png'),
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.contain),
                            ))
                          ]),
                    )
                  ])),
            )
          ],
        ),
      ),
    );
  }
}