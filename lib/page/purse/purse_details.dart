import 'package:flutter/material.dart';
import 'package:lixiangyu/page/purse/re_charge.dart';
import 'package:lixiangyu/page/purse/with_draw.dart';
import 'package:lixiangyu/page/purse/trading_record.dart';

//接单详情
class PurseDetails extends StatefulWidget {
  @override
  _PurseDetailsState createState() => _PurseDetailsState();
}

class _PurseDetailsState extends State<PurseDetails> with TickerProviderStateMixin {
  final List<Tab> titleTabs = <Tab>[
    Tab(
      text: '交易记录',
    ),
    Tab(
      text: '常见问题',
    ),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
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
          }
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('理想鱼钱包'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                //设置 child 居中
                //alignment: Alignment(0, 0),
                height: 200,
                //width: 400,
                //边框设置
                decoration: new BoxDecoration(
                  //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  image: DecorationImage(image: AssetImage('assets/images/purse/钱包.jpeg'), fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 20, top: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '理想鱼钱包',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 20, top: 20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '用户:呆呆的小木瓜',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 20, top: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '卡号:91827418920120',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 40),
                          child: Text(
                            '余额:',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 20, top: 40),
                          child: Text(
                            '100.00',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                //设置 child 居中
                //alignment: Alignment(0, 0),
                height: 50,

                //width: 400,
                //边框设置
                decoration: new BoxDecoration(
                  //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Colors.yellow[50],
                  //image: DecorationImage(image: AssetImage('assets/images/purse/钱包.jpeg'), fit: BoxFit.cover),
                ),
                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(left: 45),
                        child: Text(
                          '充值',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ReCharge()),
                        );
                      },
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: VerticalDivider(
                          color: Colors.black,
                          width: 1,
                        )),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(left: 45),
                        child: Text(
                          '提现',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WithDraw()),
                        );
                      },
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: VerticalDivider(
                          color: Colors.black,
                          width: 1,
                        )),
                    InkWell(
                      child: Container(
                      padding: EdgeInsets.only(left: 50),
                      child: Text(
                        '记录',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TradingRecord()),
                        );
                    },
                    )
                  ],
                ),
              ),
              Container(
                //decoration: BoxDecoration(color: Colors.white),
                child: TabBar(
                  labelStyle: TextStyle(fontSize: 18, height: 2),
                  unselectedLabelStyle: TextStyle(fontSize: 18, height: 2),
                  indicator: const BoxDecoration(),
                  labelColor: Colors.amber,
                  indicatorColor: Colors.amber,
                  unselectedLabelColor: Colors.grey,
                  controller: _tabController,
                  tabs: titleTabs,
                ),
              ),
              Container(
                height: 500,
                //decoration: BoxDecoration(color: Colors.white),
                child: TabBarView(
                  controller: _tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    SingleChildScrollView(
                        child: Container(
                            child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        '微信红包',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        '+0.02',
                                        style: TextStyle(fontSize: 18, color: Colors.amber),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        '7月5日 09:17',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        '余额 3454.20',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                          child: Divider(
                            color: Colors.grey[300],
                            height: 1,
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        '微信红包',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        '-0.02',
                                        style: TextStyle(fontSize: 18, color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        '7月5日 09:17',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        '余额 3454.20',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                          child: Divider(
                            color: Colors.grey[300],
                            height: 1,
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        '微信红包',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        '+0.02',
                                        style: TextStyle(fontSize: 18, color: Colors.amber),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        '7月5日 09:17',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        '余额 3454.20',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                          child: Divider(
                            color: Colors.grey[300],
                            height: 1,
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        '微信红包',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        '-0.02',
                                        style: TextStyle(fontSize: 18, color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        '7月5日 09:17',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        '余额 3454.20',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                          child: Divider(
                            color: Colors.grey[300],
                            height: 1,
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        '微信红包',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        '+0.02',
                                        style: TextStyle(fontSize: 18, color: Colors.amber),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        '7月5日 09:17',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        '余额 3454.20',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                          child: Divider(
                            color: Colors.grey[300],
                            height: 1,
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        '微信红包',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        '+0.02',
                                        style: TextStyle(fontSize: 18, color: Colors.amber),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        '7月5日 09:17',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        '余额 3454.20',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                          child: Divider(
                            color: Colors.grey[300],
                            height: 1,
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        '微信红包',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        '+0.02',
                                        style: TextStyle(fontSize: 18, color: Colors.amber),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        '7月5日 09:17',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        '余额 3454.20',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                          child: Divider(
                            color: Colors.grey[300],
                            height: 1,
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        '微信红包',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        '+0.02',
                                        style: TextStyle(fontSize: 18, color: Colors.amber),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        '7月5日 09:17',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        '余额 3454.20',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                          child: Divider(
                            color: Colors.grey[300],
                            height: 1,
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        '微信红包',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        '-0.02',
                                        style: TextStyle(fontSize: 18, color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        '7月5日 09:17',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        '余额 3454.20',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                          child: Divider(
                            color: Colors.grey[300],
                            height: 1,
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        '微信红包',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        '+0.02',
                                        style: TextStyle(fontSize: 18, color: Colors.amber),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        '7月5日 09:17',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        '余额 3454.20',
                                        style: TextStyle(fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                          child: Divider(
                            color: Colors.grey[300],
                            height: 1,
                          ),
                        )
                      ],
                    ))),
                    SingleChildScrollView(
                        child: Column(
                      children: [
                        Image.asset(
                          'assets/images/details/接单流程.png',
                          fit: BoxFit.fill,
                        )
                      ],
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
