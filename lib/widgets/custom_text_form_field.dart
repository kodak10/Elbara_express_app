import 'package:elbara_express/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
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
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator});

  TextFormFieldShape? shape;

  TextFormFieldPadding? padding;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;

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
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
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
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(
          variant: variant ?? TextFormFieldVariant.OutlineGray300),
      focusedBorder: _setBorderStyle(
          variant: variant ?? TextFormFieldVariant.OutlineDeeppurple600),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case TextFormFieldFontStyle.SFProTextRegular16:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.SFProTextSemibold18:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w600,
        );
      default:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w400,
        );
    }
  }

  _setOutlineBorderRadius({TextFormFieldShape? shape}) {
    switch (shape) {
      case TextFormFieldShape.RoundedBorder16:
        return BorderRadius.circular(
          getHorizontalSize(
            16.00,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
    }
  }

  _setBorderStyle({TextFormFieldVariant? variant}) {
    switch (variant) {
      case TextFormFieldVariant.OutlineDeeppurple600:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.deepPurple600,
            width: 1,
          ),
        );
      case TextFormFieldVariant.OutlineDeeppurple600Radi16:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(
              shape: TextFormFieldShape.RoundedBorder16),
          borderSide: BorderSide(
            color: ColorConstant.deepPurple600,
            width: 1,
          ),
        );
      case TextFormFieldVariant.FillGray50:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(
              shape: TextFormFieldShape.RoundedBorder16),
          borderSide: BorderSide(color: ColorConstant.gray50),
        );
      case TextFormFieldVariant.OutlineGray300:
        return OutlineInputBorder(
          borderRadius:
              _setOutlineBorderRadius(shape: TextFormFieldShape.RoundedBorder8),
          borderSide: BorderSide(
            color: ColorConstant.gray300,
            width: 1,
          ),
        );
      case TextFormFieldVariant.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(
              shape: TextFormFieldShape.RoundedBorder16),
          borderSide: BorderSide(
            color: ColorConstant.gray50,
            width: 1,
          ),
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case TextFormFieldVariant.OutlineDeeppurple600:
        return ColorConstant.deepPurple50;
      case TextFormFieldVariant.FillGray50:
        return ColorConstant.gray50;
      default:
        return ColorConstant.whiteA700;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.OutlineDeeppurple600:
        return true;
      case TextFormFieldVariant.FillGray50:
        return true;
      case TextFormFieldVariant.OutlineGray300:
        return true;
      case TextFormFieldVariant.None:
        return false;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.PaddingT17_1:
        return getPadding(
          left: 16,
          top: 17,
          bottom: 17,
        );
      case TextFormFieldPadding.PaddingT27:
        return getPadding(
          top: 27,
          bottom: 27,
        );
      case TextFormFieldPadding.PaddingT27_1:
        return getPadding(
          top: 27,
          right: 27,
          bottom: 27,
        );
      case TextFormFieldPadding.PaddingT20:
        return getPadding(
          left: 16,
          top: 20,
          right: 16,
          bottom: 20,
        );
      default:
        return getPadding(
          left: 16,
          top: 17,
          right: 16,
          bottom: 17,
        );
    }
  }
}

enum TextFormFieldShape {
  RoundedBorder8,
  RoundedBorder16,
}

enum TextFormFieldPadding {
  PaddingT17,
  PaddingT17_1,
  PaddingT27,
  PaddingT27_1,
  PaddingT20,
}

enum TextFormFieldVariant {
  None,
  White,
  OutlineDeeppurple600,
  OutlineDeeppurple600Radi16,
  FillGray50,
  OutlineGray300,
}

enum TextFormFieldFontStyle {
  Body,
  SFProTextRegular16,
  SFProTextSemibold18,
}
