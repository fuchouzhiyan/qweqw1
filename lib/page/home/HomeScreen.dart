import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/picker_style.dart';
import 'package:lixiangyu/page/home/MainTabTopicWidget.dart';
import 'package:lixiangyu/page/widget/my_text.dart';
import 'package:lixiangyu/page/home/MainTab.dart';
import 'package:lixiangyu/page/widget/search_bar.dart';
import 'package:lixiangyu/page/util/navigator_util.dart';
import 'package:lixiangyu/page/home/search_page.dart';
import 'package:lixiangyu/page/home/speak_page.dart';
import 'package:lixiangyu/page/categories/all_categories.dart';



const SEARCH_BAR_DEFAULT_TEXT = '家政|装修|游戏代练';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  double appBarAlpha = 0;

  // 选择器2
  String initProvince = '河南省', initCity = '鹤壁';
  TabController _tabBarController;

  String city = '西安市';
  @override
  void initState() {
    super.initState();
    _tabBarController = new TabController(
        vsync: this, //固定写法
        length: 3, //指定tab长度
        initialIndex: 1);
  }

  //跳转搜索页面
  void _jumpToSearch() {
    NavigatorUtil.push(
        context,
        SearchPage(
          hint: SEARCH_BAR_DEFAULT_TEXT,
        ));
  }


  @override
  Widget build(BuildContext context) {
    Widget _commitButton = MyText('确认', color: Colors.blue, size: 14);

    var pickerStyle = PickerStyle(
      commitButton: _commitButton,
    );

    //跳转语音识别页面
    void _jumpToSpeak() {
      NavigatorUtil.push(context, SpeakPage());
    }

    


    return  Scaffold(
          appBar: AppBar(
            elevation: 0,
            //backgroundColor: Colors.amber,
            title: Container(
              alignment: Alignment.center,
              height: 38,
//           padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: TabBar(
                controller: _tabBarController,
                labelStyle:
                TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                isScrollable: true,
                //可滚动
                indicatorColor: Colors.amber,
                //指示器的颜色
                labelColor: Colors.black,
                //选中文字颜色
                unselectedLabelColor: Colors.grey,
                //为选中文字颜色
                indicatorSize: TabBarIndicatorSize.label,
                //指示器的高度
                //indicatorWeight:10,
                //指示器与文字等宽
                tabs: <Widget>[
                  Tab(text: "关注"),
                  Tab(text: "推荐"),
                  Tab(text: "斑马"),
                ],
              ),
            ),
            automaticallyImplyLeading: false,
            //隐藏返回箭头
            leading: InkWell(
                child: Center(
                    child: Image(
                  image: AssetImage('assets/images/home/qiandao.png'),
                  height: 47,
                )),
                onTap: () {}),
            actions: <Widget>[
              InkWell(
                child: Container(
                  width: 55,
                  child: Center(
                    child: Text(
                      initCity,
                      style: new TextStyle(color: Colors.black, fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
                onTap: () {
                  Pickers.showAddressPicker(
                    context,
                    initProvince: initProvince,
                    initCity: initCity,
                    initTown: null,
                    pickerStyle: pickerStyle,
                    onConfirm: (p, c, t) {
                      setState(() {
                        initCity = c;
                      });
                    },
                  );
                },
              ),
            ],
          ),
          body: TabBarView(
            controller: _tabBarController,
            children: <Widget>[
              Container(
                  child: Center(
                child: Text('关注'),
              )),

              Container(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: new BoxDecoration(
                                //背景
                                color: Colors.white,
                                //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                //设置四周边框
                                border:
                                new Border.all(width: 2, color: Colors.amber),
                              ),
                              //alignment: Alignment.center,
                              //width: ScreenUtil().setWidth(600),
                              height: ScreenUtil().setHeight(80),
                              margin: EdgeInsets.fromLTRB(10,0,0,0) ,
                              child: SearchBar(
                                searchBarType: appBarAlpha > 0.2
                                    ? SearchBarType.homeLight
                                    : SearchBarType.home,
                                inputBoxClick: _jumpToSearch,
                                speakClick: _jumpToSpeak,
                                defaultText: SEARCH_BAR_DEFAULT_TEXT,

                                city: city,
                              ),
                            ),
                            flex: 12,
                          ),
                          Expanded(
                            child: InkWell(
                              child: Container(
                                  alignment: Alignment.center,
                                  width: 55,
                                  child: Image.asset('assets/images/home/fenlei.jpeg')
                              ),
                              onTap: (){
                                NavigatorUtil.push(context, AllCategories());
                              },
                            ),
                            flex: 4,
                          )


                        ],
                    ),

                      
                    ),
                    Container(
                      child: MainTabTopicWidget(),
                      
                    ),
                    Container(
                      child: MainTab(),
                      
                    )
                  ],
                ),
              ),
              Container(
                  child: Center(
                child: Text('斑马'),
              )),
            ],
          ),
        );
  }
}
