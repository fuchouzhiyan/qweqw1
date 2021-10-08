import 'package:flutter/material.dart';
import 'package:tobias/tobias.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:lixiangyu/page/order/keyboard_main.dart';

//接单详情
class OrderTaking extends StatefulWidget {
  static final String sName = "enter";
  @override
  _OrderTakingState createState() => _OrderTakingState();
}

class _OrderTakingState extends State<OrderTaking> with TickerProviderStateMixin {
  final List<Tab> titleTabs = <Tab>[
    Tab(
      text: '注意事项',
    ),
    Tab(
      text: '接单流程',
    ),
    Tab(
      text: '常见问题',
    ),
    Tab(
      text: '接单帮助',
    ),
  ];
  String _payInfo = '';

  String pwdData = '';



  TabController _tabController;

  initAli() async {
    
  }

  _initFluwx() async {
    await fluwx.registerWxApi(appId: "wxe05482a3a754ffcd", universalLink: "https://www.kehaojiaoyu.com/");
    var result = await fluwx.isWeChatInstalled;
    print("is installed $result");
  }

  @override
  void initState() {
    super.initState();
    initAli();
    _initFluwx();
    // 添加监听器
    _tabController = TabController(
      initialIndex: 0,
      length: titleTabs.length,
      vsync: this,
    )..addListener(() {
        if (_tabController.indexIsChanging) {
          switch (_tabController.index) {
            case 0:
              print(1);
              break;
            case 1:
              print(2);
              break;
            case 2:
              print(3);
              break;
          }
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('接单详情'),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          decoration: new BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                //设置 child 居中
                //alignment: Alignment(0, 0),
                height: 130,

                //边框设置
                decoration: new BoxDecoration(
                  //背景
                  color: Colors.white,
                  //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  //设置四周边框
                  //border: new Border.all(width: 1, color: Colors.red),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          'assets/images/home/touxiang.jpeg',
                          width: 100,
                          height: 90,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(top: 20),
                          width: 230,
                          child: Text(
                            '标题:夫妻生意忙，找住家保姆',
                            style: TextStyle(fontSize: 16),
                          ),
                        )),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(bottom: 20),
                          width: 230,
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(),
                                flex: 1,
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Image.asset(
                                    'assets/icons/人民币.png',
                                    width: 20,
                                  ),
                                ),
                                flex: 3,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    '5000.00',
                                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.w400, fontSize: 20),
                                  ),
                                ),
                                flex: 3,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: TabBar(
                  indicator: const BoxDecoration(),
                  labelColor: Colors.amber,
                  indicatorColor: Colors.amber,
                  unselectedLabelColor: Colors.grey,
                  controller: _tabController,
                  tabs: titleTabs,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: TabBarView(
                      controller: _tabController,
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        SingleChildScrollView(
                            child: Column(
                          children: [
                            Image.asset(
                              'assets/images/details/注意事项.jpeg',
                              fit: BoxFit.fill,
                            )
                          ],
                        )),
                        SingleChildScrollView(
                            child: Column(
                          children: [
                            Image.asset(
                              'assets/images/details/接单流程.png',
                              fit: BoxFit.fill,
                            )
                          ],
                        )),
                        SingleChildScrollView(
                            child: Column(
                          children: [
                            Image.asset(
                              'assets/images/details/常见问题.jpeg',
                              fit: BoxFit.fill,
                            )
                          ],
                        )),
                        SingleChildScrollView(
                            child: Column(
                          children: [
                            Image.asset(
                              'assets/images/details/常见问题.jpeg',
                              fit: BoxFit.fill,
                            )
                          ],
                        )),
                      ]),
                ),
                flex: 1,
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          child: BottomAppBar(
            color: Colors.white,
            child: Row(
              children: [
                Spacer(),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('缴纳保证金'),
                  onPressed: () {
                    showDialog<Null>(
                      context: context,
                      builder: (BuildContext context) {
                        return UnconstrainedBox(
                          //constrainedAxis: Axis.vertical,
                          child: SizedBox(
                              width: 400,
                              height: 400,
                              child: SimpleDialog(
                                title: new Text(
                                  '选择支付方式',
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                                children: <Widget>[
                                  new SimpleDialogOption(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: new Text('理想鱼钱包',style: TextStyle(
                                        fontSize: 18
                                      ),),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => main_keyboard(
                                                  
                                                )),
                                      );
                                    },
                                  ),
                                  new SimpleDialogOption(
                                    child: Container(
                                      child: Image.asset(
                                        'assets/images/pay/支付宝.jpeg',
                                        //width: 200,
                                        height: 40,
                                        //fit: BoxFit.fill,
                                      ),
                                    ),
                                    onPressed: () {
                                      callAlipay();
                                    },
                                  ),
                                  new SimpleDialogOption(
                                    child: Container(
                                      child: Image.asset(
                                        'assets/images/pay/微信.jpeg',
                                        //width: 200,
                                        height: 40,
                                        //fit: BoxFit.fill,
                                      ),
                                    ),
                                    onPressed: () {
                                      
                                      callWeixinpay();
                                    },
                                  ),
                                ],
                              )),
                        );
                      },
                    ).then((val) {
                      print(val);
                    });
                  },
                ),
                SizedBox(
                  width: 15,
                )
              ],
            ),
          ),
        ));
  }

  callAlipay() async {
    aliPayAuth("12234212312312");
    Map payResult;
    print("The pay info is : " + _payInfo);
    payResult = await aliPay(_payInfo);
    print("--->$payResult");
    if (payResult["resultStatus"] == '9000') {
    } else if (payResult["resultStatus"] == '4000') {
    } else {}
  }

  callWeixinpay() async {
    fluwx
        .payWithWeChat(
            appId: '_weixinPayModel.appid',
            partnerId: '_weixinPayModel.partnerid',
            prepayId: '_weixinPayModel.prepayid',
            packageValue: '_weixinPayModel.package',
            nonceStr: '_weixinPayModel.noncestr',
            timeStamp: 9999999,
            sign: '_weixinPayModel.sign')
        .then((data) {
      print(data);
    });
    fluwx.weChatResponseEventHandler.listen((event) {
      if (event is fluwx.WeChatPaymentResponse) {
        if (event.errCode == 0) {}
      }
    });
  }

  /// 密码键盘 确认按钮 事件
  void onAffirmButton() {}



}
