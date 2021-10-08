import 'package:flutter/material.dart';

//接单详情
class WithDraw extends StatefulWidget {
  @override
  _WithDrawState createState() => _WithDrawState();
}

class _WithDrawState extends State<WithDraw> with TickerProviderStateMixin {
  FocusNode userFocusNode = FocusNode();

  List<String> nameItems = <String>['微信', '支付宝'];
  List<String> urlItems = <String>['touxiang.jpeg', 'touxiang.jpeg'];


  int sex = 1;
  TextEditingController _textEditingController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('提现'),
        actions: [
          IconButton(
        icon: Icon(
          Icons.more_horiz,
          color: Colors.black,
        ),
        onPressed: () {
          //Share.share('${widget.item.title} ${widget.item.url}');
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              context: context,
              builder: (BuildContext context) {
                return _shareWidget(context);
              });
        },
      ),
        ],
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(5),
          //设置 child 居中
          //alignment: Alignment(0, 0),
          height: 160,
          //width: 400,
          //边框设置
          decoration: new BoxDecoration(
            //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            //color: Colors.yellow[50],
            //image: DecorationImage(image: AssetImage('assets/images/purse/钱包.jpeg'), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20, left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  '提现到',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Divider(
                    height: 1,
                    color: Colors.grey,
                  )),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    //height: 100,

                    child: Image.asset(
                      'assets/images/pay/支付宝.jpeg',
                      height: 40,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text('328****29@qq.com'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text('预计1天内到账'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )),
                  SizedBox(
                    width: 10,
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          height: 10,
          decoration: new BoxDecoration(
            color: Colors.grey[200],
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 20, left: 20),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Container(
                  child: Text(
                    '提现金额',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                  child: Text(
                    '(注：按交易金额2%收费的游戏以及免收交易服务费的游戏，不在小额交易游戏之列。)',
                    style: TextStyle(fontSize: 14,color: Colors.grey),
                  ),
                )
                )
                 
              ],
            )),
        Container(
          margin: EdgeInsets.only(top:10,left: 20, right: 20),
          height: 70,
          decoration: new BoxDecoration(
            //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: TextField(
            focusNode: userFocusNode,
            controller: _textEditingController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            
            decoration: InputDecoration(
              //hintText: '请输入充值金额',
              labelText: '请输入提现金额',

              prefixIcon: Icon(Icons.r_mobiledata),
            ),
            onChanged: (text) {
              print('输入内容' + text);
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Container(
                child: Text('可提现金额'),
              ),
              Container(
                child: Text('100.00',style: TextStyle(
                  color: Colors.red
                ),),
              ),
              Spacer(),
              Container(
                child: Text('全部提现',style: TextStyle(
                  color: Colors.blueAccent
                ),),
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          child: ElevatedButton(
            style:ButtonStyle(
              minimumSize:MaterialStateProperty.all(
                Size(380, 50)
              ),
            ),
            child: Text('确认提现'),
            onPressed: () {},
          ),
        ),
        Container(
          padding: EdgeInsets.only(top:20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text('转账服务费',style: TextStyle(
                  color: Colors.grey
                ),),
              ),
              Container(
                child: Text('0.00元',style: TextStyle(
                  color: Colors.red
                ),),
              ),
              Container(
                child: Text(',实际到账金额',style: TextStyle(
                  color: Colors.grey
                ),),
              ),
              Container(
                child: Text('0.00元',style: TextStyle(
                  color: Colors.red
                ),),
              ),
            ],
          ),
        )
      ]),
    );
  }

  Widget _shareWidget(BuildContext context) {
    return Container(
      height: 165.0,
      child: new Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text('添加新的提现通道',style: TextStyle(fontSize: 18),),
          ),
          new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: new Container(
              height: 120.0,
              child: new GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 5.0, childAspectRatio: 1.0),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Column(
                      children: <Widget>[
                        new Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 6.0),
                            child: new Image.asset(
                              'assets/images/home/${urlItems[index]}',
                              width: 45.0,
                              height: 45.0,
                              fit: BoxFit.fill,
                            )),
                        new Text(nameItems[index])
                      ],
                    ),
                    onTap: () {
                      
                    },
                  );
                },
                itemCount: nameItems.length,
              ),
            ),
          ),
          // new Container(
          //   height: 0.5,
          //   color: Colors.blueGrey,
          // ),
          // new InkWell(
          //   child: new Center(
          //     child: new Padding(
          //       padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
          //       child: new Text(
          //         "取 消",
          //         style: new TextStyle(fontSize: 18.0, color: Colors.blueGrey),
          //       ),
          //     ),
          //   ),
          //   onTap: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
        ],
      ),
    );
  }
}
