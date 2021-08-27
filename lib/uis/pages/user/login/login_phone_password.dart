import 'package:jvtd_shop_client/commons/constants/index.dart';

//短信验证码登录
class LoginPhonePasswordPage extends StatefulWidget {
  @override
  _LoginPhonePasswordPageState createState() => _LoginPhonePasswordPageState();
}

class _LoginPhonePasswordPageState extends State<LoginPhonePasswordPage>{
  TextEditingController _phoneController;
  TextEditingController _passwordController;
  final _pwdFocus = FocusNode();
  var isSent = false;

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LoginModel>(
        onModelReady: (model) {
          model.initData();
        },
        builder: (context, model, child) {
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
                        child: Image.asset(
                            ImageHelper.wrapAssets('login_icon.png'),
                            width: 120.w,
                            height: 46.h,
                            fit: BoxFit.contain),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 80.w, top: 23),
                        child: Text("欢迎登录",
                            style: TextStyle(
                                fontSize: 48.sp, fontWeight: FontWeight.w600)),
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
                                  FocusScope.of(context)
                                      .requestFocus(_pwdFocus);
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
                              LoginButton(
                                  _phoneController, _passwordController, 1, () {
                                model.login(context);
                              }),
                              LoginWechat(InkWell(
                                //三方登录
                                onTap: () {},
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
        },
        model: LoginModel());
  }

}
