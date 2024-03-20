import 'package:flutter/material.dart';
import 'package:elbara_express/core/app_export.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    this.shape,
    this.padding,
    this.variant,
    this.fontStyle,
    this.alignment,
    this.margin,
    this.onTap, // Ajouter onTap
    this.width,
    this.height,
    this.text,
    this.prefixWidget,
    this.suffixWidget,
  });

  ButtonShape? shape;
  ButtonPadding? padding;
  ButtonVariant? variant;
  ButtonFontStyle? fontStyle;
  Alignment? alignment;
  EdgeInsetsGeometry? margin;
  VoidCallback? onTap; // Déclarer onTap

  double? width;
  double? height;
  String? text;
  Widget? prefixWidget;
  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap, // Utiliser onTap
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        width ?? double.maxFinite,
        height ?? getVerticalSize(40),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      side: _setTextButtonBorder(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingT17:
        return getPadding(
          top: 17,
          right: 17,
          bottom: 17,
        );
      case ButtonPadding.PaddingT13:
        return getPadding(
          top: 13,
          bottom: 13,
        );
      case ButtonPadding.PaddingAll8:
        return getPadding(
          all: 8,
        );
      case ButtonPadding.PaddingT1:
        return getPadding(
          top: 1,
          bottom: 1,
        );
      case ButtonPadding.PaddingT0:
        return getPadding(all: 0);
      case ButtonPadding.PaddingAll26:
        return getPadding(
          all: 26,
        );
      case ButtonPadding.PaddingAll11:
        return getPadding(
          all: 11,
        );
      default:
        return getPadding(
          all: 16,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillGray50:
        return ColorConstant.gray50;
      case ButtonVariant.White:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineGray300:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineGray200:
      case ButtonVariant.OutlineGray300_1:
      case ButtonVariant.OutlineGreenA700:
      case ButtonVariant.OutlineAmber700:
      case ButtonVariant.OutlineRed700:
      case ButtonVariant.OutlineDeeppurple600:
        return null;
      default:
        //return ColorConstant.deepPurple600;
        return const Color(0xFFffba03);
    }
    

  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineGray200:
        return BorderSide(
          color: ColorConstant.gray200,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineGray300:
        return BorderSide(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineGray300_1:
        return BorderSide(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineGreenA700:
        return BorderSide(
          color: ColorConstant.greenA700,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineAmber700:
        return BorderSide(
          color: ColorConstant.amber700,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineRed700:
        return BorderSide(
          color: ColorConstant.red700,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineDeeppurple600:
        return BorderSide(
          color: ColorConstant.deepPurple600,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.FillDeeppurple600:
      case ButtonVariant.FillGray50:
      case ButtonVariant.White:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.CircleBorder16:
        return BorderRadius.circular(
          getHorizontalSize(
            16.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.SFProTextBold18:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.SFProTextSemibold16:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.SFProDisplayRegular16:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.SFProTextBold15:
        return TextStyle(
          color: ColorConstant.deepPurple600,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.Body:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.SFProTextBold20:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.SFProTextBold15WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.SFProTextSemibold14:
        return TextStyle(
          color: ColorConstant.greenA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.SFProTextSemibold14Amber700:
        return TextStyle(
          color: ColorConstant.amber700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.SFProTextSemibold14Red700:
        return TextStyle(
          color: ColorConstant.red700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.SFProTextBold18Deeppurple600:
        return TextStyle(
          color: ColorConstant.deepPurple600,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.SFProDisplayBold18:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w700,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w700,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder8,
  CircleBorder16,
}

enum ButtonPadding {
  PaddingAll16,
  PaddingT17,
  PaddingT13,
  PaddingAll8,
  PaddingT1,
  PaddingT0,
  PaddingAll26,
  PaddingAll11,
}

enum ButtonVariant {
  FillDeeppurple600,
  FillGray50,
  OutlineGray200,
  White,
  OutlineGray300,
  OutlineGray300_1,
  OutlineGreenA700,
  OutlineAmber700,
  OutlineRed700,
  OutlineDeeppurple600,
}

enum ButtonFontStyle {
  SFProTextBold18,
  SFProTextSemibold16,
  SFProDisplayRegular16,
  SFProTextBold15,
  Body,
  SFProTextBold20,
  SFProTextBold15WhiteA700,
  SFProTextSemibold14,
  SFProTextSemibold14Amber700,
  SFProTextSemibold14Red700,
  SFProTextBold18Deeppurple600,
  SFProDisplayBold18,
}
