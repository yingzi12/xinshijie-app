import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Msgcode extends StatefulWidget {
  const Msgcode({Key? key}) : super(key: key);

  @override
  State<Msgcode> createState() => _MsgCodeState();
}

class _MsgCodeState extends State<Msgcode> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: true,
        title:const Text('验证码倒计时小组件'),
      ),
      body: const MyBody(),
    );
  }
}

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  bool isButtonEnable=true;      //按钮初始状态  是否可点击
  String buttonText='发送验证码';   //初始文本
  int count=60;                     //初始倒计时时间
  Timer? timer;                       //倒计时的计时器
  TextEditingController? mController=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
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
                      onSaved: (value) { },
                      controller: mController,
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
                    ),),
                ),
                SizedBox(
                  width: 120,
                  child: TextButton(
                    // disabledColor: Colors.grey.withOpacity(0.1),     //按钮禁用时的颜色
                    // disabledTextColor: Colors.white,                   //按钮禁用时的文本颜色
                    // textColor:isButtonEnable?Colors.white:Colors.black.withOpacity(0.2),                           //文本颜色
                    // color: isButtonEnable?const Color(0xff44c5fe):Colors.grey.withOpacity(0.1),                          //按钮的颜色
                    // splashColor: isButtonEnable?Colors.white.withOpacity(0.1):Colors.transparent,
                    // shape:const StadiumBorder(side: BorderSide.none),
                    onPressed: (){
                      if(isButtonEnable){
                        debugPrint('$isButtonEnable');
                        setState(() {
                          _buttonClickListen();
                        });
                      }},
                    child:Text(buttonText,style:const TextStyle(fontSize: 13,),),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: const EdgeInsets.only(top: 50,left: 10,right: 10),
            child: ElevatedButton(
              onPressed: () {
                debugPrint('${mController?.text}');
              },
              style: ButtonStyle(
                backgroundColor:MaterialStateProperty.all(const Color(0xff44c5fe)),
                shape: MaterialStateProperty.all(const StadiumBorder(side: BorderSide.none)),//圆角弧度
              ),

              child:const Text('下一步', style: TextStyle(color: Colors.white,fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }


  void _buttonClickListen(){
    setState(() {
      if(isButtonEnable){         //当按钮可点击时
        isButtonEnable=false;   //按钮状态标记
        _initTimer();
      }
    });
  }

  void _initTimer(){
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      count--;
      setState(() {
        if(count==0){
          timer.cancel();             //倒计时结束取消定时器
          isButtonEnable=true;        //按钮可点击
          count=60;                   //重置时间
          buttonText='发送验证码';     //重置按钮文本
        }else{
          buttonText='重新发送($count)';  //更新文本内容
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();      //销毁计时器
    timer=null;
    mController?.dispose();
    super.dispose();
  }

}