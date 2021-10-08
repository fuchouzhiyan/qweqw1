import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lixiangyu/page/purse/purse_details.dart';
import 'package:lixiangyu/page/purse/with_draw.dart';
import 'package:lixiangyu/page/customer/service_charge.dart';

import 'MineItem.dart';

class MinePlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("常用功能", style: TextStyle(color: Colors.black, fontSize: 16)),
                SizedBox(
                  width: 4,
                ),
              ],
            ),

            SizedBox(
              height: 16,
            ),

            // grid
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              shrinkWrap: true,
              childAspectRatio: 1.2,
              padding: EdgeInsets.all(0),
              children: <Widget>[
                InkWell(
                  child: MineItem(image: "assets/images/home/touxiang.jpeg", title: "我的钱包"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PurseDetails()),
                    );
                  },
                ),
                InkWell(
                  child: MineItem(image: "assets/images/home/touxiang.jpeg", title: "提现"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WithDraw()),
                    );
                  },
                ),
                InkWell(
                  child: MineItem(image: "assets/images/home/touxiang.jpeg", title: "手续费查询"),
                  onTap: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ServiceCharge()),
                    );
                  },
                ),
                
                MineItem(image: "assets/images/home/touxiang.jpeg", title: "斑马"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  
}
