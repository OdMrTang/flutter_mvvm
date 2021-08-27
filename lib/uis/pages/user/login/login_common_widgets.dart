import 'package:flutter/cupertino.dart';
import 'package:jvtd_shop_client/commons/constants/index.dart';

typedef _CallBack = void Function();
//登录按钮功能
class LoginButton extends StatelessWidget {
  final nameController;
  final passwordController;
  final type;
  final _CallBack callback;

  LoginButton(this.nameController, this.passwordController, this.type,this.callback);

  bool isBusy = false;

  @override
  Widget build(BuildContext context) {
    return LoginButtonWidget(
      child: Text(
        "登录",
        style: TextStyle(color: KColor.loginBottonTextColor,fontWeight: FontWeight.w500),
      ),
      onPressed: () {
        if (nameController.text.toString().isEmpty) {
          ToastUtils.showToastText(KString.inputPhone);
        } else if (passwordController.text.toString().isEmpty) {
          ToastUtils.showToastText(KString.inputPwd);
        } else {
          if(callback!=null){
            callback();
          }
        }
      },
    );
  }
}

//登录按钮样式
class LoginButtonWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  LoginButtonWidget({this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    // var color = Theme.of(context).primaryColor.withOpacity(0.8);
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
        child: CupertinoButton(
          padding: EdgeInsets.all(0),
          color: KColor.loginBottonColor,
          disabledColor: Colors.orange,
          borderRadius: BorderRadius.circular(8),
          pressedOpacity: 0.5,
          child: child,
          onPressed: onPressed,
        ));
  }
}

//登录页面文本框
class LoginTextField extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final ValueChanged<String> onFieldSubmitted;
  final int maxLength;
  final TextInputType inputType;

  LoginTextField(
      {this.label,
      this.icon,
      this.controller,
      this.obscureText: false,
      this.validator,
      this.focusNode,
      this.textInputAction,
      this.onFieldSubmitted,
      this.maxLength,
      this.inputType});

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  TextEditingController controller;

  /// 默认遮挡密码
  ValueNotifier<bool> obscureNotifier;

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    obscureNotifier = ValueNotifier(widget.obscureText);
    super.initState();
  }

  @override
  void dispose() {
    obscureNotifier.dispose();
    // 默认没有传入controller,需要内部释放
    if (widget.controller == null) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ValueListenableBuilder(
        valueListenable: obscureNotifier,
        builder: (context, value, child) => TextFormField(
          textCapitalization: TextCapitalization.none,
          maxLength: widget.maxLength,
          maxLengthEnforced: true,
          keyboardType: widget.inputType,
          controller: controller,
          obscureText: value,
          // validator: (text) {
          //   var validator = widget.validator ?? (_) => null;
          //   return text.trim().length > 0 ? validator(text) : "请填写内容";
          // },
          focusNode: widget.focusNode,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: InputDecoration(
            counterStyle: TextStyle(
              height: double.minPositive,
            ),
            counterText: "",
            // prefixIcon: Icon(widget.icon, color: theme.accentColor, size: 22),
            hintText: widget.label,
            hintStyle: TextStyle(fontSize: 16),
            suffixIcon: LoginTextFieldSuffixIcon(
              controller: controller,
              obscureText: widget.obscureText,
              obscureNotifier: obscureNotifier,
            ),
            enabledBorder: UnderlineInputBorder(
              //光标未选中颜色
              borderSide: BorderSide(color: Colors.grey[100]),
            ),
            focusedBorder: UnderlineInputBorder(
              //光标选中颜色
              borderSide: BorderSide(color: Colors.orange),
            ),
            //输入框边距线
            // enabledBorder: InputDecoration()
          ),
        ),
      ),
    );
  }
}

class LoginTextFieldSuffixIcon extends StatelessWidget {
  final TextEditingController controller;

  final ValueNotifier<bool> obscureNotifier;

  final bool obscureText;

  LoginTextFieldSuffixIcon(
      {this.controller, this.obscureNotifier, this.obscureText});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Offstage(
          offstage: !obscureText,
          child: InkWell(
            onTap: () {
//              debugPrint('onTap');
              obscureNotifier.value = !obscureNotifier.value;
            },
            child: ValueListenableBuilder(
              valueListenable: obscureNotifier,
              builder: (context, value, child) => Icon(
                CupertinoIcons.eye,
                size: 20,
                color: value ? theme.hintColor : theme.accentColor,
              ),
            ),
          ),
        ),
        LoginTextFieldClearIcon(controller)
      ],
    );
  }
}

class LoginTextFieldClearIcon extends StatefulWidget {
  final TextEditingController controller;

  LoginTextFieldClearIcon(this.controller);

  @override
  _LoginTextFieldClearIconState createState() =>
      _LoginTextFieldClearIconState();
}

class _LoginTextFieldClearIconState extends State<LoginTextFieldClearIcon> {
  ValueNotifier<bool> notifier;

  @override
  void initState() {
    notifier = ValueNotifier(widget.controller.text.isEmpty);
    widget.controller.addListener(() {
      if (mounted) notifier.value = widget.controller.text.isEmpty;
    });
    super.initState();
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (context, bool value, child) {
        return Offstage(
          offstage: value,
          child: child,
        );
      },
      child: InkWell(
          onTap: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              widget.controller.clear();
            });
          },
          child: Icon(CupertinoIcons.clear,
              size: 16, color: Colors.grey)),
    );
  }
}

//登录页面表单
class LoginPanelForm extends StatelessWidget {
  final Widget child;

  LoginPanelForm({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32, vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      color: Colors.white,
      // decoration: ShapeDecoration(
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(12))),
          // color: Theme.of(context).cardColor,
          // color: Colors.white,
          // shadows: [
          //   BoxShadow(
          //       color: Theme.of(context).primaryColor.withAlpha(20),
          //       offset: Offset(1.0, 1.0),
          //       blurRadius: 10.0,
          //       spreadRadius: 3.0),
          // ]
      // ),
      child: child,
    );
  }
}

//微信登录
class LoginWechat extends StatelessWidget {
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 62),
      child: Column(
        children: [
          Text(
            "微信登录",
            style: TextStyle(
                color: KColor.weChatColor, fontSize: 28.sp),
          ),
          Container(
            margin: EdgeInsets.only(top: 18),
            child: child,
          )
        ],
      ),
    );
  }

  LoginWechat(this.child);
}
