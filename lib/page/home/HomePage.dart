import 'package:lixiangyu/page/search/SearchPage.dart';
import 'package:flutter/material.dart';
import 'HomeHedaer.dart';
import 'HomeGoodGrid.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/picker_style.dart';
import 'package:lixiangyu/page/widget/my_text.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<String> _list = [
    "关注",
    "推荐",
    "斑马救援",
    "搬家",
    "保姆月嫂",
    "保洁清洗",
    "开锁换锁",
    "房屋维修",
    "管道疏通",
  ];

  // 选择器2
  String initProvince = '河南省', initCity = '鹤壁';

  TabController _tabController;

  Widget _commitButton = MyText('确认', color: Colors.blue, size: 14);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print("Init Home page");

    _tabController = TabController(length: _list.length, vsync: this, initialIndex: 1);
    _tabController.addListener(() {
      var index = _tabController.index;
      var previewIndex = _tabController.previousIndex;
      print('index:$index, preview:$previewIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: buildAppBarWidget(),
      body: buildBodyWidget(),
    );
  }

  Widget buildAppBarWidget() {
    var pickerStyle = PickerStyle(
      commitButton: _commitButton,
    );

    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: AppBar(
      
      titleSpacing: 0,
      title: buildSearchBar(),
      centerTitle: false,
      elevation: 0,
      backgroundColor: Colors.amber,
      actions: <Widget>[
        InkWell(
          child: Container(
            width: 55,
            child: Center(
              child: Text(
                initCity,
                style: new TextStyle(color: Colors.black, fontSize: 20),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          onTap: () {
            Pickers.showAddressPicker(
              context,
              initProvince: initProvince,
              initCity: initCity,
              initTown: null,
              pickerStyle: pickerStyle,
              onConfirm: (p, c, t) {
                setState(() {
                  initCity = c;
                });
              },
            );
          },
        ),
      ],
    )
    );
    
  }

  Widget buildBodyWidget() {
    return Scrollbar(
      child: buildNestedScrollView(),
    );
  }

  Widget buildNestedScrollView() {
    return NestedScrollView(
      headerSliverBuilder: ((BuildContext context, bool innerIsScrolled) {
        return <Widget>[
          // header
          SliverToBoxAdapter(
            child: HomeHedaer(),
          ),

          // bar
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              pinned: true,
              titleSpacing: 0,
              forceElevated: false,
              automaticallyImplyLeading: false,
              backgroundColor: innerIsScrolled ? Colors.white : Colors.grey[100],
              title: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.amber,
                  indicatorWeight: 3,
                  indicatorPadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                  unselectedLabelStyle: TextStyle(color: Colors.black45, fontSize: 16),
                  labelStyle: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  tabs: _list.map((String name) {
                    return Tab(
                      text: name,
                    );
                  }).toList()),
            ),
          ),
        ];
      }),
      body: TabBarView(
        controller: _tabController,
        children: _list.map((String name) {
          return HomeGoodGrid(
            categoryType: name,
          );
        }).toList(),
      ),
    );
  }

  Widget buildListWidget(String name) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(builder: (BuildContext context) {
        return CustomScrollView(
          key: PageStorageKey(name),
          slivers: <Widget>[
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 0),
              sliver: SliverFixedExtentList(
                itemExtent: 50,
                delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                  return Text("index = $index");
                }, childCount: 30),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget buildSearchBar() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 10,
        ),
        Text(
          "理想鱼",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
            child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                // 无动画的切换
                pageBuilder: (context, anim1, anim2) => SearchPage(),
              ),
            );
          },
          child: Container(
            height: 40,
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: new Border.all(width: 2.0, color: Colors.amber),
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.search,
                  size: 18,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 5),
                Text("iPhoneXr手机壳",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w300))
              ],
            ),
          ),
        ))
      ],
    );
  }

  Future<void> fetchData() async {
    return null;
  }
}
