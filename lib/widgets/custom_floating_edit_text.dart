// ignore_for_file: must_be_immutable

import 'package:elbara_express/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomFloatingEditText extends StatelessWidget {
  CustomFloatingEditText(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.autofocus = false,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.labelText,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator});

  FloatingEditTextShape? shape;

  FloatingEditTextPadding? padding;

  FloatingEditTextVariant? variant;

  FloatingEditTextFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? autofocus;

  bool? isObscureText;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  int? maxLines;

  String? labelText;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildFloatingEditTextWidget(),
          )
        : _buildFloatingEditTextWidget();
  }

  _buildFloatingEditTextWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        autofocus: autofocus!,
        style: _setFontStyle(),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,
        obscuringCharacter: "•",
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      labelText: labelText ?? "",
      labelStyle: TextStyle(
        color: ColorConstant.gray600,
        fontSize: getFontSize(
          16,
        ),
        fontFamily: 'SF Pro Text',
        fontWeight: FontWeight.w400,
      ),
      errorStyle: TextStyle(
        color: ColorConstant.red,
        fontSize: getFontSize(
          16,
        ),
        fontFamily: 'SF Pro Text',
        fontWeight: FontWeight.w400,
      ),
      floatingLabelStyle: TextStyle(
        color: ColorConstant.black900,
        fontSize: getFontSize(
          13,
        ),
        fontFamily: 'SF Pro Text',
        fontWeight: FontWeight.w400,
      ),
      hintText: hintText ?? "",
      hintStyle: TextStyle(
        color: ColorConstant.gray600,
        fontSize: getFontSize(
          16,
        ),
        fontFamily: 'SF Pro Text',
        fontWeight: FontWeight.w400,
      ),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(
          variant: variant ?? FloatingEditTextVariant.OutlineGray300),
      focusedBorder:
          _setBorderStyle(variant: FloatingEditTextVariant.Outlinecyan800),
      disabledBorder: _setBorderStyle(),
      errorBorder:
          _setBorderStyle(variant: FloatingEditTextVariant.OutlineRed700),
      focusedErrorBorder:
          _setBorderStyle(variant: FloatingEditTextVariant.Outlinecyan800),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints ??
          BoxConstraints(minHeight: getSize(54), maxHeight: getSize(54)),
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding:
          _setPadding(padding: FloatingEditTextPadding.PaddingT17L16),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case FloatingEditTextFontStyle.SFProTextRegular15:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w400,
        );
      case FloatingEditTextFontStyle.SFProDisplayRegular17:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            17,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
        );
      default:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w400,
        );
    }
  }

  _setOutlineBorderRadius({FloatingEditTextShape? shape}) {
    switch (shape) {
      case FloatingEditTextShape.RoundedBorder8:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            16.00,
          ),
        );
    }
  }

  _setBorderStyle({FloatingEditTextVariant? variant}) {
    switch (variant) {
      case FloatingEditTextVariant.OutlineRed700:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(
              shape: FloatingEditTextShape.RoundedBorder8),
          borderSide: BorderSide(
            color: ColorConstant.red,
            width: 1,
          ),
        );
      case FloatingEditTextVariant.OutlineGray300:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(
              shape: FloatingEditTextShape.RoundedBorder8),
          borderSide: BorderSide(
            color: ColorConstant.gray300,
            width: 1,
          ),
        );
      case FloatingEditTextVariant.Outlinecyan800:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(
              shape: FloatingEditTextShape.RoundedBorder8),
          borderSide: BorderSide(
            color: ColorConstant.deepPurple600,
            width: 1,
          ),
        );
      case FloatingEditTextVariant.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case FloatingEditTextVariant.OutlineRed700:
        return ColorConstant.whiteA700;
      case FloatingEditTextVariant.OutlineGray300:
        return ColorConstant.whiteA700;
      default:
        return null;
    }
  }

  _setFilled() {
    switch (variant) {
      case FloatingEditTextVariant.floatingtextfield1:
        return false;
      case FloatingEditTextVariant.OutlineRed700:
        return true;
      case FloatingEditTextVariant.OutlineGray300:
        return true;
      case FloatingEditTextVariant.Outlinecyan800:
        return true;
      case FloatingEditTextVariant.None:
        return false;
      default:
        return false;
    }
  }

  _setPadding({FloatingEditTextPadding? padding}) {
    switch (padding) {
      case FloatingEditTextPadding.PaddingT17:
        return getPadding(
          left: 16,
          top: 17,
          right: 16,
          bottom: 16,
        );
      case FloatingEditTextPadding.PaddingT17L16:
        return getPadding(
          left: 16,
          top: 17.5,
          right: 16,
          bottom: 17.5,
        );
      case FloatingEditTextPadding.PaddingTB23:
        return getPadding(
          left: 16,
          top: 19,
          right: 19,
          bottom: 23,
        );
      default:
        return getPadding(
          left: 16,
          top: 25,
          right: 16,
          bottom: 16,
        );
    }
  }
}

enum FloatingEditTextShape {
  RoundedBorder16,
  RoundedBorder8,
}

enum FloatingEditTextPadding {
  PaddingT25,
  PaddingT17,
  PaddingT17L16,
  PaddingTB23,
}

enum FloatingEditTextVariant {
  None,
  floatingtextfield1,
  OutlineRed700,
  OutlineGray300,
  Outlinecyan800
}

enum FloatingEditTextFontStyle {
  SFProTextRegular16,
  SFProTextRegular15,
  SFProDisplayRegular17,
}
