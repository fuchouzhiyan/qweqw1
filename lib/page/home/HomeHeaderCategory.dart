
import 'package:lixiangyu/page/category/CategoryPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeHeaderCategory extends StatelessWidget {

  final List<String> _categoryList = ["斑马救援", "搬家",    "保姆月嫂", "保洁清洗", "开锁换锁",
                                      "房屋维修", "管道疏通",    "全部分类"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20,left: 20,right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(14)),
         image: new DecorationImage(
               image: new AssetImage('assets/images/home/分类背景.gif'), 
                 fit: BoxFit.cover,
                //这里是从assets静态文件中获取的，也可以new NetworkImage(）从网络上获取
         //centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
            ),
        //border: new Border.all(width: 2.0, color: Colors.amber),
      ),
      child: GridView(
        shrinkWrap: true, // 收缩，只占用他需要的大小，而不是占满全屏
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 0,
          crossAxisSpacing: 20,
          childAspectRatio: 1
        ),
        children: _categoryList.map((String name){
          return GestureDetector(
            onTap: () {
              print(name);
              if (name == "全部分类") {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return CategoryPage();
                  })
                );
              }
            },
            child:  Container(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.cyan[100],
                    backgroundImage: AssetImage('assets/images/home/touxiang.jpeg'),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ],
              ),
            )
          );
        }).toList(),
      ),
    );
  }
}
