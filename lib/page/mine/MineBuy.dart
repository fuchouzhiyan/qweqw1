import 'package:flutter/material.dart';
import 'package:lixiangyu/page/order/appraise_order.dart';
import 'package:lixiangyu/page/order/success_taking.dart';

import 'MineItem.dart';

class MineBuy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "鱼小侠",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16
                  )
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "在理想鱼赚了1867.00元",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14
                  )
                ),
              ],
            ),
            
            SizedBox(
              height: 16,
            ),

            // grid 
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              shrinkWrap: true,
              childAspectRatio: 1.8,
              padding: EdgeInsets.all(0),
              children: <Widget>[
                InkWell(
                  child: MineItem(image: "assets/images/home/touxiang.jpeg", title: "接单任务数量 21"),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AppraiseOrder()),
                      );
                  },
                ),
                InkWell(
                  child: MineItem(image: "assets/images/home/touxiang.jpeg", title: "完成任务数量 8"),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SuccessTaking()),
                      );
                  },
                )  
              ],
            ),
          ],
        ),
      ),
    );
  }
}