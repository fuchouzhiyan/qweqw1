
import 'package:lixiangyu/page/message/MessageModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessageListItem extends StatelessWidget {

  MessageListItem({Key key, this.message, this.isMyFollow}) : super(key: key);
  
  final bool isMyFollow;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          buildMeesageItem(),
          Divider(color: Colors.grey[300], indent: 80, height: 1,),
        ],
      )
    );
  }

  Widget buildMeesageItem() {
    List<Widget> _list = [];

    Widget avatar = Container(
      margin: EdgeInsets.all(6),
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        image: DecorationImage(
          image: ExactAssetImage('assets/images/home/touxiang.jpeg'),
          fit: BoxFit.cover,
        )
      ),
    );

    // Avatar 
    if (isMyFollow) {
      _list.add(
        Padding(
          padding: EdgeInsets.only(top: 0, left: 6),
          child: Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              avatar,
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(14/2),
                    border: Border.all(color: Colors.white, width: 2)
                  ),
                )
              )
            ],
          )
        )
      );
    } else {
      _list.add(
        Padding(
          padding: EdgeInsets.only(top: 6, left: 6),
          child: avatar,
        )
      );
    }

    // 文本
    _list.add(
      Expanded(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 18, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                message.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16
                ),
              ),

              Text(
                message.content,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Text(
                message.date,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10
                ),
              ),
            ],
          ),
        )
      ),
    );

    // chat image 
    if (!isMyFollow) {
      _list.add(
        Padding(
          padding: EdgeInsets.only(top: 10, right: 18),
          child:  Image.asset(
            'assets/images/home/touxiang.jpeg',
            width: 60,
            height: 60,
          ),
        )
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _list,
    );
  }
}