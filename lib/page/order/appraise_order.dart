import 'package:flutter/material.dart';
import 'package:lixiangyu/page/order/no_appraise.dart';
import 'package:lixiangyu/page/order/xx_go_on_order_details.dart';

class AppraiseOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppraiseOrderState();
}

class AppraiseOrderState extends State<AppraiseOrder> with TickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 添加监听器
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
        title: Text(
          "进行中任务",
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          
          //选中文字颜色
                unselectedLabelColor: Colors.black,
                //为选中文字颜色
                indicatorSize: TabBarIndicatorSize.label,
                //可滚动
            indicatorColor: Colors.amber,
            //指示器的颜色
            labelColor: Colors.amber,
                  isScrollable: true,
                  indicator: const BoxDecoration(),
          tabs: [
            Text('未完成的任务',style: TextStyle(fontSize: 18),),
            Text('已完成未评价任务',style: TextStyle(fontSize: 18),),
          ],
        ),
      ),
      ),
      
      body: _listInfos(),
    );
  }

  //list列表
  Widget _listInfos() {
    return TabBarView(
      controller: _tabController,
      children: [
        Container(
            color: Colors.grey[200],
            child: ListView.builder(
                itemCount: 3, //此处展示需要写成 3，实际适用时  _listData==null?0:_listData.length
                itemBuilder: (content, index) {
                  return _listItem();
                })),
                Container(
            color: Colors.grey[200],
            child: ListView.builder(
                itemCount: 3, //此处展示需要写成 3，实际适用时  _listData==null?0:_listData.length
                itemBuilder: (content, index) {
                  return _listItem1();
                }))
      ],
    );
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
                                  "状态:",
                                  style: TextStyle(color: Colors.green[500]),
                                ),
                                Text(
                                  "预约上门",
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
          MaterialPageRoute(builder: (context) => XxGoOnOrderDetails()),
        );
      },
    );
  }

  //list列表的item
  Widget _listItem1() {
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
                                  "状态:",
                                  style: TextStyle(color: Colors.green[500]),
                                ),
                                Text(
                                  "预约上门",
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
          MaterialPageRoute(builder: (context) => NoAppraiseOrderDetails()),
        );
      },
    );
  }
}
