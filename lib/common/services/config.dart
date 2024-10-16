import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woo_app/common/index.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ConfigService extends GetxService {
  static ConfigService get to => Get.find();

  /*------------包信息 start-------------*/

  ///包信息
  PackageInfo? _platform;

  String get version => _platform?.version ?? "-";

  String get appName => _platform?.appName ?? "-";

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  /*------------end-------------*/

  /*------------国际化 start-------------*/

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

  /*------------end-------------*/

  /*------------主题 start-------------*/

  /// 主题
  final RxBool _isDarkModel = Get.isDarkMode.obs;

  bool get isDarkModel => _isDarkModel.value;

  Future<void> switchThemeModel() async {
    _isDarkModel.value = !_isDarkModel.value;
    Get.changeThemeMode(
        _isDarkModel.value == true ? ThemeMode.dark : ThemeMode.light);
    await Storage().setString(Constants.storageThemeCode,
        _isDarkModel.value == true ? "dark" : "light");
    // 重新载入视图，因为
    // 1 有自定义颜色
    // 2 有些视图被缓存
    // Get.offAllNamed(RouteNames.systemSplash);
  }

// 初始 theme
  void initTheme() {
    var themeCode = Storage().getString(Constants.storageThemeCode);
    _isDarkModel.value = themeCode == 'dark' ? true : false;
  }

  /*------------end-------------*/

  @override
  void onInit() {
    super.onInit();
    getPlatform();
    initLocale();
    initTheme();
  }
}
