import 'package:flutter/material.dart';

class AudioRecordWidget extends StatelessWidget {
  const AudioRecordWidget({
    Key key,
    @required this.recording,
  }) : super(key: key);

  final bool recording;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      padding: EdgeInsets.all(2),
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: Color(0x999999).withOpacity(.3),
      //     width: 3,
      //   ),
      //   shape: BoxShape.circle,
      // ),
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.amber,
          shape: BoxShape.circle,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
          child: Icon(
            recording ? Icons.pause_circle_filled : Icons.play_circle_filled,
            color: Colors.white,
            // 这里必须要添加 key
            key: ValueKey<bool>(recording),
            size: 40,
          ),
        ),
      ),
    );
  }
}