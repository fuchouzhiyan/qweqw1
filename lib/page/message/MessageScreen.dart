import 'package:lixiangyu/page/message/MessageListItem.dart';
import 'package:lixiangyu/page/message/MessageModel.dart';
import 'package:flutter/material.dart';
import 'package:lixiangyu/page/message/MessageHeader.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class MessageScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MessageScreenState();
}

class MessageScreenState extends State<MessageScreen> {
  List<MessageModel> _messageList = [
    MessageModel(avatar: "assets/images/home/touxiang.jpeg", name: "我关注的", content: "imsdh666发布了全新金色Xs Max 64 无敌iPhone", date: "1天前", image: "assets/images/home/touxiang.jpeg"),
    MessageModel(avatar: "assets/images/home/touxiang.jpeg", name: "qiqi1015122", content: "no", date: "1个月前", image: "assets/images/home/touxiang.jpeg"),
    MessageModel(avatar: "assets/images/home/touxiang.jpeg", name: "122222", content: "no", date: "1个月前", image: "assets/images/home/touxiang.jpeg"),
    MessageModel(avatar: "assets/images/home/touxiang.jpeg", name: "edceezz", content: "你有一条消息", date: "1个月前", image: "assets/images/home/touxiang.jpeg"),
  ];

  EasyRefreshController _easyRefreshKey;


  @override
  void initState() {
    super.initState();
    print("Init Message page");
  }

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        title: Text(
          "消息",
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
      body: buildBody(),    
    );
  }

  // Widget body() {
  //   return Refresh(
  //     onHeaderRefresh: () {},
  //     child: buildList(),
  //   );
  // }

  Widget buildBody() {
    return EasyRefresh(
      controller: _easyRefreshKey,
      behavior: ScrollBehavior(),
      header:ClassicalHeader(
        
      ),
      footer: ClassicalFooter(),
      enableControlFinishRefresh: false,
      enableControlFinishLoad: true,
      child: buildList(),
      onRefresh: refreshFirstData,
      onLoad: refreshMoreData,
    );
  }

  Widget buildList() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            child: MessageHeader(),
          ),
        ),

        SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext buildContext, int index) {
              //return FSMessageListItem(message: _messageList[index], isMyFollow: index == 0,);
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: MessageListItem(message: _messageList[index], isMyFollow: index == 0,),
                onTap: () {
                  print(index);  
                },
              );
            },
            childCount:_messageList.length,
          ),
        )
      ],
    );
  }

  Future refreshFirstData() async {    
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        
      });
    });
  }

  Future refreshMoreData() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        
      });
    });
  }

}
