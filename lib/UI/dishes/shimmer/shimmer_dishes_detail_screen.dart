import 'package:chefkart_task/UI/dishes/controller/dishes_controller.dart';
import 'package:chefkart_task/helper/color_constant.dart';
import 'package:chefkart_task/helper/common_font.dart';
import 'package:chefkart_task/helper/common_images.dart';
import 'package:chefkart_task/helper/common_widget/shimmer_container.dart';
import 'package:chefkart_task/helper/common_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ShimmerDishesDetailScreen extends StatefulWidget {
  const ShimmerDishesDetailScreen({Key? key}) : super(key: key);

  @override
  State<ShimmerDishesDetailScreen> createState() => _ShimmerDishesDetailScreenState();
}

class _ShimmerDishesDetailScreenState extends State<ShimmerDishesDetailScreen> {
  final DishesController dishesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Stack(
        children: [
          Positioned(
            top: Get.height * 0.06,
            right: -20,
            child: ShimmerContainer(
              height: Get.height * 0.27,
              width: Get.height * 0.27,
              radius: 500,
            ),
          ),
          Positioned(
            top: Get.height * 0.11,
            right: -20,
            child: Image.asset(
              CommonImages.imgVegetable,
              fit: BoxFit.fill,
              height: Get.height * 0.25,
            ),
          ),
          Positioned(
            top: Get.height * 0.265,
            right: 0,
            left: 0,
            child: Container(
              height: Get.height * 0.0025,
              color: colorDarkGrey.withOpacity(0.3),
              margin: const EdgeInsets.symmetric(vertical: 15),
            ),
          ),
          Positioned(
            top: 55,
            left: 15,
            child: Row(
              children: [
                SvgPicture.asset(
                  CommonImages.icBackArrow,
                  height: Get.height * 0.015,
                  width: 10,
                ),
              ],
            ),
          ),
          Positioned(
            top: Get.height * 0.11,
            bottom: 0,
            right: 0,
            left: Get.width * 0.065,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ShimmerContainer(
                          height: Get.height * 0.03,
                          width: Get.height * 0.18,
                          radius: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 5),
                          child: ShimmerContainer(
                            height: Get.height * 0.015,
                            width: Get.height * 0.035,
                            radius: 5,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: Get.width * 0.36, top: Get.height * 0.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              width: Get.height * 0.23,
                              radius: 5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: ShimmerContainer(
                              height: Get.height * 0.013,
                              width: Get.height * 0.2,
                              radius: 5,
                            ),
                          ),
                        ],
                      )
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top : 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ShimmerContainer(
                        height: Get.height * 0.03,
                        width: Get.height * 0.03,
                        radius: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ShimmerContainer(
                          height: Get.height * 0.02,
                          width: Get.height * 0.06,
                          radius: 10,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.08, right: Get.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerContainer(
                        height: Get.height * 0.02,
                        width: Get.height * 0.09,
                        radius: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: ShimmerContainer(
                          height: Get.height * 0.01,
                          width: Get.height * 0.06,
                          radius: 5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Divider(
                          color: colorDarkGrey.withOpacity(0.3),
                          thickness: 1,
                        ),
                      ),
                      Row(
                        children: [
                          ShimmerContainer(
                            height: Get.height * 0.02,
                            width: Get.height * 0.12,
                            radius: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
                            child: Icon(
                              Icons.arrow_drop_down ,
                              size: 25,
                              color: colorPrimary,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.005),
                        child: Column(
                          children: ['','',''].map((e){
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: Get.height * 0.004),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ShimmerContainer(
                                    height: Get.height * 0.015,
                                    width: Get.height * 0.09,
                                    radius: 5,
                                  ),
                                  ShimmerContainer(
                                    height: Get.height * 0.015,
                                    width: Get.height * 0.04,
                                    radius: 5,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Row(
                        children: [
                          ShimmerContainer(
                            height: Get.height * 0.02,
                            width: Get.height * 0.12,
                            radius: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
                            child: Icon(
                              Icons.arrow_drop_down ,
                              size: 25,
                              color: colorPrimary,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.005),
                        child: Column(
                          children: ['','',''].map((e){
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: Get.height * 0.004),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ShimmerContainer(
                                    height: Get.height * 0.015,
                                    width: Get.height * 0.09,
                                    radius: 5,
                                  ),
                                  ShimmerContainer(
                                    height: Get.height * 0.015,
                                    width: Get.height * 0.04,
                                    radius: 5,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.02,bottom: Get.height * 0.02),
                        child: TextWidget(
                          text: 'Appliances',
                          colors: colorPrimary,
                          fontSize: 18,
                          fontFamily: Fonts.openSansBold,
                          fontWeight: FontWeight.w700,
                          maxLine: 1,
                        ),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        children: ['','',''].map((e){
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: ShimmerContainer(
                              height: Get.height * 0.15,
                              width: Get.height * 0.09,
                              radius: 10,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
