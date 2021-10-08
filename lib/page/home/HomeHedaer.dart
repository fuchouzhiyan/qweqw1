import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'HomeHeaderAdsOne.dart';
import 'HomeHeaderAdsTwo.dart';
import 'HomeHeaderCategory.dart';

class HomeHedaer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Stack(
        children: <Widget>[
          Container(
            height: 240,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
              )
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: <Widget>[
                HomeHeaderCategory(),
                SizedBox(height: 12,),
                HomeHeaderAdsOne(),
                SizedBox(height: 12,),
                //HomeHeaderAdsTwo(),
              ],
            ),
          )
        ],
      )
    );
  }
}
