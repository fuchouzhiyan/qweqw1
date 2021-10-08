import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:ff_stars/ff_stars.dart';
import 'package:lixiangyu/page/model/user_result.dart';
import 'package:lixiangyu/page/model/user.dart';
import 'package:lixiangyu/page/chat/conversation.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<String> nameItems = <String>['微信', '朋友圈', 'QQ', 'QQ空间'];
  List<String> urlItems = <String>['touxiang.jpeg', 'touxiang.jpeg', 'touxiang.jpeg', 'touxiang.jpeg'];

  bool _followStatus = false;

  User toUser;

  // 顶部导航
  Widget _buildAppBar() {
    return AppBar(elevation: 0, backgroundColor: Colors.white, title: Text('任务详情'), actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.share,
          color: Colors.black,
        ),
        onPressed: () {
          //Share.share('${widget.item.title} ${widget.item.url}');
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              context: context,
              builder: (BuildContext context) {
                return _shareWidget(context);
              });
        },
      ),
    ]);
  }

  // 页标题
  Widget _buildPageTitle() {
    return Container(
      //alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      '标题:夫妻生意忙，找住家保姆',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.normal,
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ))
                ],
              ),
              Container(
                  padding: EdgeInsets.only(top: 15),
                  child: // 作者
                      Row(
                    children: [
                      // 标志
                      CircleAvatar(
                        //头像半径
                        radius: 18,
                        backgroundImage: AssetImage("assets/images/home/touxiang.jpeg"),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 6),
                        alignment: Alignment(-1, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // 姓名
                            Row(
                              children: [
                                Container(
                                  //width: 75,
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    '无敌',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 16,
                                      height: 1,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10, left: 10),
                                  child: Text(
                                    '星级',
                                    style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.amber, height: 1),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: (4)),
                                  child: FFStars(
                                    normalStar: Image.asset("assets/images/details/orangeNormal.png"),
                                    selectedStar: Image.asset("assets/images/details/orangeSelected.png"),
                                    starsChanged: (realStars, selectedStars) {
                                      print("实际选择: $selectedStars, 最终得分: $realStars");
                                    },
                                    step: 0.01,
                                    currentStars: 3,
                                    starHeight: 15,
                                    starWidth: 15,
                                    starMargin: 0,
                                  ),
                                )
                              ],
                            ),

                            // 一行 3 列
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  // 分类
                                  ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      maxWidth: 120,
                                    ),
                                    child: Text(
                                      '2小时之前来过',
                                      style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey,
                                        fontSize: 12,
                                        height: 1,
                                      ),
                                      overflow: TextOverflow.clip,
                                      maxLines: 1,
                                    ),
                                  ),
                                  // 添加时间
                                  Container(
                                    width: 15,
                                  ),
                                  ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      maxWidth: 120,
                                    ),
                                    child: Text(
                                      '发布于河南鹤壁',
                                      style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey,
                                        fontSize: 12,
                                        height: 1,
                                      ),
                                      overflow: TextOverflow.clip,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Spacer(),
                      InkWell(
                        child: Container(
                          width: 70,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                        onTap: () {
                          _followClickHandle();
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }

  void _followClickHandle() {
    setState(() {
      this._followStatus = !this._followStatus;
    });
  }

  List<Color> _getGradient() {
    if (this._followStatus) {
      return <Color>[Colors.grey, Colors.grey];
    } else {
      return <Color>[Colors.yellow[700], Colors.yellow[700]];
    }
  }

  

  List<Widget> _getContent() {
    List<Widget> defaultContent = <Widget>[
      Text(
        this._followStatus ? '已关注' : '关注',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          letterSpacing: 1.2,
        ),
      )
    ];
    List<Widget> prefixContent = <Widget>[];
    if (!this._followStatus) {
      defaultContent.insertAll(0, prefixContent);
    }
    return defaultContent;
  }

  

  List<Color> _getGradient2() {
    return <Color>[Colors.blueAccent, Colors.blueAccent];
  }

  List<Widget> _getContent2() {
    List<Widget> defaultContent = <Widget>[
      Text(
        '我想接单',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          letterSpacing: 1.2,
        ),
      )
    ];
    List<Widget> prefixContent = <Widget>[];
    if (!this._followStatus) {
      defaultContent.insertAll(0, prefixContent);
    }
    return defaultContent;
  }

  // 页头部
  Widget _buildPageHeader() {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/人民币.png',
                    width: 20,
                  ),
                  Text(
                    '5000',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.w400, fontSize: 30),
                  ),
                  Spacer(),
                  Container(
                      //height: 40,
                      child: RichText(
                    text: TextSpan(
                      text: '类型:',
                      style: TextStyle(
                        color: Colors.grey,
                        //backgroundColor: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
                  Container(
                      //height: 40,
                      child: RichText(
                    text: TextSpan(
                      text: '家政',
                      style: TextStyle(
                        color: Colors.red,
                        //backgroundColor: Colors.red,
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
                ],
              )),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Text(
              '     因生意忙，没时间做家务，现找做家务的保姆，有无家政经验均可，做过生意，有生意经验的优先，希望在生意上对东家也有所帮助，工资高些无所谓，联系人：许女士 电话18061623694',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18, height: 1.5),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20)),
                  child: Image.asset(
                    "assets/images/home/touxiang.jpeg",
                    width: 400,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
                Divider(
                  height: 3.0,
                  indent: 60.0,
                  color: Colors.white,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight:Radius.circular(20)),
                  child: Image.asset(
                    "assets/images/home/touxiang.jpeg",
                    width: 400,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
                Divider(
                  height: 3.0,
                  indent: 60.0,
                  color: Colors.white,
                ),
                //评论
                _buildHeader(),
                _buildUserInfo(),
                _buildContent(),

                _buildTimeInfo(),
                Divider(height: 1),
                _buildUserInfo(),
                _buildContent(),

                _buildTimeInfo(),
                Divider(height: 1),
                _buildFooter()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "全部留言·2",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return GestureDetector(
      onTap: () {
        //widget.fetchMore();
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "加载更多评论",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                ),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: Colors.blue,
                size: 16,
              )
            ],
          )),
    );
  }

  Widget _buildContent() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 10, left: 40),
      child: Text(
        '一级棒,楼主说的是真心话。',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildTimeInfo() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 5, left: 40,bottom: 10),
      child: Text(
        '1小时前发布',
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/home/touxiang.jpeg"),
            radius: 15,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text('小王', style: TextStyle(color: Colors.black, fontSize: 16)),
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.favorite,
                  color: Colors.yellow,
                  size: 20,
                ),
                SizedBox(
                  width: 4,
                ),
                Text('4', style: TextStyle(color: Colors.black87, fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildPageTitle(),
                  Divider(height: 1),
                  _buildPageHeader(),
                  //_buildWebView(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 80,
          child: BottomAppBar(
            color: Colors.white,
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 60)),
                    InkWell(
                      child: Column(
                        children: [
                          Icon(Icons.chat_bubble_outline),
                          Container(
                              //margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text(
                            '留言',
                            style: TextStyle(fontSize: 14),
                          )),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(padding: EdgeInsets.only( left: 60)),
                    InkWell(
                      child: Column(
                        children: [
                          Icon(Icons.collections_bookmark),
                          Container(
                              //margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text(
                            '收藏',
                            style: TextStyle(fontSize: 14),
                          )),
                        ],
                      ),
                    )
                  ],
                ),
                Spacer(),
                InkWell(
                  child: Container(
                    width: 90,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                        begin: Alignment(-1, 0),
                        end: Alignment(1.0, 0),
                        colors: this._getGradient2(),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: this._getContent2(),
                    ),
                  ),
                  onTap: () {
                    ImUser currentUser = ImUser(
                        uid: '1',
                        username: '小侠',
                        avatarUrl: 'http://thirdqq.qlogo.cn/g?b=oidb&k=h22EA0NsicnjEqG4OEcqKyg&s=100');
                    ImUser toUser = ImUser(
                        uid: '1050',
                        username: '小主',
                        avatarUrl: 'http://thirdqq.qlogo.cn/g?b=oidb&k=h22EA0NsicnjEqG4OEcqKyg&s=100');

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImConversationPage(
                                currentUser: currentUser,
                                toUser: toUser,
                              )),
                    );
                  },
                ),
                SizedBox(
                  width: 15,
                )
              ],
            ),
          ),
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
                    onTap: () {
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
