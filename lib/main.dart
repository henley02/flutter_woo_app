import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/index.dart';
import 'global.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode:
          ConfigService.to.isDarkModel ? ThemeMode.dark : ThemeMode.light,
      initialRoute: RouteNames.stylesStylesIndex,
      getPages: RoutePages.list,
      navigatorObservers: [RoutePages.observer],
      // 词典
      translations: Translation(),
      // 代理
      localizationsDelegates: Translation.localizationsDelegates,
      // 支持的语言种类
      supportedLocales: Translation.supportedLocales,
      // 当前语言种类
      locale: ConfigService.to.locale,
      // 默认语言种类
      fallbackLocale: Translation.fallbackLocale,
    );
  }
}
