import 'dart:async';

import 'package:chefkart_task/UI/dishes/controller/dishes_controller.dart';
import 'package:chefkart_task/UI/dishes/shimmer/shimmer_dishes_detail_screen.dart';
import 'package:chefkart_task/helper/color_constant.dart';
import 'package:chefkart_task/helper/common_font.dart';
import 'package:chefkart_task/helper/common_images.dart';
import 'package:chefkart_task/helper/common_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DishesDetailScreen extends StatefulWidget {
  const DishesDetailScreen({Key? key}) : super(key: key);

  @override
  State<DishesDetailScreen> createState() => _DishesDetailScreenState();
}

class _DishesDetailScreenState extends State<DishesDetailScreen> {
  final DishesController dishesController = Get.find();
  RxString dishRating = ''.obs;
  RxString dishDescription = ''.obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      String dishID = Get.arguments['dish_id'];
      dishRating.value = Get.arguments['dish_rating'];
      dishDescription.value = Get.arguments['dish_description'];

      if(dishID.isNotEmpty){
        dishesController.getDishesDetails(dishID: dishID);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> dishesController.isDishesDetailLoading.value == true ? const ShimmerDishesDetailScreen() : Scaffold(
        backgroundColor: colorWhite,
        body: Stack(
          children: [
            Positioned(
              top: Get.height * 0.06,
              right: -20,
              child: Container(
                height: Get.height * 0.27,
                width: Get.height * 0.27,
                decoration: BoxDecoration(
                  color: colorLightOrange,
                  borderRadius: const BorderRadius.all(Radius.circular(500))
                ),
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
                  GestureDetector(
                    onTap:(){
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      CommonImages.icBackArrow,
                      height: Get.height * 0.015,
                      width: 10,
                    ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextWidget(
                            text: '${dishesController.dishesDetailModel.value.name}',
                            colors: colorPrimary,
                            fontSize: 25,
                            fontFamily: Fonts.openSansExtraBold,
                            fontWeight: FontWeight.w900,
                            maxLine: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 5),
                            child: Container(
                              height: Get.height * 0.015,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(3)),
                                color: colorGreen,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                                child: Row(
                                  children: [
                                    TextWidget(
                                      text: '$dishRating',
                                      colors: colorWhite,
                                      fontSize: 10,
                                      fontFamily: Fonts.openSansBold,
                                      fontWeight: FontWeight.w500,
                                      maxLine: 1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 2),
                                      child: Icon(
                                        Icons.star,
                                        color: colorWhite,
                                        size: 10,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: Get.width * 0.36, top: Get.height * 0.01),
                        child: TextWidget(
                          text: '$dishDescription',
                          colors: colorDarkGrey,
                          fontSize: 10,
                          textAlign: TextAlign.start,
                          fontFamily: Fonts.openSansRegular,
                          fontWeight: FontWeight.w400,
                          maxLine: 8,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top : 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                            CommonImages.icTime
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextWidget(
                            text: '${dishesController.dishesDetailModel.value.timeToPrepare}',
                            colors: colorPrimary,
                            fontSize: 12,
                            fontFamily: Fonts.openSansSemiBold,
                            fontWeight: FontWeight.w400,
                            maxLine: 1,
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
                        TextWidget(
                          text: 'Ingredients',
                          colors: colorPrimary,
                          fontSize: 16,
                          fontFamily: Fonts.openSansBold,
                          fontWeight: FontWeight.w700,
                          maxLine: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: TextWidget(
                            text: 'For 2 people',
                            colors: colorPrimary,
                            fontSize: 8,
                            fontFamily: Fonts.openSansBold,
                            fontWeight: FontWeight.w300,
                            maxLine: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Divider(
                            color: colorDarkGrey.withOpacity(0.3),
                            thickness: 1,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            dishesController.isShowVegetables.value = !dishesController.isShowVegetables.value;
                          },
                          behavior: HitTestBehavior.translucent,
                          child: Row(
                            children: [
                              TextWidget(
                                text: 'Vegetables (${dishesController.dishesDetailModel.value.ingredients!.vegetables!.length})',
                                colors: colorPrimary,
                                fontSize: 14,
                                fontFamily: Fonts.openSansBold,
                                fontWeight: FontWeight.w600,
                                maxLine: 1,
                              ),
                              Obx(
                                ()=> Padding(
                                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
                                  child: Icon(
                                    dishesController.isShowVegetables.value == true ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                                    size: 25,
                                    color: colorPrimary,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Obx(
                          ()=> AnimatedSize(
                            duration: const Duration(seconds: 1),
                            curve: Curves.linearToEaseOut,
                            child: SizedBox(
                              height: dishesController.isShowVegetables.value == true ? null : 0,
                              child: Padding(
                                padding: EdgeInsets.only(top: Get.height * 0.005),
                                child: Column(
                                  children: dishesController.dishesDetailModel.value.ingredients!.vegetables!.map((vegetables){
                                    return Padding(
                                      padding: EdgeInsets.symmetric(vertical: Get.height * 0.004),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                            text: '${vegetables.name}',
                                            colors: colorPrimary,
                                            fontSize: 12,
                                            fontFamily: Fonts.openSansRegular,
                                            fontWeight: FontWeight.w300,
                                            maxLine: 1,
                                          ),
                                          TextWidget(
                                            text: '${vegetables.quantity}',
                                            colors: colorPrimary,
                                            fontSize: 12,
                                            fontFamily: Fonts.openSansRegular,
                                            fontWeight: FontWeight.w300,
                                            maxLine: 1,
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        GestureDetector(
                          onTap: (){
                            dishesController.isShowSpices.value = !dishesController.isShowSpices.value;
                          },
                          behavior: HitTestBehavior.translucent,
                          child: Row(
                            children: [
                              TextWidget(
                                text: 'Spices (${dishesController.dishesDetailModel.value.ingredients!.spices!.length})',
                                colors: colorPrimary,
                                fontSize: 14,
                                fontFamily: Fonts.openSansBold,
                                fontWeight: FontWeight.w600,
                                maxLine: 1,
                              ),
                              Obx(
                                ()=> Padding(
                                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
                                  child: Icon(
                                    dishesController.isShowSpices.value == true ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                                    size: 25,
                                    color: colorPrimary,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Obx(
                          ()=> AnimatedSize(
                            duration: const Duration(seconds: 1),
                            curve: Curves.linearToEaseOut,
                            child: SizedBox(
                              height: dishesController.isShowSpices.value == true ? null : 0,
                              child: Padding(
                                padding: EdgeInsets.only(top: Get.height * 0.005),
                                child: Column(
                                  children: dishesController.dishesDetailModel.value.ingredients!.spices!.map((spices){
                                    return Padding(
                                      padding: EdgeInsets.symmetric(vertical: Get.height * 0.004),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                            text: '${spices.name}',
                                            colors: colorPrimary,
                                            fontSize: 12,
                                            fontFamily: Fonts.openSansRegular,
                                            fontWeight: FontWeight.w300,
                                            maxLine: 1,
                                          ),
                                          TextWidget(
                                            text: '${spices.quantity}',
                                            colors: colorPrimary,
                                            fontSize: 12,
                                            fontFamily: Fonts.openSansRegular,
                                            fontWeight: FontWeight.w300,
                                            maxLine: 1,
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
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
                          children: dishesController.dishesDetailModel.value.ingredients!.appliances!.map((appliances){
                            return Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                  color: colorGrey,
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Wrap(
                                  direction: Axis.vertical,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 3),
                                      child: appliances.image == null ? Image.asset(
                                        CommonImages.imgRefrigerator,
                                        height: Get.height * 0.07,
                                      ) : appliances.image!.isEmpty ? Image.asset(
                                        CommonImages.imgRefrigerator,
                                        height: Get.height * 0.07,
                                      ) : Image.network(
                                          appliances.image ?? '',
                                        height: Get.height * 0.07,
                                      ),
                                    ),
                                    TextWidget(
                                      text: '${appliances.name}',
                                      colors: colorPrimary,
                                      fontSize: 10,
                                      fontFamily: Fonts.openSansRegular,
                                      fontWeight: FontWeight.w400,
                                      maxLine: 1,
                                    ),
                                  ],
                                ),
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
      ),
    );
  }
}
