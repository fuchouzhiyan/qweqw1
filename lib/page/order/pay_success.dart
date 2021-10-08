import 'package:flutter/material.dart';
import 'package:lixiangyu/page/order/order_details.dart';

//接单详情
class PaySuccess extends StatefulWidget {
  @override
  _PaySuccessState createState() => _PaySuccessState();
}

class _PaySuccessState extends State<PaySuccess> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('接单完成'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Image.asset(
                'assets/images/pay/对勾.jpeg',
                width: 180,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                '恭喜您接单成功!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                '您的接单数量打败了全国80%的小侠',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 40, left: 40, right: 40),
                child: Divider(
                  height: 1,
                  color: Colors.black,
                )),
            Container(
              padding: EdgeInsets.only(top: 15, left: 40, right: 40),
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Icon(Icons.access_alarm),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '2021-05-22 11:33:21',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Text(
                    '截单时间',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 20, left: 40, right: 40),
                child: Divider(
                  height: 1,
                  color: Colors.black,
                )),
            Container(
              padding: EdgeInsets.only(top: 15, left: 40, right: 40),
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
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
            Container(
                padding: EdgeInsets.only(top: 20, left: 40, right: 40),
                child: Divider(
                  height: 1,
                  color: Colors.black,
                )),
            Container(
              padding: EdgeInsets.only(top: 15, left: 40, right: 40),
              child: Row(
                children: [
                  InkWell(
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
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
                    onTap: () {},
                  ),
                  Spacer(),
                  InkWell(
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrderDetails()),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Color> _getGradient() {
    return <Color>[Colors.grey, Colors.grey];
  }

  List<Widget> _getContent() {
    List<Widget> defaultContent = <Widget>[
      Text(
        '返回首页',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          letterSpacing: 1.2,
        ),
      )
    ];

    return defaultContent;
  }

  List<Color> _getGradient1() {
    return <Color>[Colors.amber, Colors.amber];
  }

  List<Widget> _getContent1() {
    List<Widget> defaultContent = <Widget>[
      Text(
        '查看订单详情',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          letterSpacing: 1.2,
        ),
      )
    ];

    return defaultContent;
  }
}
