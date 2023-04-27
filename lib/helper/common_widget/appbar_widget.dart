import 'package:chefkart_task/helper/color_constant.dart';
import 'package:chefkart_task/helper/common_font.dart';
import 'package:chefkart_task/helper/common_images.dart';
import 'package:chefkart_task/helper/common_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatefulWidget {
  final bool isShowTitle;
  final String? title;

  const AppBarWidget({
    Key? key,
    this.isShowTitle = true,
    this.title,
  }) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.1,
      decoration: BoxDecoration(
        color: colorWhite,
      ),
      child: SafeArea(
        top: true,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5,left: 5),
                child: GestureDetector(
                  onTap:(){
                    Get.back();
                  },
                  child: SvgPicture.asset(
                      CommonImages.icBackArrow,
                    height: Get.height * 0.015,
                  ),
                )
              ),
              widget.isShowTitle == true ?  Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextWidget(
                  text: '${widget.title}',
                  colors: colorPrimary,
                  fontSize: 18,
                  fontFamily: Fonts.openSansSemiBold,
                  fontWeight: FontWeight.w600,
                  maxLine: 1,
                )
              ) : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
