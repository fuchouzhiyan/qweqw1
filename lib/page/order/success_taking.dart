import 'package:flutter/material.dart';
import 'package:lixiangyu/page/order/success_order_details.dart';


class SuccessTaking extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SuccessTakingState();
}

class SuccessTakingState extends State<SuccessTaking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "完成的任务",
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _listInfos(),
    );
  }

  //list列表
  Widget _listInfos() {
    return Container(
        color: Colors.grey[200],
        child: ListView.builder(
            itemCount: 3, //此处展示需要写成 3，实际适用时  _listData==null?0:_listData.length
            itemBuilder: (content, index) {
              return _listItem();
            }));
  }

//list列表的item
  Widget _listItem() {
    return InkWell(
      child: Container(
        height: 110, //设置item的高度
        margin: EdgeInsets.only(left: 5, right: 5, top: 10), //设置item的边距
        decoration: BoxDecoration(
          color: Colors.white,
          //border: Border.all(color: Colors.amber,width: 1),//设置边框的宽度 以及 颜色
          borderRadius: BorderRadius.all(Radius.circular(20)), //设置圆角
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: 100,
              margin: EdgeInsets.all(10), //设置图片的边距
              child: Image.asset("assets/images/home/touxiang.jpeg"),
            ), //涉及到widget的大小或者边框的时候，使用container包裹
            Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width - 120,
              child: Column(
                children: <Widget>[
                  Text("邦宁家政有限责任公司，长期培训，招聘家政人员，月嫂，希望有梦想，有责任的都来加入我们。"),
                  Expanded(
                    //此处使用expanded 填充，然后设置container 的对其方式确保 在底部显示
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Image.asset(
                            'assets/icons/人民币.png',
                            width: 10,
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft, //设置container的对其方式
                          child: Text(
                            "5000.00",
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomRight, //设置container的对其方式
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end, //设置ROW的对其显示方式
                              children: <Widget>[
                                Text(
                                  "完成时间:",
                                  style: TextStyle(color: Colors.green[500]),
                                ),
                                Text(
                                  "2021-01-09",
                                  style: TextStyle(color: Colors.green[500]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ), //expanded类似于Android View的layout_weight属性按照比例填充，flex: 为1 时可以不填写此属性
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SuccessOrderDetails()),
        );
      },
    );
  }
}
