import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woo_app/common/index.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ConfigService extends GetxService {
  static ConfigService get to => Get.find();

  ///包信息
  PackageInfo? _platform;

  String get version => _platform?.version ?? "-";

  String get appName => _platform?.appName ?? "-";

  Future<ConfigService> init() async {
    await getPlatform();
    return this;
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  /// 国际化
  Locale locale = PlatformDispatcher.instance.locale;

  // 初始语言
  void initLocale() {
    var langCode = Storage().getString(Constants.storageLanguageCode);
    if (langCode.isEmpty) {
      return;
    }
    var index = Translation.supportedLocales.indexWhere((element) {
      return element.languageCode == langCode;
    });

    if (index < 0) return;
    locale = Translation.supportedLocales[index];
  }

  // 更改语言
  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(value);
    Storage().setString(Constants.storageLanguageCode, value.languageCode);
  }

  @override
  void onReady() {
    super.onReady();
    initLocale();
  }
}
