import 'package:chefkart_task/helper/color_constant.dart';
import 'package:chefkart_task/helper/common_font.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final Color? colors;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLine;
  final TextAlign? textAlign;
  final String? fontFamily;
  final TextOverflow? overflow;

  const TextWidget({
    Key? key,
    required this.text,
    this.colors,
    this.fontSize,
    this.fontWeight,
    this.maxLine,
    this.textAlign,
    this.fontFamily, this.overflow
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      overflow:overflow ?? TextOverflow.ellipsis,
      maxLines: maxLine ?? 1,
      style: TextStyle(
          color: colors ?? colorWhite,
          fontSize: fontSize ?? 12.0,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontFamily: fontFamily ?? Fonts.openSansSemiBold
      ),
      textAlign: textAlign ?? TextAlign.justify,
    );
  }
}
