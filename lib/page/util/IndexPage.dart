import 'package:flutter/material.dart';
import 'package:lixiangyu/page/navigation/NavigationIconView.dart';
import 'package:lixiangyu/page/business/BusinessScreen.dart';
import 'package:lixiangyu/page/message/MessageScreen.dart';
import 'package:lixiangyu/page/mine/MineScreen.dart';
import 'package:lixiangyu/page/util/FloatingActionButtonDemo.dart';
import 'package:lixiangyu/page/home/HomePage.dart';
import 'package:lixiangyu/page/test/modal_fit.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> with TickerProviderStateMixin{
  int _currentIndex = 0;

  static const PrimaryColor = Colors.white;
  //底部按钮区域
  List<NavigationIconView> _naNavigationIconView;

  //图标对应的页面
  List _pageList;

  //当前显示页面
  StatefulWidget _currentPage;

  // 定义一个空的设置状态值的方法
  void _rebuild() {
    setState(() {});
  }

  //做初始化操作
  @override
  void initState() {
    super.initState();
    //初始化导航图标
    _naNavigationIconView = <NavigationIconView>[
      new NavigationIconView(new Icon(Icons.home), "首页", this),
      new NavigationIconView(new Icon(Icons.account_balance), "侠者", this),
      new NavigationIconView(new Icon(Icons.add), "", this),
      new NavigationIconView(new Icon(Icons.message), "消息", this),
      new NavigationIconView(new Icon(Icons.person), "我的", this),
    ];
    //加上监听
    for (NavigationIconView view in _naNavigationIconView) {
      view.controller.addListener(_rebuild);
    }
    //将bottomBar 上面的图标与页面关联起来，方便点击
    _pageList =
    [
      HomePage(),
      BusinessScreen(),
      ModalFit(),
      MessageScreen(),
      MineScreen(),
    ];
    _currentPage = _pageList[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    //声明一个底部导航工具栏
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(

      items: _naNavigationIconView.map((
          NavigationIconView navigationIconView) =>
      navigationIconView.item)
          .toList(),
      //添加icon按钮
      currentIndex: _currentIndex,
      //添加索引值
      type: BottomNavigationBarType.fixed,
      //固定不动
      selectedItemColor: Colors.amber,
      onTap: (int index) { //添加点击事件
        setState(() {
          _naNavigationIconView[_currentIndex].controller.reverse();
          _currentIndex = index;
          _naNavigationIconView[_currentIndex].controller.forward();
          _currentPage = _pageList[_currentIndex];
        });
      },

    );

    return Scaffold(
                body: new Center(
                    child: _currentPage // 动态的展示我们当前的页面
                ),
                bottomNavigationBar: bottomNavigationBar,
                floatingActionButton: FloatingActionButtonDemo(),
                floatingActionButtonLocation: FloatingActionButtonLocation
                    .centerDocked, // 底部工具栏
              
            
    );
    

  }
}