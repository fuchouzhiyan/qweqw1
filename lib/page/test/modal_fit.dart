import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lixiangyu/page/util/navigator_util.dart';
import 'package:lixiangyu/page/publish/banma_publish_page.dart';

class ModalFit extends StatelessWidget {
  const ModalFit({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Container(
          //alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                child: Container(

                    padding: EdgeInsets.only(top: 40,left: 100),
                    width: 400,
                    //width: 100,
                    //height: 100,
                    child: Row(

                      children: [
                        Container(
                          constraints: BoxConstraints.expand(
                            width: 50.0,
                            height: 50.0,
                          ),
                          decoration: new BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/images/publish/banma.png')),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          height: ScreenUtil().setHeight(150),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              Text('发布斑马救助',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                              ),),
                              Text('有麻烦？找斑马救援',
                              style: TextStyle(
                                color: Colors.grey
                              ),)
                            ],
                          ),
                        )
                      ],
                    )),
                onTap: () {
                  NavigatorUtil.push(context, BanMaPublishPage());
                },
              ),
              InkWell(
                child: Container(
                    padding: EdgeInsets.only(top: 40,left: 100,bottom: 40),
                    width: 400,
                    //height: 100,
                    child: Row(

                      children: [
                        Container(
                          constraints: BoxConstraints.expand(
                            width: 50.0,
                            height: 50.0,
                          ),
                          decoration: new BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/images/home/touxiang.jpeg')),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          height: ScreenUtil().setHeight(150),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              Text('发理想鱼任务',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                ),),
                              Text('上理想鱼,都不是事!',
                                style: TextStyle(
                                    color: Colors.grey
                                ),)
                            ],
                          ),
                        )
                      ],
                    )),
                onTap: () {},
              ),
            ],
          ),
        ));
  }
}
