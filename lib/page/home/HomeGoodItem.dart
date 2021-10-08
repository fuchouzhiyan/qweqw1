
import 'package:flutter/material.dart';
import 'HomeGoodModel.dart';
import 'package:lixiangyu/page/good/details.dart';

enum FHHomeGoodTagType {
  none,
  allNew,  // 全新
  reSell,  // 专卖
}

class HomeGoodItem extends StatelessWidget {

  HomeGoodItem({Key key, this.model}) : super(key: key);

  final HomeGoodModel model;

  final double fontSize = 18;
  final double tagFontSize = 16;

  @override
  Widget build(BuildContext context) {
    return buildCard( context);
  }

  Widget buildCard(context) {
    return InkWell(
      child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          buildGoodImage(),

          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: buildGoodTitle(),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: buildGoodPriceRow(),
          ),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Divider(),
          ),
          
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: buildUserInfo(),
          )

        ],
      )
    ),
    onTap: (){
        Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return DetailsPage();
                  })
        );
    }
    
    );
    
  }

  Widget buildGoodImage() {
    return Stack(
        children: [
          Container(
            //height: model.mediaHeight,
            height: 201,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4)
              ),
              image: DecorationImage(
                image: AssetImage(model.mediaURL),
                fit: BoxFit.cover
              )
            ),
          ),
          Positioned(
                    top: 70,
                    right: 0,
                    child: Container(
                      width: 80,
                      height: 80,
                      child: Image.asset('assets/images/home/jinbi.gif'),
                    ),
                  ),
                  Positioned(
                    top: 170,
                    right: 2,
                    child: Container(
                      child: Row(children: [
                        Icon(
                          Icons.attach_money,
                          color: Colors.red,
                        ),
                        Text(
                          '200',
                          style: (TextStyle(
                            fontSize: 28,
                            color: Colors.red,
                          )),
                        )
                      ],)
                    ),
                  )
        ],
    );
    
    
  }

  Widget buildGoodPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 3.0,),
          child: Stack(
            children: [

              SizedBox(
                height: 15.0,
                width: 98.0,
                // 圆角矩形剪裁（`ClipRRect`）组件，使用圆角矩形剪辑其子项的组件。
                child: ClipRRect(
                  // 边界半径（`borderRadius`）属性，圆角的边界半径。
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: LinearProgressIndicator(
                    value: 0.6,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                  ),
                ),
              ),
              Container(
                height: 15.0,
                width: 98.0,
                padding: EdgeInsets.only(left: 10.0,),
                alignment: Alignment.centerLeft,
                child: Text(
                  '已抢60%',
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 10.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          "${model.wantedCount}关注",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey
          ),
        ),
      ],
    );
  }

  Widget buildUserInfo() {
    return Row(
      children: <Widget>[
        // avatar 
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            image: DecorationImage(
              image: AssetImage(model.avatarURL),
              fit: BoxFit.cover,
            )
          ),
        ),

        // info 
        buildUserDetail(),
        buildUserSpace()

      ],
    );
  }

  Widget buildUserSpace(){
        return Row(
            children: [
              SizedBox(
                  width: 15,
                ),
              Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                      '距你:'
                  ),
                ),
               Container(
                  child: Text(
                      '3km',
                    style: TextStyle(
                      color: Colors.amber
                    ),
                  ),
                ),
               Container(
                  child: Icon(
                    Icons.add_location_alt_outlined,
                    color: Colors.amber,
                    size: 12.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                ),
                
            ],
        
          
        );
           

  }

  Widget buildUserDetail() {
    if (model.isCredictExeclent) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            model.userName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ]
      );
    } else {
      return Text(
        model.userName,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
      );
    }
  }

  // 描述
  Widget buildGoodTitle() {
    if (FHHomeGoodTagType.values[model.tag] == FHHomeGoodTagType.none) {
      return RichText(
        maxLines: 2,
        overflow: TextOverflow.clip,
        text: TextSpan(
          children: [
            goodTag(),
            goodDetail()
          ]
        ),
      );
    } else {
      return RichText(
        maxLines: 2,
        overflow: TextOverflow.clip,
        text: TextSpan(
          children: [
            goodTag(),
            goodDetail()
          ]
        ),
      );
    }
  }

  TextSpan goodDetail() {
    return TextSpan(
      text: " ${model.detail}",
      style: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  TextSpan goodTag() {
    Color bgColor;
    Color textColor;
    String title;

    switch (FHHomeGoodTagType.values[model.tag]) {
      case FHHomeGoodTagType.allNew:
        bgColor = Colors.amber;
        textColor = Colors.white;
        title = "装修";
        break;

      case FHHomeGoodTagType.reSell:
        bgColor = Colors.red;
        textColor = Colors.white;
        title = "家政";
        break;

      default: break;
    }

    return TextSpan(
      text: "$title",
      style: TextStyle(
        backgroundColor: bgColor,
        color: textColor,
        fontSize: 12,
      ),
    );
  }
}