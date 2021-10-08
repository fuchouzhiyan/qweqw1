import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:lixiangyu/page/test/modal_fit.dart';

class FloatingActionButtonDemo extends StatelessWidget {
  const FloatingActionButtonDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.only(top: 55),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Colors.white,
          // border: Border(
          //   top: BorderSide(
          //     width: 1,
          //     color: Colors.grey,
          //   ),
          // ),
        ),
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.amber,
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            showMaterialModalBottomSheet(
              expand: false,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => ModalFit(),
            );
          },
        ),
      );

  }
}