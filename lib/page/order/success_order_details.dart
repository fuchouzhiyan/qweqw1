import 'package:flutter/material.dart';
import 'package:flutter_seekbar/flutter_seekbar.dart' show SectionTextModel, SeekBar;
import 'package:lixiangyu/page/order/appraise.dart';

//接单详情
class SuccessOrderDetails extends StatefulWidget {
  @override
  _SuccessOrderDetailsState createState() => _SuccessOrderDetailsState();
}

class _SuccessOrderDetailsState extends State<SuccessOrderDetails> with TickerProviderStateMixin {
  List<SectionTextModel> sectionTexts = [];
  double v;
  @override
  void initState() {
    super.initState();
    sectionTexts.add(SectionTextModel(position: 0, text: '已接单', progressColor: Colors.amber));
    sectionTexts.add(SectionTextModel(position: 1, text: '预约上门', progressColor: Colors.amber));
    sectionTexts.add(SectionTextModel(position: 2, text: '任务开始', progressColor: Colors.amber));
    sectionTexts.add(SectionTextModel(position: 3, text: '任务完成', progressColor: Colors.amber));
    sectionTexts.add(SectionTextModel(position: 4, text: '已评价', progressColor: Colors.green));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text('订单详情'),
          actions: [
            Container(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.support_agent),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(45, 0, 40, 40),
                        width: 300,
                        child: SeekBar(
                          progresseight: 13,
                          value: 100,
                          sectionCount: 4,
                          sectionRadius: 14,
                          showSectionText: true,
                          sectionTexts: sectionTexts,
                          sectionTextMarginTop: 10,
                          sectionDecimal: 0,
                          sectionTextColor: Colors.black,
                          sectionSelectTextColor: Colors.amber,
                          sectionTextSize: 15,
                          //hideBubble: false,
                          bubbleRadius: 14,
                          bubbleColor: Colors.amber,
                          bubbleTextColor: Colors.white,
                          bubbleTextSize: 16,
                          bubbleMargin: 4,
                          afterDragShowSectionText: true,
                          isCanTouch: false,
                        )),
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
                                          style:
                                              TextStyle(color: Colors.red, fontWeight: FontWeight.w400, fontSize: 20),
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
                      margin: EdgeInsets.all(15),
                      //设置 child 居中
                      //alignment: Alignment(0, 0),
                      height: 350,

                      //边框设置
                      decoration: new BoxDecoration(
                        //背景
                        color: Colors.white,
                        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        //设置四周边框
                        //border: new Border.all(width: 1, color: Colors.red),
                      ),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 15, top: 20, bottom: 10),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    '订单信息',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    child: Container(
                                      width: 100,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: new Border.all(width: 1, color: Colors.grey[400]),
                                        borderRadius: BorderRadius.all(Radius.circular(25)),
                                        gradient: LinearGradient(
                                          begin: Alignment(-1, 0),
                                          end: Alignment(1.0, 0),
                                          colors: this._getGradient(),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: this._getContent(),
                                      ),
                                    ),
                                    onTap: () {
                                     
                                    },
                                  ),
                                  SizedBox(
                                    width: 5,
                                  )
                                ],
                              )),
                          Divider(
                            height: 1,
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(15),
                                child: Text(
                                  '小主保证金:',
                                  style: TextStyle(fontSize: 16, color: Colors.grey),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Text('5000.00', style: TextStyle(fontSize: 16, color: Colors.red)),
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  '小侠保证金:',
                                  style: TextStyle(fontSize: 16, color: Colors.grey),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3, right: 10),
                                child: Text('5000.00', style: TextStyle(fontSize: 16, color: Colors.red)),
                              ),
                            ],
                          ),
                          Divider(
                            height: 1,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15, bottom: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  '订单编号:',
                                  style: TextStyle(color: Colors.grey, fontSize: 16),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  '1239819283718923',
                                  style: TextStyle(color: Colors.grey, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15, bottom: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  '小主昵称:',
                                  style: TextStyle(color: Colors.grey, fontSize: 16),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  '今夜无眠',
                                  style: TextStyle(color: Colors.grey, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15, bottom: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  '接单时间:',
                                  style: TextStyle(color: Colors.grey, fontSize: 16),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  '2021-05-22 11:33:21',
                                  style: TextStyle(color: Colors.grey, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(Icons.account_balance_outlined),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Text(
                                    '河南省鹤壁市淇滨区市政府一号院302',
                                    style: TextStyle(color: Colors.grey, fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
        bottomNavigationBar: Container(
          height: 80,
          child: BottomAppBar(
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  child: Container(
                    width: 170,
                    height: 40,
                    decoration: BoxDecoration(
                      border: new Border.all(width: 1, color: Colors.grey[400]),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      gradient: LinearGradient(
                        begin: Alignment(-1, 0),
                        end: Alignment(1.0, 0),
                        colors: this._getGradient1(),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: this._getContent1(),
                    ),
                  ),
                  onTap: () {},
                ),
                Spacer(),
                InkWell(
                  child: Container(
                    width: 170,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment(-1, 0),
                        end: Alignment(1.0, 0),
                        colors: this._getGradient2(),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: this._getContent2(),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Appraise()),
                    );
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

  List<Color> _getGradient() {
    return <Color>[Colors.white, Colors.white];
  }

  List<Widget> _getContent() {
    List<Widget> defaultContent = <Widget>[
      Text(
        '联系小主',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          letterSpacing: 1.2,
        ),
      )
    ];

    return defaultContent;
  }

  List<Color> _getGradient1() {
    return <Color>[Colors.white, Colors.white];
  }

  List<Widget> _getContent1() {
    List<Widget> defaultContent = <Widget>[
      Text(
        '查看钱款',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          letterSpacing: 1.2,
        ),
      )
    ];

    return defaultContent;
  }

  List<Color> _getGradient2() {
    return <Color>[Colors.amber, Colors.amber];
  }

  List<Widget> _getContent2() {
    List<Widget> defaultContent = <Widget>[
      Text(
        '查看评价',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          letterSpacing: 1.2,
        ),
      )
    ];

    return defaultContent;
  }
}
