import 'package:chefkart_task/helper/color_constant.dart';
import 'package:chefkart_task/helper/common_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback? onPress;
  final String? buttonText;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? buttonBgColor;
  final Color? buttonTextColor;
  final FontWeight? fontWeight;
  final IconData? icon;
  final bool? isShowIcon;

  const ButtonWidget({
    Key? key,
    required this.onPress,
    this.buttonText,
    this.height,
    this.width,
    this.buttonBgColor,
    this.buttonTextColor,
    this.fontSize,
    this.fontWeight,
    this.icon,
    this.isShowIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: height ?? Get.height * 0.03,
        width: width ?? Get.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: buttonBgColor ?? colorPrimary,
        ),
        child: Row(
          mainAxisAlignment: isShowIcon == true ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
          children: [
            Row(
              children: [
                isShowIcon == true ? Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: SvgPicture.asset(
                      CommonImages.icFood
                  ),
                ) : const SizedBox(),
                Text(
                  buttonText ?? "",
                  style: TextStyle(
                      color: buttonTextColor ?? colorWhite,
                      fontWeight: fontWeight ?? FontWeight.bold,
                      fontSize: fontSize ?? 18,
                  ),
                ),
              ],
            ),
            isShowIcon == true ? Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(icon ?? Icons.chevron_right_outlined,color: colorWhite,size: 25,),
            ) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
