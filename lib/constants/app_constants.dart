

import 'package:flutter/material.dart';

class AppConfig {
  AppConfig({
    @required this.appName,
    @required this.flavorName,
    @required this.apiBaseUrl,
  });

  final String appName;
  final String flavorName;
  final String apiBaseUrl;
}

AppConfig environmentConfig;


class TextFieldType {
  const TextFieldType(this.value, this.regEx);
  final String value;
  final String regEx;

  static const email = TextFieldType('email',
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  static const password = TextFieldType('password', '');
  static const username = TextFieldType('username', '');
  static const none = TextFieldType('none', '');
}