import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'common/index.dart';

class Global {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Storage().init();

    // 初始化服务
    Get.put<ConfigService>(ConfigService());
    Get.put<HttpService>(HttpService());
  }
}
