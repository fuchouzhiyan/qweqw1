import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:fluttertoast/fluttertoast.dart';

//接单详情
class CustomerService extends StatefulWidget {
  @override
  _CustomerServiceState createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> with TickerProviderStateMixin {
  final List<String> _categoryList = ["资金解冻", "违规查询", "维权进度", "咨询进度", "会员制度", "争议规则", "实人认证", "斑马救援"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('客服中心'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 70, //设置item的高度
                decoration: BoxDecoration(
                  color: Colors.amber,
                  //border: Border.all(color: Colors.amber,width: 1),//设置边框的宽度 以及 颜色
                  //borderRadius: BorderRadius.all(Radius.circular(20)), //设置圆角
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 30), //设置图片的边距
                      child: Image.asset("assets/images/home/touxiang.jpeg"),
                    ), //涉及到widget的大小或者边框的时候，使用container包裹
                    Container(
                      padding: EdgeInsets.only(top: 5, left: 20),
                      width: MediaQuery.of(context).size.width - 160,
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Hi，夏天的风轻轻吹着头发",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "很高兴为您服务~",
                              style: TextStyle(fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Icon(
                        Icons.stars,
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      width: 340,
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Marquee(
                        text: '通知：理想鱼社区开展"祖安文化"信息专项治理行动',
                        velocity: 20,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8, left: 5),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 10,
                decoration: new BoxDecoration(
                  color: Colors.grey[200],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '快捷工具',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: GridView(
                        shrinkWrap: true, // 收缩，只占用他需要的大小，而不是占满全屏
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, mainAxisSpacing: 0, crossAxisSpacing: 21, childAspectRatio: 1.1),
                        children: _categoryList.map((String name) {
                          return GestureDetector(
                              onTap: () {},
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 24,
                                      backgroundColor: Colors.cyan[100],
                                      backgroundImage: AssetImage('assets/images/home/touxiang.jpeg'),
                                    ),
                                    Text(
                                      name,
                                      style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ));
                        }).toList(),
                      ),
                    ),
                    Container(
                      height: 10,
                      decoration: new BoxDecoration(
                        color: Colors.grey[200],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '常见问题',
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.only(top: 10, right: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '全部查看',
                            style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 300,
                    child: ListView(
                      itemExtent: 40,
                      children: [
                        new ListTile(
                          
                          title: new Text('被资金保护处置了怎么办'),
                          onTap: (){
                          },
                        ),
                        new ListTile(
                          
                          title: new Text('我赚的钱去哪了？'),
                        ),
                        new ListTile(
                          
                          title: new Text('怎么解除资金保护？'),
                        ),
                        new ListTile(
                          
                          title: new Text('小主投诉？'),
                          onTap: (){
                          },
                        ),
                        new ListTile(
                          
                          title: new Text('我该怎么把钱提取出来？'),
                        ),
                        new ListTile(
                          
                          title: new Text('我该怎么把钱提取出来？'),
                        ),
                        new ListTile(
                          
                          title: new Text('我该怎么把钱提取出来？'),
                          onTap: (){
                          },
                        ),
                        
                      ],
                    ),
                  ),
                  Container(
                      height: 10,
                      decoration: new BoxDecoration(
                        color: Colors.grey[200],
                      ),
                    ),
                  Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '推荐阅读',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(                        
                              //alignment: Alignment.topCenter,
                              padding: EdgeInsets.only(left: 20,right: 20,bottom: 120),
                                child: Image.asset('assets/images/home/touxiang.jpeg',width: 50,height: 50),
                            ),
                            flex: 3,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  
                                  children: [
                                    Container(
                                      child: Text('理想鱼交易，到底安全不安全?',style: TextStyle(
                                        fontSize: 16
                                      ),),
                                    ),
                                    Container(
                                      child: Text('什么是资金保护?',style: TextStyle(
                                        fontSize: 16
                                      ),),
                                    ),
                                    Container(
                                      child: Text('小主不点下一步怎么办?',style: TextStyle(
                                        fontSize: 16
                                      ),),
                                    ),
                                    Container(
                                      child: Text('小主不点下一步怎么办?',style: TextStyle(
                                        fontSize: 16
                                      ),),
                                    ),
                                    Container(
                                      child: Text('小主不点下一步怎么办?',style: TextStyle(
                                        fontSize: 16
                                      ),),
                                    ),
                                    Container(
                                      child: Text('小主不点下一步怎么办?',style: TextStyle(
                                        fontSize: 16
                                      ),),
                                    ),
                                    Container(
                                      child: Text('小主不点下一步怎么办?',style: TextStyle(
                                        fontSize: 16
                                      ),),
                                    ),
                                    Container(
                                      child: Text('小主不点下一步怎么办?',style: TextStyle(
                                        fontSize: 16
                                      ),),
                                    ),
                                  ],
                                ),
                            ),
                            flex: 7,
                          ),
                        ],
                      )
                    ),
                   Container(
                      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(                        
                              //alignment: Alignment.topCenter,
                              padding: EdgeInsets.only(left: 20,right: 20,bottom: 120),
                                child: Image.asset('assets/images/home/touxiang.jpeg',width: 50,height: 50),
                            ),
                            flex: 3,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  
                                  children: [
                                    Container(
                                      child: Text('理想鱼交易，到底安全不安全?',style: TextStyle(
                                        fontSize: 16
                                      ),),
                                    ),
                                    Container(
                                      child: Text('什么是资金保护?',style: TextStyle(
                                        fontSize: 16
                                      ),),
                                    ),
                                    Container(
                                      child: Text('小主不点下一步怎么办?',style: TextStyle(
                                        fontSize: 16
                                      ),),
                                    ),
                                    Container(
                                      child: Text('小主不点下一步怎么办?',style: TextStyle(
                                        fontSize: 16
                                      ),),
                                    ),
                                    Container(
                                      child: Text('小主不点下一步怎么办?',style: TextStyle(
                                        fontSize: 16
                                      ),),
                                    ),
                                    Container(
                                      child: Text('小主不点下一步怎么办?',style: TextStyle(
                                        fontSize: 16
                                      ),),
                                    ),
                                    Container(
                                      child: Text('小主不点下一步怎么办?',style: TextStyle(
                                        fontSize: 16
                                      ),),
                                    ),
                                    Container(
                                      child: Text('小主不点下一步怎么办?',style: TextStyle(
                                        fontSize: 16
                                      ),),
                                    ),
                                  ],
                                ),
                            ),
                            flex: 7,
                          ),
                        ],
                      )
                    ),
                  ],
                ),
              ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
