
import 'package:flutter/material.dart';
import 'package:lixiangyu/page/order/no_taking.dart';
import 'package:lixiangyu/page/order/go_on_taking.dart';
import 'package:lixiangyu/page/order/success_taking.dart';

import 'MineItem.dart';

class MineSell extends StatelessWidget {
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
                  "鱼小主",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16
                  )
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "在理想鱼发布任务总数量 8",
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
              childAspectRatio: 1.6,
              padding: EdgeInsets.all(0),
              children: <Widget>[
                InkWell(
                  child: MineItem(image: "assets/images/home/touxiang.jpeg", title: "未接单任务 2"),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NoTaking()),
                      );
                  },
                ),
                InkWell(
                  child: MineItem(image: "assets/images/home/touxiang.jpeg", title: "进行中任务 4"),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GoOnTaking()),
                      );
                  },
                ),
                InkWell(
                child:MineItem(image: "assets/images/home/touxiang.jpeg", title: "已完成评价 2"),
                onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SuccessTaking()),
                      );
                  },
                ),
              ],
            ),

            // tip 
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.blue[200],
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/home/touxiang.jpeg'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),

                  SizedBox(
                    width: 8,
                  ),

                  Expanded(
                    child: Text(
                      "任务已被接单",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14
                      )
                    ),
                  ),

                  Container(
                    height: 30,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.blue[400], width: 0.5)
                    ),
                    child: Center(
                      child: Text(
                        "去看看",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                        )
                      ),
                    ),
                  )

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}