import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path/path.dart';
import 'package:lixiangyu/page/customer/customer_service.dart';

class MineHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        buildBottomWrap(),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[buildProfile(context), buildStatistic()],
          ),
        )
      ],
    );
  }

  Widget buildProfile(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // avatar
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: ExactAssetImage('assets/images/home/touxiang.jpeg'), fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 10,
          ),
          // context
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("专卖小铺子",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    )),
                SizedBox(
                  height: 4,
                ),
                Text("昵称: 小铺子", style: TextStyle(color: Colors.black87, fontSize: 14)),
                SizedBox(
                  height: 4,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  height: 20,
                  width: 78,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "个人主页",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                        color: Colors.black,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          GestureDetector(
            child: Container(child: _popupMenuButton(context)),
          )
        ],
      ),
    );
  }

  Widget buildStatistic() {
    return Padding(
        padding: EdgeInsets.fromLTRB(14, 16, 14, 12),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "9超赞",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              Container(
                width: 0.8,
                height: 12,
                color: Colors.grey,
              ),
              Text(
                "9关注",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              Container(
                width: 0.8,
                height: 12,
                color: Colors.grey,
              ),
              Text(
                "9粉丝",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 17),
              )
            ],
          ),
        ));
  }

  Widget buildBottomWrap() {
    return Container(
      height: 140,
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
    );
  }

  PopupMenuButton _popupMenuButton(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.settings,
        size: 30,
      ),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            child: Text("用户中心"),
            value: "0",
          ),
          PopupMenuItem(
            child: Text("系统设置"),
            value: "1",
          ),
          PopupMenuItem(
            child: Text("帮助中心"),
            value: "2",
          ),
        ];
      },
      onSelected: (Object object) {
        if (object == "2") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CustomerService()),
          );
        }
      },
      onCanceled: () {
        print("canceled");
      },
    );
  }
}
