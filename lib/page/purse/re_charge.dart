import 'package:flutter/material.dart';

//接单详情
class ReCharge extends StatefulWidget {
  @override
  _ReChargeState createState() => _ReChargeState();
}

class _ReChargeState extends State<ReCharge> with TickerProviderStateMixin {

  FocusNode userFocusNode = FocusNode();

  int sex = 1;
  TextEditingController _textEditingController;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

        appBar: AppBar(
        title: Text('充值界面'),
      ),
      body: Column(
        children:[
           Container(
             margin: EdgeInsets.all(5),
                //设置 child 居中
                //alignment: Alignment(0, 0),
                height: 100,

                //width: 400,
                //边框设置
                decoration: new BoxDecoration(
                  //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  //color: Colors.yellow[50],
                  //image: DecorationImage(image: AssetImage('assets/images/purse/钱包.jpeg'), fit: BoxFit.cover),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("支付宝：",style: TextStyle(
                fontSize: 20
              ),),
              Radio(
                value: 1,
                groupValue: this.sex,
                onChanged: (value) {
                  setState(() {
                    this.sex = value;
                  });
                },
              ),
              SizedBox(width: 20),
              Text("微信：",style: TextStyle(
                fontSize: 20
              ),),
              Radio(
                value: 2,
                groupValue: this.sex,
                onChanged: (value) {
                  setState(() {
                    this.sex = value;
                  });
                },
              )
            
         
                  ],
                ),
        ),
        Container(
          margin: EdgeInsets.only(left:20,right: 20),
                //设置 child 居中
                //alignment: Alignment(0, 0),
                height: 100,

                //width: 400,
                //边框设置
                decoration: new BoxDecoration(
                  //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  //color: Colors.yellow[50],
                  //image: DecorationImage(image: AssetImage('assets/images/purse/钱包.jpeg'), fit: BoxFit.cover),
                ),
                child: TextField(
                  focusNode: userFocusNode,
                  controller: _textEditingController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  maxLength: 8,
                  decoration: InputDecoration(
                    //hintText: '请输入充值金额',
                    labelText: '请输入充值金额',
                    
                    prefixIcon: Icon(
                      Icons.r_mobiledata
                    ),
                  ),
                  onChanged: (text){
                    print('输入内容'+text);
                  },
                ),
        ),
        Container(
          child: ElevatedButton(
            child: Text('确认充值'),
            onPressed: (){

            },
          ),
        )
        ]
      ),
    );
  }

}