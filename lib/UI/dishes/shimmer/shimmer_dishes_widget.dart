import 'package:chefkart_task/helper/color_constant.dart';
import 'package:chefkart_task/helper/common_font.dart';
import 'package:chefkart_task/helper/common_images.dart';
import 'package:chefkart_task/helper/common_widget/shimmer_container.dart';
import 'package:chefkart_task/helper/common_widget/text_widget.dart';
import 'package:chefkart_task/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ShimmerDishesWidget extends StatefulWidget {
  const ShimmerDishesWidget({Key? key}) : super(key: key);

  @override
  State<ShimmerDishesWidget> createState() => _ShimmerDishesWidgetState();
}

class _ShimmerDishesWidgetState extends State<ShimmerDishesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ShimmerContainer(
                        height: Get.height * 0.025,
                        width: Get.height * 0.11,
                        radius: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ShimmerContainer(
                          height: Get.height * 0.015,
                          width: Get.height * 0.015,
                          radius: 5,
                        ),
                      ),
                      ShimmerContainer(
                        height: Get.height * 0.017,
                        width: Get.height * 0.035,
                        radius: 5,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Wrap(
                          direction: Axis.horizontal,
                          children: ['',''].map((e){
                            return Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Wrap(
                                direction: Axis.vertical,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 3),
                                    child: ShimmerContainer(
                                      height: Get.height * 0.027,
                                      width: Get.height * 0.018,
                                      radius: 5,
                                    ),
                                  ),
                                  ShimmerContainer(
                                    height: Get.height * 0.007,
                                    width: Get.height * 0.036,
                                    radius: 5,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            color: colorDarkGrey,
                            width: 0.8,
                            height: 25,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.dishesDetailScreen);
                          },
                          behavior: HitTestBehavior.translucent,
                          child: Wrap(
                            direction: Axis.vertical,
                            children: [
                              ShimmerContainer(
                                height: Get.height * 0.013,
                                width: Get.height * 0.056,
                                radius: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: ShimmerContainer(
                                  height: Get.height * 0.01,
                                  width: Get.height * 0.036,
                                  radius: 5,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        ShimmerContainer(
                          height: Get.height * 0.013,
                          width: Get.height * 0.4,
                          radius: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: ShimmerContainer(
                            height: Get.height * 0.013,
                            width: Get.height * 0.4,
                            radius: 5,
                          ),
                        ),
                      ],
                    )
                  ),
                ],
              ),
            ),
            SizedBox(
              width: Get.width * 0.33,
              height: Get.height * 0.125,
              child: Stack(
                children: [
                  ShimmerContainer(
                    width: Get.width * 0.33,
                    height: Get.height * 0.11,
                    radius: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          elevation: 3,
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          child: ShimmerContainer(
                            height: Get.height * 0.03,
                            width: Get.width * 0.15,
                            radius: 5,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          height: Get.height * 0.0015,
          color: colorDarkGrey.withOpacity(0.3),
          margin: const EdgeInsets.symmetric(vertical: 15),
        ),
      ],
    );
  }
}
