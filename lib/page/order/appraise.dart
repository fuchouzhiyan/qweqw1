import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:extended_text_field/extended_text_field.dart';
import 'package:lixiangyu/page/widget/my_special_text_span_builder.dart';
import "package:dio/dio.dart";

//接单详情
class Appraise extends StatefulWidget {
  @override
  _AppraiseState createState() => _AppraiseState();
}

class _AppraiseState extends State<Appraise> with TickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
  }

  FocusNode focusNode = FocusNode();

  List<MultipartFile> mSubmitFileList = [];

  MySpecialTextSpanBuilder _mySpecialTextSpanBuilder = MySpecialTextSpanBuilder();

  TextEditingController _mEtController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('评价'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              //设置 child 居中
              //alignment: Alignment(0, 0),
              height: 200,
              //边框设置
              decoration: new BoxDecoration(
                //背景
                color: Colors.white,
                //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                //设置四周边框
                //border: new Border.all(width: 1, color: Colors.red),
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '评价小侠',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.amber),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '服务态度:',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '服务质量:',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '服务速度:',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Text(
              '评论',
              style: TextStyle(
                fontSize: 20,
                color: Colors.amber
              ),
            ),
            ),         
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              //设置 child 居中
              //alignment: Alignment(0, 0),
              height: 200,
              //边框设置
              decoration: new BoxDecoration(
                //背景
                color: Colors.white,
                //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                //设置四周边框
                //border: new Border.all(width: 1, color: Colors.red),
              ),
              child: ExtendedTextField(
                specialTextSpanBuilder: _mySpecialTextSpanBuilder,
                controller: _mEtController,
                maxLines: 5,
                focusNode: focusNode,
                style: TextStyle(color: Colors.black, fontSize: 18),
                decoration: InputDecoration.collapsed(
                    hintText: "填写对本次的评价", hintStyle: TextStyle(color: Color(0xff919191), fontSize: 18)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:20),
              child: InkWell(
                  child: Container(
                    width: 170,
                    height: 40,
                    decoration: BoxDecoration(
                      border: new Border.all(width: 1, color: Colors.grey[400]),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      gradient: LinearGradient(
                        begin: Alignment(-1, 0),
                        end: Alignment(1.0, 0),
                        colors: this._getGradient(),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: this._getContent(),
                    ),
                  ),
                  onTap: () {},
                ),
            )
          ],
        ),
      ),
      )
      
    );
  }

  List<Color> _getGradient() {
    return <Color>[Colors.amber, Colors.amber];
  }

  List<Widget> _getContent() {
    List<Widget> defaultContent = <Widget>[
      Text(
        '提交',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          letterSpacing: 1.2,
        ),
      )
    ];

    return defaultContent;
  }
}
