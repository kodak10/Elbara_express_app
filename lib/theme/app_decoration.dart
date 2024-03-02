import 'package:flutter/material.dart';
import 'package:elbara_express/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillBlack9007e => BoxDecoration(
        color: ColorConstant.black9007e,
      );
  static BoxDecoration get fillDeeppurple600 => BoxDecoration(
        color: ColorConstant.deepPurple600,
      );
  static BoxDecoration get fillGray50 => BoxDecoration(
        color: ColorConstant.gray50,
      );
  static BoxDecoration get fillCyan400 => BoxDecoration(
        color: ColorConstant.cyan400,
      );
  static BoxDecoration get outlineGray3002 => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorConstant.gray300,
            width: getHorizontalSize(
              1,
            ),
          ),
        ),
      );
  static BoxDecoration get fillDeeppurple50 => BoxDecoration(
        color: ColorConstant.deepPurple50,
      );
  static BoxDecoration get outlineGray3001 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            2,
          ),
        ),
      );
  static BoxDecoration get fillDeeppurple60075 => BoxDecoration(
        color: ColorConstant.deepPurple60075,
      );
  static BoxDecoration get outlineGray200 => BoxDecoration(
        color: ColorConstant.gray50,
        border: Border(
          bottom: BorderSide(
            color: ColorConstant.gray200,
            width: getHorizontalSize(
              1,
            ),
          ),
        ),
      );
  static BoxDecoration get outlineGray300 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get white => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get fillBlue700 => BoxDecoration(
        color: ColorConstant.blue700,
      );
  static BoxDecoration get fillBlue50 => BoxDecoration(
        color: ColorConstant.blue50,
      );
  static BoxDecoration get txtWhite => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get txtOutlineGray200 => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorConstant.gray200,
            width: getHorizontalSize(
              1,
            ),
          ),
        ),
      );
  static BoxDecoration get outlineDeeppurple600 => BoxDecoration(
        color: ColorConstant.deepPurple50,
        border: Border.all(
          color: ColorConstant.deepPurple600,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder16 = BorderRadius.circular(
    getHorizontalSize(
      16,
    ),
  );

  static BorderRadius roundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8,
    ),
  );

  static BorderRadius circleBorder55 = BorderRadius.circular(
    getHorizontalSize(
      55,
    ),
  );

  static BorderRadius circleBorder25 = BorderRadius.circular(
    getHorizontalSize(
      25,
    ),
  );

  static BorderRadius circleBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20,
    ),
  );

  static BorderRadius customBorderTL32 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        32,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        32,
      ),
    ),
  );

  static BorderRadius circleBorder70 = BorderRadius.circular(
    getHorizontalSize(
      70,
    ),
  );

  static BorderRadius customBorderTL16 = BorderRadius.only(
    bottomRight: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
    bottomLeft: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
  );
  static BorderRadius customBorderTR16 = BorderRadius.only(
    bottomRight: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
    topLeft: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
    bottomLeft: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
  );

  static BorderRadius customBorderBL32 = BorderRadius.only(
    bottomLeft: Radius.circular(
      getHorizontalSize(
        32,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        32,
      ),
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
    