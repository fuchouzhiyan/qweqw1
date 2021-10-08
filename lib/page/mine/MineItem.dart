
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MineItem extends StatelessWidget {
  
  MineItem({
    Key key,
    this.image,
    this.title
  }) : super(key: key);

  final String image;
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(image,
        width: 35,
          height: 35,
          fit: BoxFit.cover,),
        SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14
          )
        )
      ],
    );
  }
}