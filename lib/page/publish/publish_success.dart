import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart' as fluwx;


class PublishSuccess extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PublishSuccessState();
}

class PublishSuccessState extends State<PublishSuccess> {
  List<String> nameItems = <String>['微信', '朋友圈', 'QQ', 'QQ空间'];
  List<String> urlItems = <String>[
    'touxiang.jpeg',
    'touxiang.jpeg',
    'touxiang.jpeg',
    'touxiang.jpeg'
  ];

  @override
  void initState() {
    super.initState();
    _initFluwx();
  }

  _initFluwx() async {
    await fluwx.registerWxApi(
        appId: "wxe05482a3a754ffcd",
        doOnAndroid: true,
        doOnIOS: true,
        universalLink: "https://www.kehaojiaoyu.com/");
    var result = await fluwx.isWeChatInstalled;
    print("is installed $result");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(child: Text('发布完成')),
          actions: [
            InkWell(
              child: Center(
                widthFactor: 2,
                child: Icon(Icons.share_sharp),
              ),
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                    context: context,
                    builder: (BuildContext context) {
                      return _shareWidget(context);
                    });
              },
            )
          ],
        ),
        body: Center(
          child: Text('发布完成'),
        ));
  }

  Widget _shareWidget(BuildContext context) {
    return Container(
      height: 180.0,
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
            child: new Container(
              height: 150.0,
              child: new GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, mainAxisSpacing: 5.0, childAspectRatio: 1.0),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Column(
                    children: <Widget>[
                      new Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 6.0),
                          child: new Image.asset(
                            'assets/images/home/${urlItems[index]}',
                            width: 50.0,
                            height: 50.0,
                            fit: BoxFit.fill,
                          )),
                      new Text(nameItems[index])
                    ],
                  ),
                  onTap: (){
                      var model = fluwx.WeChatShareWebPageModel(
                      'https://www.kehaojiaoyu.com/',
                      title: '微信',
                      thumbnail: fluwx.WeChatImage.network('https://www.kehaojiaoyu.com/'),
                      scene: fluwx.WeChatScene.SESSION,
                    );
                    fluwx.shareToWeChat(model);

                  },
                  ); 
                },
                itemCount: nameItems.length,
              ),
            ),
          ),
          // new Container(
          //   height: 0.5,
          //   color: Colors.blueGrey,
          // ),
          // new InkWell(
          //   child: new Center(
          //     child: new Padding(
          //       padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
          //       child: new Text(
          //         "取 消",
          //         style: new TextStyle(fontSize: 18.0, color: Colors.blueGrey),
          //       ),
          //     ),
          //   ),
          //   onTap: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
        ],
      ),
    );
  }
}
