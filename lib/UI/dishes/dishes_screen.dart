import 'dart:async';

import 'package:chefkart_task/UI/dishes/controller/dishes_controller.dart';
import 'package:chefkart_task/UI/dishes/shimmer/shimmer_dishes_screen.dart';
import 'package:chefkart_task/UI/dishes/widget/dishes_widget.dart';
import 'package:chefkart_task/helper/color_constant.dart';
import 'package:chefkart_task/helper/common_font.dart';
import 'package:chefkart_task/helper/common_images.dart';
import 'package:chefkart_task/helper/common_widget/appbar_widget.dart';
import 'package:chefkart_task/helper/common_widget/button_widget.dart';
import 'package:chefkart_task/helper/common_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DishesScreen extends StatefulWidget {
  const DishesScreen({Key? key}) : super(key: key);

  @override
  State<DishesScreen> createState() => _DishesScreenState();
}

class _DishesScreenState extends State<DishesScreen> {
  final DishesController dishesController = Get.put(DishesController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dishesController.getDishes();
    });
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: colorWhite,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Obx(
      ()=> dishesController.isDishesLoading.value == true ? const ShimmerDishesScreen() : Scaffold(
        backgroundColor: colorWhite,
        floatingActionButton: ButtonWidget(
          onPress: (){},
          height: Get.height * 0.05,
          width: Get.width * 0.7,
          fontSize: 14,
          fontWeight: FontWeight.w300,
          buttonText: '3 food items selected',
          isShowIcon: true,
          icon: Icons.arrow_right_alt_sharp,
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
                                            SvgPicture.asset(
                                                CommonImages.icDate
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: TextWidget(
                                                text: '21 May 2021',
                                                colors: colorPrimary,
                                                fontSize: 14,
                                                fontFamily: Fonts.openSansBold,
                                                fontWeight: FontWeight.w800,
                                                maxLine: 1,
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
                                            SvgPicture.asset(
                                                CommonImages.icTime
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: TextWidget(
                                                text: '10:30 Pm-12:30 Pm',
                                                colors: colorPrimary,
                                                fontSize: 14,
                                                fontFamily: Fonts.openSansBold,
                                                fontWeight: FontWeight.w800,
                                                maxLine: 1,
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
                                    itemCount: dishesController.foodTypeList.length,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    physics: const AlwaysScrollableScrollPhysics(),
                                    itemBuilder: (context, index){
                                      return Obx(
                                        ()=> Padding(
                                          padding: const EdgeInsets.only(right: 15),
                                          child: GestureDetector(
                                            onTap: (){
                                              dishesController.selectedFoodTypeIndex.value = index;
                                            },
                                            behavior: HitTestBehavior.translucent,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                                                  border: Border.all(
                                                      color: dishesController.selectedFoodTypeIndex.value != index ? colorDarkGrey : colorOrange
                                                  ),
                                                  color: dishesController.selectedFoodTypeIndex.value != index ? colorWhite : colorLightOrange
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: Get.width * 0.05,
                                                vertical: Get.height * 0.005,
                                              ),
                                              child: Center(
                                                child: TextWidget(
                                                  text: dishesController.foodTypeList[index],
                                                  colors: dishesController.selectedFoodTypeIndex.value != index ? colorPrimary : colorOrange,
                                                  fontSize: 12,
                                                  fontFamily: Fonts.openSansBold,
                                                  fontWeight: dishesController.selectedFoodTypeIndex.value != index ? FontWeight.w300 : FontWeight.w600,
                                                  maxLine: 1,
                                                ),
                                              ),
                                            ),
                                          ),
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
                                dishesController.dishesModel.value.popularDishes == null ? const SizedBox() : SizedBox(
                                  height: Get.height * 0.07,
                                  child: ListView.builder(
                                    itemCount: dishesController.dishesModel.value.popularDishes!.length,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    physics: const AlwaysScrollableScrollPhysics(),
                                    itemBuilder: (context, index){
                                      return Obx(
                                            ()=> Padding(
                                          padding: const EdgeInsets.only(right: 15),
                                          child: GestureDetector(
                                            onTap: (){
                                              dishesController.selectedCategoryIndex.value = index;
                                            },
                                            behavior: HitTestBehavior.translucent,
                                            child: Container(
                                                height: Get.height * 0.07,
                                                width: Get.height * 0.07,
                                                decoration: BoxDecoration(
                                                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                                                  border: Border.all(
                                                      color: dishesController.selectedCategoryIndex.value == index ? colorWhite : colorOrange
                                                  ),
                                                ),
                                                padding: const EdgeInsets.all(3),
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                                                      child: Image.network(
                                                        dishesController.dishesModel.value.popularDishes![index].image ?? 'https://thechefkart.com/_next/image?url=https%3A%2F%2Fchefkart-strapi-media.s3.ap-south-1.amazonaws.com%2FItalian_168d980a5a.webp&w=3840&q=75',
                                                        fit: BoxFit.cover,
                                                        height: Get.height * 0.07,
                                                        width: Get.height * 0.07,
                                                      ),
                                                    ),
                                                    ClipRRect(
                                                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                                                      child: Container(
                                                        color: colorPrimary.withOpacity(0.4),
                                                        child: Center(
                                                          child: TextWidget(
                                                            text: dishesController.dishesModel.value.popularDishes![index].name,
                                                            colors: colorWhite,
                                                            fontSize: 12,
                                                            fontFamily: Fonts.openSansSemiBold,
                                                            fontWeight: FontWeight.w600,
                                                            textAlign: TextAlign.center,
                                                            maxLine: 2,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                            ),
                                          ),
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
                        GestureDetector(
                          onTap: (){
                            dishesController.isShowRecommended.value = !dishesController.isShowRecommended.value;
                          },
                          behavior: HitTestBehavior.translucent,
                          child: Row(
                            children: [
                              TextWidget(
                                text: 'Recommended',
                                colors: colorPrimary,
                                fontSize: 16,
                                fontFamily: Fonts.openSansBold,
                                fontWeight: FontWeight.w600,
                                maxLine: 1,
                              ),
                              Obx(
                                  ()=> Padding(
                                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
                                  child: Icon(
                                    dishesController.isShowRecommended.value == true ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                                    size: 30,
                                    color: colorPrimary,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        ButtonWidget(
                          onPress: (){},
                          height: Get.height * 0.04,
                          width: Get.width * 0.17,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          buttonText: 'Menu',
                          isShowIcon: false,
                        ),
                      ],
                    ),
                  ),
                  dishesController.dishesModel.value.dishes == null ? const SizedBox() : Obx(()=> AnimatedSize(
                      duration: const Duration(seconds: 2),
                      curve: Curves.linearToEaseOut,
                      child: SizedBox(
                        height: dishesController.isShowRecommended.value == true ? null : 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                          child: ListView.builder(
                            itemCount: dishesController.dishesModel.value.dishes!.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(top: 20),
                            itemBuilder: (context, index){
                              return DishesWidget(
                                dishes: dishesController.dishesModel.value.dishes![index],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
