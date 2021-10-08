import 'package:flutter/material.dart';
import 'package:lixiangyu/page/util/Screen.dart';
import 'package:lixiangyu/page/mine/MineHeader.dart';
import 'package:lixiangyu/page/mine/MineSell.dart';
import 'package:lixiangyu/page/mine/MineBuy.dart';
import 'package:lixiangyu/page/mine/MinePlay.dart';


class MineScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MineScreenState();
}

class MineScreenState extends State<MineScreen> {

double naviAlpha = 0;
  ScrollController _scrollController;

  
  @override
  void initState() {
    super.initState();
    print("Init Mine page");

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      var offset = _scrollController.offset;
      if (offset < 0) {
        setState(() {
          naviAlpha = 0;
        });
      } else if (offset < 50) {
        setState(() {
          naviAlpha = 1 - (50 - offset) / 50;
        });
      } else if (naviAlpha != 1) {
        setState(() {
          naviAlpha = 1;
        });
      }
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
        body: Stack(
          children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 80),
            height: Screen.height(context),
            color: Colors.grey[100],
          ),
          ListView(
            controller: _scrollController,
            children: <Widget>[
              MineHeader(),
              SizedBox(height: 10,),
              MinePlay(),
               SizedBox(height: 10,),
               MineSell(),
               SizedBox(height: 10,),
               MineBuy(),
               SizedBox(height: 10,),
               
              // FSMineTool(),
              // SizedBox(height: 40,),
            ],
          ),

          //MineNavibar(naviAlpha),
        ],
        )
    );
  }

}
