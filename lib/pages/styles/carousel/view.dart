import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart' as carousel;

class CarouselPage extends GetView<carousel.CarouselController> {
  const CarouselPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("CarouselPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<carousel.CarouselController>(
      init: carousel.CarouselController(),
      id: "carousel",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("carousel")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
