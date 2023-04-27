import 'package:chefkart_task/UI/dishes/model/dishes_model.dart';
import 'package:chefkart_task/helper/color_constant.dart';
import 'package:chefkart_task/helper/common_font.dart';
import 'package:chefkart_task/helper/common_images.dart';
import 'package:chefkart_task/helper/common_widget/text_widget.dart';
import 'package:chefkart_task/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DishesWidget extends StatefulWidget {
  final Dishes dishes;

  const DishesWidget({
    Key? key,
    required this.dishes
  }) : super(key: key);

  @override
  State<DishesWidget> createState() => _DishesWidgetState();
}

class _DishesWidgetState extends State<DishesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment : CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: '${widget.dishes.name}',
                        colors: colorPrimary,
                        fontSize: 14,
                        fontFamily: Fonts.openSansBold,
                        fontWeight: FontWeight.w500,
                        maxLine: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SvgPicture.asset(
                            CommonImages.icVeg,
                          height: 12,
                        ),
                      ),
                      Container(
                        height: Get.height * 0.017,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(3)),
                          color: colorGreen,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                          child: Row(
                            children: [
                              TextWidget(
                                text: '${widget.dishes.rating}',
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
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        widget.dishes.equipments == null ? const SizedBox() : Wrap(
                          direction: Axis.horizontal,
                          children: widget.dishes.equipments!.map((equipments){
                            return Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Wrap(
                                direction: Axis.vertical,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 3),
                                    child: SvgPicture.asset(
                                      CommonImages.icRefrigerator,
                                      height: 16,
                                    ),
                                  ),
                                  TextWidget(
                                    text: equipments,
                                    colors: colorPrimary,
                                    fontSize: 8,
                                    fontFamily: Fonts.openSansRegular,
                                    fontWeight: FontWeight.w400,
                                    maxLine: 1,
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
                            Get.toNamed(Routes.dishesDetailScreen, arguments: {
                              'dish_id': widget.dishes.id.toString(),
                              'dish_rating': widget.dishes.rating.toString(),
                              'dish_description': widget.dishes.description.toString(),
                            });
                          },
                          behavior: HitTestBehavior.translucent,
                          child: Wrap(
                            direction: Axis.vertical,
                            children: [
                              TextWidget(
                                text: 'Ingredients',
                                colors: colorPrimary,
                                fontSize: 10,
                                fontFamily: Fonts.openSansBold,
                                fontWeight: FontWeight.w500,
                                maxLine: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: TextWidget(
                                  text: 'View list >',
                                  colors: colorOrange,
                                  fontSize: 8,
                                  fontFamily: Fonts.openSansBold,
                                  fontWeight: FontWeight.w500,
                                  maxLine: 1,
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
                    child: TextWidget(
                      text: '${widget.dishes.description}',
                      colors: colorPrimary,
                      fontSize: 10,
                      textAlign: TextAlign.start,
                      fontFamily: Fonts.openSansRegular,
                      fontWeight: FontWeight.w300,
                      maxLine: 4,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: Get.width * 0.33,
              height: Get.height * 0.125,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.network(
                      widget.dishes.image ?? 'https://thechefkart.com/_next/image?url=https%3A%2F%2Fchefkart-strapi-media.s3.ap-south-1.amazonaws.com%2FDinner_c7819b5f65.webp&w=3840&q=75',
                      fit: BoxFit.cover,
                      width: Get.width * 0.33,
                      height: Get.height * 0.11,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          elevation: 3,
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                    color: colorOrange
                                ),
                                color: colorWhite
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.055,
                                    vertical: Get.height * 0.005,
                                  ),
                                  child: TextWidget(
                                    text: 'Add',
                                    colors: colorOrange,
                                    fontSize: 14,
                                    fontFamily: Fonts.openSansBold,
                                    fontWeight: FontWeight.w400,
                                    maxLine: 1,
                                  ),
                                ),
                                Positioned(
                                  right: 2,
                                  top: 2,
                                  child: Icon(
                                    Icons.add,
                                    size: 10,
                                    color: colorOrange,
                                  )
                                ),
                              ],
                            ),
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
