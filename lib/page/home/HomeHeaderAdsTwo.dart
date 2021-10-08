
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'HomeAdsModel.dart';

class HomeHeaderAdsTwo extends StatelessWidget {

  final List<HomeAdsModel> _adsList = [
    HomeAdsModel("发布闲置", "30秒发布宝贝", "assets/images/home/touxiang.jpeg"),
    HomeAdsModel("淘宝专卖", "网购淘宝一件发布", "assets/images/home/touxiang.jpeg"),
    //HomeAdsModel("信用回收", "先收钱 再寄货", "assets/images/home/touxiang.jpeg"),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      // child: Padding(
      //   padding: EdgeInsets.all(10),
      //   child: Column(
      //     children: <Widget>[
      //       //buildRowOneWidget(),
      //       //builtRowTwoWidget(),
      //       //Divider(),
      //       //buildRowThreeWidget(),
      //     ],
      //   ),
      // )
    );
  }  

  Widget buildRowOneWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "卖闲置能换钱",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),

        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "最新发布",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14
                )
              ),
              
              TextSpan(
                text: "3564",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14
                )
              ),

              TextSpan(
                text: "件闲置",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14
                )
              ),
            ]
          )
        )
      ],
    );
  }

  Widget builtRowTwoWidget() {
    return Padding(
      padding: EdgeInsets.all(0),
      child: IntrinsicHeight(
        child: Row(
          children: <Widget>[
            buildAdsItemWidget(_adsList[0]),
            VerticalDivider(),
            SizedBox(width: 5,),
            buildAdsItemWidget(_adsList[1]),
          ],
        )
      ),
    );
  }

  Widget buildRowThreeWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

        Container(
          height: 100,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            buildAdsItemWidget(_adsList[2]),
            
          ],
        )),

        SizedBox(
          width: 20,
        ),

        buildRowThreeItem("手机回收"),
        buildRowThreeItem("旧衣回收"),
        buildRowThreeItem("卡券回收"),

      ],
    );
  }

  Widget buildRowThreeItem(String title) {
    return 
    Padding(
      padding: EdgeInsets.only(left: 6, right: 6),
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/home/touxiang.jpeg',
            width: 50,
            height: 50,
          ),
          SizedBox(height: 5,),
          Text(
            title,
            style: TextStyle(
              color: Colors.black45,
              fontSize: 12,
            ),
          )
        ],
      )
    );
  }

  // item 
  Widget buildAdsItemWidget(HomeAdsModel model) {
    return Expanded(child: 
      Container(
        padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(model.imgUrl),
                ),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  model.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.amber
                  )
                ),
                Text(
                  model.detail,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: Colors.black54
                  )
                ),
              ],
            ), 
  
          ],
        ),
      )
    );
  }
}