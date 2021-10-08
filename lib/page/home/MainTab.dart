
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class MainTab extends StatefulWidget{
  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab>
    with SingleTickerProviderStateMixin {

  List imgList = [
    "http://yanxuan.nosdn.127.net/8b30eeb17c831eba08b97bdcb4c46a8e.png",
    "http://yanxuan.nosdn.127.net/8b30eeb17c831eba08b97bdcb4c46a8e.png",
    "http://yanxuan.nosdn.127.net/8b30eeb17c831eba08b97bdcb4c46a8e.png",
    "http://yanxuan.nosdn.127.net/8b30eeb17c831eba08b97bdcb4c46a8e.png",
    "http://yanxuan.nosdn.127.net/8b30eeb17c831eba08b97bdcb4c46a8e.png",
    "http://yanxuan.nosdn.127.net/8b30eeb17c831eba08b97bdcb4c46a8e.png",
    "http://yanxuan.nosdn.127.net/8b30eeb17c831eba08b97bdcb4c46a8e.png",
    "http://yanxuan.nosdn.127.net/8b30eeb17c831eba08b97bdcb4c46a8e.png",
    "http://yanxuan.nosdn.127.net/e564410546a11ddceb5a82bfce8da43d.png",
    "http://yanxuan.nosdn.127.net/56f4b4753392d27c0c2ccceeb579ed6f.png",
    "http://yanxuan.nosdn.127.net/6a54ccc389afb2459b163245bbb2c978.png",
    'https://picsum.photos/id/101/548/338',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569842561051&di=45c181341a1420ca1a9543ca67b89086&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201504%2F17%2F20150417212547_VMvrj.jpeg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1570437233&di=9239dbc3237f1d21955b50e34d76c9d5&imgtype=jpg&er=1&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201508%2F30%2F20150830095308_UAQEi.thumb.700_0.jpeg'
  ];

  final _tabKey = ValueKey('tab');

  TabController _innerTabController;

  void handleTabChange() {
    //print('Inner tab, previous: ${_innerTabController.previousIndex}, current: ${_innerTabController.index}');
    PageStorage.of(context).writeState(context, _innerTabController.index, identifier: _tabKey);
  }

  @override
  void initState() {
    super.initState();
    int initialIndex = PageStorage.of(context).readState(context, identifier: _tabKey);
    _innerTabController = TabController(
        length: 6,
        vsync: this,
        initialIndex: initialIndex != null ? initialIndex : 0
    );
    _innerTabController.addListener(handleTabChange);
  }

  @override
  void dispose() {
    _innerTabController.removeListener(handleTabChange);
    _innerTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          bottom:  TabBar(
            controller: _innerTabController,
            labelStyle:
            TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            isScrollable: true,
            //可滚动
            indicatorColor: Colors.amber,
            //指示器的颜色
            labelColor: Colors.amber,
            //选中文字颜色
            unselectedLabelColor: Colors.grey,
            //为选中文字颜色
            indicatorSize: TabBarIndicatorSize.label,
            //去掉指示器
            indicator:const BoxDecoration(),
            //指示器与文字等宽
            tabs: <Widget>[
              Tab(text: "精选"),
              Tab(text: "装修"),
              Tab(text: "家政"),
              Tab(text: "寄养宠物"),
              Tab(text: "对赌"),
              Tab(text: "代练"),
            ],
          ),
        ),
      ),

      body: TabBarView(
        controller: _innerTabController,
        physics: new NeverScrollableScrollPhysics(),
        children: <Widget>[
          
          Container(
            child: Column(children: [
              
              Expanded(
                child: StaggeredGridView.countBuilder(
              padding: const EdgeInsets.all(8.0),
              crossAxisCount: 4,
              itemCount: imgList.length,
              itemBuilder: (context, i) {
                return itemWidget(i);
              },
              staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 2.6 : 2.8),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
              )
              
            ],)
            
          ),
          Container(
            child: Center(
              child: Text(
                '装修'
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                  '家政'
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                  '寄养宠物'
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                  '对赌'
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                  '代练'
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget itemWidget(int index) {
    String imgPath = imgList[index];
    return new Material(
      elevation: 8.0,
      borderRadius: new BorderRadius.all(
        new Radius.circular(8.0),
      ),
      child: new InkWell(
        onTap: () {},
        child: new Hero(
          tag: imgPath,
          child: Column(
            children: [
              
              Expanded(
                child: Stack(
                children: [
                  Container(
                    child:CachedNetworkImage(
                      width: double.infinity,
                      imageUrl: imgPath,
                      fit: BoxFit.fitWidth,
                      /*    placeholder: (context, url) =>
                      Image.asset('assets/wallfy.png'),*/
                    ),
                  ),
                  Positioned(
                    top: 80,
                    right: 0,
                    child: Container(
                      width: 45,
                      height: 45,
                      child: Image.asset('assets/images/home/jinbi.gif'),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 40,
                    child: Container(
                      child: SizedBox(
                        width: 100.0,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 30.0,
                            //fontFamily: 'Canterbury',
                            color: Colors.amber
                          ),
                          child: AnimatedTextKit(
                              pause:Duration(milliseconds: 1000),
                              totalRepeatCount:999,
                            animatedTexts: [
                              ScaleAnimatedText('200元'),
                            ],
                            onTap: () {
                              print("Tap Event");
                            },
                          ),
                        ),
                      )
                    ),
                  )
                ],
                ),
                flex: 5,
              ),
              Expanded(
                child: Container(
                    child: Text(
                        '欢迎到来虚空之门,张开双臂迎接未来把！',
                      maxLines: 2,
                    ),
                  ),
                flex: 2,
              ),
              Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
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
                        flex: 6,
                      ),
                      Expanded(
                        child: Row(
                      children: [
                        Container(
                          child: Text(
                            '关注人数:',
                            style: TextStyle(
                                fontSize: 10
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '20',
                            style: TextStyle(
                                fontSize: 16,
                              color: Colors.red
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '人',
                            style: TextStyle(
                                fontSize: 10
                            ),
                          ),
                        ),
                      ],
                      ),

                        flex: 4,
                      )

                    ],
                  ),
                flex: 1,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints.expand(
                          width: 25.0,
                          height: 25.0,
                        ),
                        decoration: new BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/home/touxiang.jpeg')),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                            '小米'
                        ),
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                            '距离:'
                        ),
                      ),
                      flex: 3,
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                            '<'
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                            '30米',
                          style: TextStyle(
                            color: Colors.amber
                          ),
                        ),
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      child: Container(
                        child: Icon(
                          Icons.add_location_alt_outlined,
                          color: Colors.amber,
                          size: 12.0,
                          semanticLabel: 'Text to announce in accessibility modes',
                        ),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
                flex: 1,
              )
            ],
          )

        ),
      ),
    );
  }
}