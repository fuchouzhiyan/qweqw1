import "package:dio/dio.dart";
import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/material.dart';
import 'package:lixiangyu/page/constant/constant.dart';
import 'package:lixiangyu/page/util/sp_util.dart';
import 'package:lixiangyu/page/widget/my_special_text_span_builder.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:lixiangyu/page/publish/category_content.dart';
import 'package:lixiangyu/page/widget/wechat_record_screen.dart';
import 'package:lixiangyu/page/publish/publish_success.dart';



//发布微博界面
class BanMaPublishPage extends StatefulWidget {
  BanMaPublishPage({Key key}) : super(key: key);

  @override
  _BanMaPublishPageState createState() => _BanMaPublishPageState();
}

class _BanMaPublishPageState extends State<BanMaPublishPage> {

  final ImagePicker _picker = ImagePicker();  

  int tag = 0;

  List<String> tags = [];

  // 录制状态
  bool recording = true;

  bool isLu =false;

  //选项
  List<String> options = [
    '道路救援', '抢劫', '犯罪',
    '被偷', '放火', 
  ];

  //_BanMaPublishPageState();

  TextEditingController _mEtController = new TextEditingController();
  String mBanMaSubmitText = "";

  bool mEmojiLayoutShow = false;
  bool mBottomLayoutShow = false;

  FocusNode focusNode = FocusNode();
  final GlobalKey globalKey = GlobalKey();
  double _softKeyHeight = SpUtil.getDouble(Constant.SP_KEYBOARD_HEGIHT, 200);
  
  List<File> mFileList = [];
  File mSelectedImageFile;
  List<MultipartFile> mSubmitFileList = [];

