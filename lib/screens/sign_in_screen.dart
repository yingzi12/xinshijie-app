import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:xinshijieapp/data/captcha_data_utils.dart';
import 'package:xinshijieapp/data/login_data_utils.dart';
import 'package:xinshijieapp/http/intercept.dart';
import 'package:xinshijieapp/models/captcha_entity.dart';
import 'package:xinshijieapp/models/user_entity.dart';
import 'package:xinshijieapp/models/user_model.dart';
import 'package:xinshijieapp/utils/AppImages.dart';
import 'package:xinshijieapp/utils/AppWidget.dart';

class SignInScreen extends StatefulWidget {
  static var tag = "/SignIn";

  const SignInScreen({super.key});

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  bool passwordVisible = false;
  bool? isRemember = false;
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();
  CaptchaEntity? captchaEntity;

  @override
  void initState() {
    super.initState();
    init();
    passwordVisible = false;
  }
  void init() async {
    getCaptchaCode();
    print("---------------获取验证码-----------------");
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    return Scaffold(
      body: Observer(
        builder: (_) => Container(
          color: context.scaffoldBackgroundColor,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
              child: Form(
                key: _formKey, //设置globalKey，用于后面获取FormState
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: (MediaQuery.of(context).size.height) / 3.5,
                      child: Stack(
                        children: <Widget>[
                          Image.asset(book_image, fit: BoxFit.fill, width: MediaQuery.of(context).size.width),
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Welcome", style: boldTextStyle(size: 40, color: white)),
                                SizedBox(height: 4),
                                Text("Back!", style: boldTextStyle(size: 34, color: white))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(right: 45),
                      transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                      child: Image.asset(child_image, height: 70, width: 70),
                    ),
                    EditTextField("请输入电子邮箱或者账号", _unameController, isPassword: false,reminder:"电子邮箱/账号不能为空"),
                    SizedBox(height: 16),
                    EditTextField("请输入密码", _pwdController,isPassword: true,reminder:"密码不能为空"),
                    SizedBox(height: 16),
                    msgCode(context,_codeController),
                    SizedBox(height: 14),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: Row(
                        children: <Widget>[
                          CustomTheme(
                            child: Checkbox(
                              focusColor: Color(0xFFfc4a1a),
                              activeColor: Color(0xFFfc4a1a),
                              value: isRemember,
                              onChanged: (bool? value) {
                                setState(() {
                                  isRemember = value;
                                });
                              },
                            ),
                          ),
                          Text("Remember", style: secondaryTextStyle(size: 16))
                        ],
                      ),
                    ),
                    SizedBox(height: 14),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Builder(builder: (context){
                        return AppButton(text: "Sign In" ,
                          color: Colors.green, // Optional
                          onTap: () {
                            // 通过_formKey.currentState 获取FormState后，
                            // 调用validate()方法校验用户名密码是否合法，校验
                            // 通过后再提交数据。
                            if ((_formKey.currentState as FormState).validate()) {
                              login(_unameController.text,_pwdController.text,_codeController.text);
                            }
                          },);},
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Forgot Password?", style: secondaryTextStyle(size: 16)),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don\'t have an account?", style: primaryTextStyle()),
                        Container(
                          margin: EdgeInsets.only(left: 4),
                          child: GestureDetector(child: Text("Sign Up", style: TextStyle(fontSize: 18.0, decoration: TextDecoration.underline, color: Color(0xFFfc4a1a))), onTap: () {}),
                        )
                      ],
                    ),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }

  Widget msgCode(BuildContext context,var _textController){
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.ideographic,
        children: <Widget>[
          const Text('验证码',style: TextStyle(fontSize: 13,color: Color(0xff333333))),
          Expanded(
            child: Padding(padding: const EdgeInsets.only(left: 15,right: 15),
              child: TextFormField(
                maxLines: 1,
                controller: _textController,
                onSaved: (value) { },
                // controller: mController,
                textAlign: TextAlign.start,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),    //只允许输入0-9的数字
                  LengthLimitingTextInputFormatter(6)                     //最大输入长度为6
                ],
                decoration: const InputDecoration(
                  hintText: ('填写验证码'),
                  // fillColor: Colors.red,  //设置TextFormField背景颜色
                  // filled: true,
                  contentPadding: EdgeInsets.only(top: 25,bottom: 0),
                  hintStyle: TextStyle(
                    color: Color(0xff999999),
                    fontSize: 13,
                  ),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
                // 校验用户名（不能为空）
                validator: (v) {
                  return v==null||v.trim().isNotEmpty ? null : "验证码不能为空";
                },
              ),),
          ),
          SizedBox(
            width: 120,
            child: TextButton(
              onPressed: (){getCaptchaCode();},
              child:getImage()
            ),
          ),
        ],
      ),
    );
  }

  void login(var username,var password,var code)  {
    LoginDataUtils.login({"username":username,"password":password,"code":code,"uuid":captchaEntity?.uuid?? ""}, success: (res) {
         UserEntity userEntity=UserEntity.fromJson(res["user"]);
         setToken(res["token"]);
         setRefreshToken(res["token"]);
         Provider.of<UserModel>(context, listen: false).user(userEntity);
         getCaptchaCode();
    }, fail: (code, msg) {
      getCaptchaCode();
    });

  }

  Widget getImage(){
    if(captchaEntity==null ){
      return const Text("加载中");
    }else{
      return Image.memory( Base64Decoder().convert((captchaEntity?.img?? "")));
    }

  }
  void getCaptchaCode()  {
    CaptchaDataUtils.getCode(success: (res) {
      setState(() {
        captchaEntity = CaptchaEntity.fromJson(res);
        print("---------------获取验证码获取到结果-----------------");
      });
      print("---------------获取验证码获取到结果t  获取到结果-----------------");
    }, fail: (code, msg) {});
  }
}