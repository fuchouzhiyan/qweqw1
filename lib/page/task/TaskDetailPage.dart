import 'package:flutter/material.dart';


class TaskDetailPage extends StatefulWidget {

  

  @override
  State<StatefulWidget> createState() {
    return _TaskDetailPageState();
  }
}

class _TaskDetailPageState extends State<TaskDetailPage> {

  @override
  void initState() {
    super.initState();
    
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            onPressed: () { },
            icon: Icon(Icons.more_horiz),
            color: Colors.black,
          )
        ],
      ),
      body: Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: <Widget>[
          
        ],
      ),
    ),
    );
  }

  
  

}