  MySpecialTextSpanBuilder _mySpecialTextSpanBuilder =
      MySpecialTextSpanBuilder();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _mEtController.addListener(_printLatestValue);
  }

  _printLatestValue() {
    print("Second text field: ${_mEtController.text}");
    /* setState(() {
    });*/
  }

  @override
  Widget build(BuildContext context) {
    print("键盘高度是:" + _softKeyHeight.toString());
    print('fileList的内容: $mFileList');
    //显示底部栏(隐藏顶部状态栏)
    // SystemChrome.setEnabledSystemUIOverlays(
    //                   SystemUiOverlay.values);
    if (mSelectedImageFile != null) {
      mFileList.add(mSelectedImageFile);
    }
    mSelectedImageFile = null;
    //状态栏
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          elevation: 0,
          backgroundColor: Colors.white, 
          title: Container(
            child: Center(
              child: Text(
                '发布斑马救援'
              ),
            )
          ),
          actions: [
            InkWell(
              child: Container(
                width: 60,
                  margin: EdgeInsets.only(right: 15.0,top: 10,bottom: 10),
                  padding: EdgeInsets.only(
                      left: 15.0, top: 7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: Colors.amber),
                  child: Text('发送',
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                ),
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context) {

            return new PublishSuccess();

     }));
                },
            )
          ],
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _address(),
            _chip(),
            
            //_retweettitle(),
            _retweettosay(context),
            //buildBottom(),
          ],
        ),
      ),
      onWillPop: _onWillPop,
    );
  }

  //地址选择
  Widget _address(){

    return Container(
      margin: EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Container(
              child: Text(
                '请选择救援地点',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            Spacer(),
           Icon(Icons.arrow_forward_ios,
           color: Colors.grey,
           size: 20,
           ),
          ],
        ),
    );
  }

  //标签
  Widget _chip(){
    
    return Container(
      
      height: 150,
      child: ListView(
          addAutomaticKeepAlives: true,
          children: <Widget>[
            Content(
                    title: '选择救援类别',
                    child: ChipsChoice<int>.single(
                      value: tag,
                      onChanged: (val) => setState(() => tag = val),
                      choiceItems: C2Choice.listFrom<int, String>(
                        source: options,
                        value: (i, v) => i,
                        label: (i, v) => v,
                      ),
                      choiceStyle: C2ChoiceStyle(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                      ),
                      wrapped: true,
                    ),
                  ),
          ]
      )
    );
}


  //退出
  Future<bool> _onWillPop() async {
    if (mBottomLayoutShow) {    
          setState(() {
            mBottomLayoutShow = false;
            mEmojiLayoutShow = false;
          });
        } else {
          Navigator.pop(context);
        }
       return Future.value(true);
  } 

  //内容
  Widget _retweettosay(context) {
    int mGridCount;
    if (mFileList.length == 0) {
      mGridCount = 1;
    } else if (mFileList.length > 0 && mFileList.length < 6) {
      mGridCount = mFileList.length + 1;
    } else {
      mGridCount = mFileList.length;
    }
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        //边框设置
        decoration: new BoxDecoration(
        //背景
        color: Colors.white,
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        //设置四周边框
        border: new Border.all(width: 1, color: Colors.white),
        //设置阴影
        boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(1.0, 1.0), blurRadius: 1.0, spreadRadius: 1.0), ],
        ),
          child: ListView(
        children: <Widget>[
          
          Stack(
            children: [
                Container(
            height: 150,
            padding:
                EdgeInsets.only(top: 10.0, left: 10.0, right: 10, bottom: 20),
            constraints: new BoxConstraints(minHeight: 50.0),
            child:
                ExtendedTextField(
              
              specialTextSpanBuilder: _mySpecialTextSpanBuilder,
              controller: _mEtController,
              maxLines: 5,
              focusNode: focusNode,
              style: TextStyle(color: Colors.black, fontSize: 16),
              decoration: InputDecoration.collapsed(
                  hintText: "填写需要救援内容",
                  hintStyle: TextStyle(color: Color(0xff919191), fontSize: 16)),
            ),
          ),
          Positioned(
            top: 100,
            right: 0,
            child: Container(
                child: Row(
                  children: [
                    WeChatRecordScreen(
                      isLu: isLu,
                    ) 
                  ],
                ),
            ),
          ),
          
            ],
          ),
          
          
          Divider(
            height: 1.0,
            indent: 0.0,
            color: Colors.grey,
          ),
          GridView.count(
            shrinkWrap: true,
            primary: false,
            crossAxisCount: 3,
            children: List.generate(mGridCount, (index) {
              // 这个方法体用于生成GridView中的一个item
              var content;
              if (index == mFileList.length) {
                // 添加图片按钮
                var addCell = Center(
                    child: Image.asset(
                  Constant.ASSETS_IMG + 'publish/mine_feedback_add_image.png',
                  width: double.infinity,
                  height: double.infinity,
                ));
                content = GestureDetector(
                  onTap: () {
                    // 如果已添加了6张图片，则提示不允许添加更多
                    num size = mFileList.length;
                    if (size >= 6) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("最多只能添加6张图片！"),
                      ));
                      return;
                    }
                    
                    _onImageButtonPressed(ImageSource.gallery,context);
                  },
                  child: addCell,
                );
              }else {
                // 被选中的图片
                content = Stack(
                  children: <Widget>[
                    Center(
                      child: Image.file(
                        mFileList[index],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          mFileList.removeAt(index);
                          mSelectedImageFile = null;
                          setState(() {});
                        },
                        child: Image.asset(
                          Constant.ASSETS_IMG + 'publish/mine_feedback_ic_del.png',
                          width: 20.0,
                          height: 20.0,
                        ),
                      ),
                    )
                  ],
                );
              }
              return Container(
                margin: const EdgeInsets.all(10.0),
                width: 80.0,
                height: 80.0,
                color: const Color(0xFFffffff),
                child: content,
              );
            }),
          )
        ],
      ),
      )
      
    );
  }

  

  void showSoftKey() {
    FocusScope.of(context).requestFocus(focusNode);
  }

  void hideSoftKey() {
    focusNode.unfocus();
  }
  

  void _onImageButtonPressed(ImageSource source,
      BuildContext context) async {
        try {
          final pickedFile = await _picker.getImage(
            source: source,
            maxWidth: 100,
            maxHeight: 100,
            imageQuality: 1,
          );
          setState(() {
            mSelectedImageFile = File(pickedFile.path);
          });
        } catch (e) {
          
        }
      }  
  
}
