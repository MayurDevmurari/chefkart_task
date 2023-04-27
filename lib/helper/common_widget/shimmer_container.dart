import 'package:chefkart_task/helper/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';


class ShimmerContainer extends StatelessWidget {
  final double? height,width;
  final double? radius;
  const ShimmerContainer({Key? key, required this.height, this.width, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(milliseconds: 50),
      interval: const Duration(milliseconds: 100),
      color: Colors.white,
      colorOpacity: 0,
      enabled: true,
      direction: const ShimmerDirection.fromLTRB(),
      child: Container(
        height: height,
        width: width ?? Get.width,
        decoration: BoxDecoration(
            color: colorDarkGrey.withOpacity(0.2),
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 10))
        ),
      ),
    );
  }
}
