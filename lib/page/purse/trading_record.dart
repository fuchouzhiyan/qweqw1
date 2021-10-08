import 'package:flutter/material.dart';

//接单详情
class TradingRecord extends StatefulWidget {
  @override
  _TradingRecordState createState() => _TradingRecordState();
}

class _TradingRecordState extends State<TradingRecord> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('交易记录'),
      ),
      body: SingleChildScrollView(
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
    );
  }
}
