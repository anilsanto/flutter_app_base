import 'package:flutter/material.dart';
import 'package:game_app/MyApp.dart';

import 'constants/app_constants.dart';

void main() {
  // debugPaintSizeEnabled = true;
  environmentConfig = AppConfig(
    appName: 'Travel Planner',
    flavorName: 'development',
    apiBaseUrl: 'APP_BASE_URL',
  );
  runApp(MyApp.launchApp());
}