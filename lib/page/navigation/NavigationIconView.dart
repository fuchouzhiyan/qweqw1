import 'package:flutter/material.dart';


//展示控件
class NavigationIconView{

  //两个属性 一个展示图片 一个是动画处理
  BottomNavigationBarItem item;

  AnimationController controller;

  NavigationIconView(Widget icon,String title,TickerProvider vsync){

    item = new BottomNavigationBarItem(icon: icon,label: title);

    controller = new AnimationController(
        duration: kThemeAnimationDuration, //设置动画时间
        vsync: vsync //默认属性和参数
    );

  }

}
