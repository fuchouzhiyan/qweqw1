import 'dart:convert';

import 'package:lixiangyu/page/model/user.dart';

class ImMessageType {
  static const int text = -1;
  static const int image = -2;
  static const int audio = -3;
  static const int video = -4;
  static const int location = -5;
  static const int file = -6;
}

class ImMessageIOType {
  static const int messageIOTypeIn = 1;
  static const int messageIOTypeOut = 2;
}

class ImMessages {
  final List<ImMessage> messages;
  ImMessages({this.messages});

  factory ImMessages.fromJson(List<dynamic> parsedJson) {
    List<ImMessage> messages = [];
    messages = parsedJson.map((i) => ImMessage.fromJson(i)).toList();
    return ImMessages(messages: messages);
  }
}

class ImMessage {
  final String conversationId;
  final String messageId;
  final ImUser fromUser;
  final ImUser toUser;
  final String text;
  final String url;
  String thumbnailUrl;
  final int timestamp;
  final int messageType;
  final int ioType;
  final int duration;
  final Map<String, dynamic>
      attributes; // 如果最后一条消息是当前用户，则attributes中包含用户的姓名，否则为空
  ImMessage(
      {this.messageId,
      this.conversationId,
      this.fromUser,
      this.toUser,
      this.text,
      this.url,
      this.duration,
      this.ioType,
      this.timestamp,
      this.attributes,
      this.messageType});

  //用于获取消息记录
  factory ImMessage.fromJson(Map<dynamic, dynamic> jsonMap) {
    Map contentMap = json.decode(jsonMap['content']);
    String url = "";
    int duration = 0;
    if (contentMap['_lctype'] < ImMessageType.text) {
      url = contentMap['_lcfile']['url'];
      if (contentMap['_lcfile']['metaData'] != null) {
        if (contentMap['_lcfile']['metaData']['duration'] != null) {
          duration = double.parse(contentMap['_lcfile']['metaData']['duration'].toString())
              .ceil();
        }
      }
    }
    return ImMessage(
        conversationId: jsonMap['conversationId'],
        messageId: jsonMap['messageId'],
        ioType: jsonMap['ioType'],
        messageType: contentMap['_lctype'],
        text: contentMap['_lctext'],
        url: url,
        duration: duration,
        timestamp: jsonMap['timestamp'] ?? 0);
  }

  // 用于convetsation中读取lastMessage
  factory ImMessage.fromString(String value) {
    Map valueMap = json.decode(value);
    String text = "";
    if (valueMap['_lctype'] == ImMessageType.text) {
      text = valueMap['_lctext'];
    } else if (valueMap['_lctype'] == ImMessageType.image) {
      text = '[图片]';
    } else if (valueMap['_lctype'] == ImMessageType.audio) {
      text = '[语音]';
    } else if (valueMap['_lctype'] == ImMessageType.video) {
      text = '[视频]';
    }
    return ImMessage(
      conversationId: valueMap['conversationId'],
      messageId: valueMap['messageId'],
      messageType: valueMap['_lctype'],
      text: text,
      attributes: valueMap['_lcattrs'],
    );
  }
}
