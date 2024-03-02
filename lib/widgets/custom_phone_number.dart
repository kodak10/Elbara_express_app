import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomPhoneNumber extends StatelessWidget {
  CustomPhoneNumber({
    Key? key,
    required this.country,
    required this.onTap,
    required this.controller,
  }) : super(
          key: key,
        );

  Country country;

  Function(Country) onTap;

  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.whiteA700,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            8,
          ),
        ),
        border: Border.all(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1,
          ),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              _openCountryPicker(context);
            },
            child: Padding(
              padding: getPadding(
                left: 16,
                top: 17,
                bottom: 16,
              ),
              child: Text(
                "+${country.phoneCode}",
                style: AppStyle.txtBody,
              ),
            ),
          ),
          Expanded(
            child: CustomTextFormField(
              width: getHorizontalSize(
                149,
              ),
              focusNode: FocusNode(),
              autofocus: true,
              controller: controller,
              hintText: "lbl_405_555_0128".tr,
              margin: getMargin(
                left: 14,
                right: 199,
              ),
              variant: TextFormFieldVariant.None,
              fontStyle: TextFormFieldFontStyle.SFProTextRegular16,
              prefix: Container(
                margin: getMargin(
                  top: 2,
                  right: 16,
                  bottom: 5,
                ),
                child: CustomImageView(
                  svgPath: ImageConstant.imgIcArrowDown,
                ),
              ),
              prefixConstraints: BoxConstraints(
                maxHeight: getVerticalSize(
                  20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          Container(
            margin: EdgeInsets.only(
              left: getHorizontalSize(10),
            ),
            width: getHorizontalSize(60.0),
            child: Text(
              "+${country.phoneCode}",
              style: TextStyle(fontSize: getFontSize(14)),
            ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            child: Text(
              country.name,
              style: TextStyle(fontSize: getFontSize(14)),
            ),
          ),
        ],
      );

  void _openCountryPicker(BuildContext context) => showDialog(
        context: context,
        builder: (context) => CountryPickerDialog(
          searchInputDecoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(fontSize: getFontSize(14)),
          ),
          isSearchable: true,
          title: Text('Select your phone code',
              style: TextStyle(fontSize: getFontSize(14))),
          onValuePicked: (Country country) => onTap(country),
          itemBuilder: _buildDialogItem,
        ),
      );
}
