import 'package:chefkart_task/UI/dishes/shimmer/shimmer_dishes_widget.dart';
import 'package:chefkart_task/helper/color_constant.dart';
import 'package:chefkart_task/helper/common_font.dart';
import 'package:chefkart_task/helper/common_widget/appbar_widget.dart';
import 'package:chefkart_task/helper/common_widget/shimmer_container.dart';
import 'package:chefkart_task/helper/common_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShimmerDishesScreen extends StatefulWidget {
  const ShimmerDishesScreen({Key? key}) : super(key: key);

  @override
  State<ShimmerDishesScreen> createState() => _ShimmerDishesScreenState();
}

class _ShimmerDishesScreenState extends State<ShimmerDishesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      floatingActionButton: ShimmerContainer(
        height: Get.height * 0.05,
        width: Get.width * 0.7,
        radius: 10,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          const AppBarWidget(
            title: 'Select Dishes',
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: Get.height * 0.31,
                  child: Stack(
                    children: [
                      Container(
                        height: Get.height * 0.06,
                        color: colorPrimary,
                      ),
                      Positioned(
                          right: Get.width * 0.05,
                          left: Get.width * 0.05,
                          top: Get.height * 0.033,
                          child: Wrap(
                            children: [
                              Material(
                                elevation: 3,
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                color: colorWhite,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    color: colorWhite,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: Get.height * 0.02
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ShimmerContainer(
                                            height: Get.height * 0.03,
                                            width: Get.height * 0.03,
                                            radius: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: ShimmerContainer(
                                              height: Get.height * 0.03,
                                              width: Get.height * 0.11,
                                              radius: 10,
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Container(
                                          color: colorDarkGrey,
                                          width: 0.8,
                                          height: 30,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ShimmerContainer(
                                            height: Get.height * 0.03,
                                            width: Get.height * 0.03,
                                            radius: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: ShimmerContainer(
                                              height: Get.height * 0.03,
                                              width: Get.height * 0.11,
                                              radius: 10,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.1,
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                                child: ListView.builder(
                                  itemCount: 7,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index){
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: ShimmerContainer(
                                        height: Get.height * 0.03,
                                        width: Get.height * 0.08,
                                        radius: 10,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.05,
                              ),
                              TextWidget(
                                text: 'Popular Dishes',
                                colors: colorPrimary,
                                fontSize: 16,
                                fontFamily: Fonts.openSansBold,
                                fontWeight: FontWeight.w600,
                                maxLine: 1,
                              ),
                              SizedBox(
                                height: Get.height * 0.04,
                              ),
                              SizedBox(
                                height: Get.height * 0.07,
                                child: ListView.builder(
                                  itemCount: 7,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index){
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: ShimmerContainer(
                                        height: Get.height * 0.07,
                                        width: Get.height * 0.07,
                                        radius: 50,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: Get.height * 0.003,
                  color: colorDarkGrey.withOpacity(0.3),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          TextWidget(
                            text: 'Recommended',
                            colors: colorPrimary,
                            fontSize: 16,
                            fontFamily: Fonts.openSansBold,
                            fontWeight: FontWeight.w600,
                            maxLine: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 30,
                              color: colorPrimary,
                            ),
                          ),
                        ],
                      ),
                      ShimmerContainer(
                        height: Get.height * 0.04,
                        width: Get.width * 0.17,
                        radius: 10,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 20),
                    itemBuilder: (context, index){
                      return const ShimmerDishesWidget();
                    },
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
