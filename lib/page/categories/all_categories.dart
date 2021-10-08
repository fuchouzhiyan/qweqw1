import 'package:flutter/material.dart';
import 'package:lixiangyu/page/res/color.dart';
import 'package:lixiangyu/page/widget/search_bar.dart';
import 'package:lixiangyu/page/model/search_model.dart';
import 'package:lixiangyu/page/dao/search_dao.dart';
import 'package:lixiangyu/page/util/navigator_util.dart';
import 'package:lixiangyu/page/home/speak_page.dart';


const SEARCH_BAR_DEFAULT_TEXT = '家政   装修   游戏代练';

class AllCategories extends StatefulWidget {
  final bool hideLeft;
  final String searchUrl;
  final String keyword;
  final String hint;

  const AllCategories(
      {Key key, this.hideLeft, this.searchUrl, this.keyword, this.hint})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => AllCategoriesState();
}


class AllCategoriesState extends State<AllCategories> {
  double appBarAlpha = 0;
  SearchModel searchModel;
  String keyword;
  String city = '西安市';

//输入框文本更改
  void _onTextChange(String text) async {
    keyword = text;
    if (text.length == 0) {
      setState(() {
        searchModel = null;
      });
      return;
    }
    try {
      SearchModel model = await SearchDao.fetch(keyword);
      //只有当当前输入的内容和服务端返回的内容一致时才渲染
      if (model.keyword == keyword) {
        setState(() {
          searchModel = model;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  //跳转语音识别页面
  void _jumpToSpeak() {
    NavigatorUtil.push(context, SpeakPage());
  }

  List<String> _datas = ['装修','家政']; //一级分类集合
  List<String> articles = ['打枪','修水管']; //二级分类集合
  int index = 0; //一级分类下标

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  void getHttp() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
          automaticallyImplyLeading: false,
          title: Column(
            children: <Widget>[
              _appBar
            ],
          ),
        ),
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                  flex: 2,
                  child: Container(
                    color: YColors.color_fff,
                    child: new ListView.builder(
                        itemCount: _datas.length,
                        itemBuilder: (BuildContext context, int position) {
                          return getRow(position);
                        }),
                  )),
              new Expanded(
                  flex: 5,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        //height: double.infinity,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(10),
                        color: YColors.color_f3f3f3,
                        child: getChip(index), //传入一级分类下标
                      ),
                    ],
                  )),
            ],
          )
        )
    );
  }

  Widget getRow(int i) {
    Color textColor = Colors.amber; //字体颜色
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        //Container下的color属性会与decoration下的border属性冲突，所以要用decoration下的color属性
        decoration: BoxDecoration(
          color: index == i ? YColors.color_F9F9F9 : Colors.white,
          border: Border(
            left: BorderSide(
                width: 5,
                color:
                index == i ? Theme.of(context).primaryColor : Colors.white),
          ),
        ),
        child: Text(
          _datas[i],
          style: TextStyle(
            color: index == i ? textColor : YColors.color_666,
            fontWeight: index == i ? FontWeight.w600 : FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          index = i; //记录选中的下标
          textColor = YColors.colorPrimary;
        });
      },
    );
  }


  Widget getChip(int i) {
    //更新对应下标数据
    _updateArticles(i);
    return Wrap(
      spacing: 10.0, //两个widget之间横向的间隔
      direction: Axis.horizontal, //方向
      alignment: WrapAlignment.start, //内容排序方式
      children: List<Widget>.generate(
        articles.length,
            (int index) {
          return ActionChip(
            //标签文字
            label: Text(
              articles[index],
              style: TextStyle(fontSize: 16, color: YColors.color_666),
            ),
            //点击事件
            onPressed: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleDetail(
                      title: '修水管', url: ''),
                ),
              );*/
            },
            elevation: 3,
            backgroundColor: Colors.grey.shade200,
          );
        },
      ).toList(),
    );
  }

  ///
  /// 根据一级分类下标更新二级分类集合
  ///
  List<String> _updateArticles(int i) {

    return articles;
  }

  //自定义导航
  Widget get _appBar {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0x66000000), Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: SearchBar(
              hideLeft: widget.hideLeft,
              defaultText: widget.keyword,
              hint: widget.hint ?? SEARCH_BAR_DEFAULT_TEXT,
              leftButtonClick: () {
                Navigator.pop(context);
              },
              onChanged: _onTextChange,
              speakClick: _jumpToSpeak,
            ),
          ),
        )
      ],
    );
  }
}