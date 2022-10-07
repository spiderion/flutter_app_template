import 'package:flutter/material.dart';

class MaterialConstants {
  static const double DEFAULT_CAMERA_ZOOM = 15.0;
  static const double COUNTY_CAMERA_ZOOM = 12.0;
  static const double DEFAULT_CARD_ELEVATION = 5.0;
  static const double DEFAULT_SELECTED_CARD_ELEVATION = 7.0;
  static const double DEFAULT_CARD_HORIZONTAL_PADDING = 8.0;
  static const double DEFAULT_FAB_RADIUS = 30.0;
  static const double DEFAULT_TEXT_FIELD = 38.0;
  static const double ALERT_DIALOG_RADIUS = 25;
  static const double RADIUS_TEXT_FIELD_BORDER = 18.0;
  static const double RADIUS_TEXT_FIELD_BORDER_SECONDARY = 10.0;
  static const double RADIUS_SEARCH_BAR = 25.0;
  static const double RADIUS_TOP_CARD = 40.0;
  static const double DEFAULT_PAGE_MARGIN = 40.0;
  static const double RADIUS_CARD = 20.0;
  static const double RADIUS_AVATAR_SMALL = 16.0;
  static const double OUTLINE_BUTTON_BORDER = 1.5;
  static const double RADIUS_SMALL = 5.0;
  static const double RADIUS_MODAL = 40.0;
  static const double RADIUS_MODAL_MEDIUM = 8.0;
  static const double DEFAULT_ITEM_BORDER = 14.0;
  static const double ITEM_BORDER_MEDIUM = 6.0;
  static const double DEFAULT_PAGE_PADDING = 30;
  static const double DEFAULT_ACTION_BUTTON_HORIZONTAL_PADDING = 30;
  static const double DEFAULT_ITEM2_BORDER = 14.0;
  static const double DEFAULT_ITEM3_BORDER = 20.0;
  static const double DEFAULT_CAMERA_SCREEN = 14.0;
  static const double ICONS_SIZE_ONE = 35.0;
  static const double ICONS_SIZE_TWO = 45.0;
  static const double DEFAULT_ITEM_POP_UP_BORDER = 15.0;
  static const double ACTION_BUTTON_HORIZONTAL_MARGIN = 40.0;
  static const double SEARCH_BAR_DEFAULT_HEIGHT = 50.0;
  static const double DEFAULT_MARGIN_LEFT = 28.0;
  static const double DEFAULT_MARGIN_LEFT_MINOR = 18.0;
  static const double BACK_ARROW_ICON_SIZE = 24.0;
  static const double DEFAULT_ARROW_ICON_SIZE = 18.0;
  static const double DEFAULT_BUTTON_CHILD_PADDING = 10.0;
}

class MaterialFontSize {
  static const double APP_BAR_DEFAULT_TITLE = 24.0;
  static const double VERY_LARGE = 26.0;
  static const double VERY_LARGE_PLUS = 28.0;
  static const double LARGE = 24.0;
  static const double LARGE_2X = 48.0;
  static const double HUGE = 34.0;
  static const double HUGE_2X = 68.0;
  static const double BIG = 60.0;
  static const double GENERAL_TITLE = 20.0;
  static const double ACTION_BUTTON = 22.0;
  static const double TITLE = 22.0;
  static const double GENERAL_HINT = 12.0;
  static const double BIG_HINT = 13.0;
  static const double VERY_SMALL_HINT = 10.0;
  static const double SMALL_HINT = 11.0;
  static const double ULTRA_SMALL_HINT = 8.0;
  static const double GENERAL_TEXT = 16.0;
  static const double GENERAL_TEXT_TAB = 18.0;
  static const double GENERAL_TEXT_TILE = 18.0;
  static const double GENERAL_TEXT_MEDIUM = 14.0;
  static const double CARD_CONTENT = 16.0;

  ///specific to context
  static const double MATCH_RESULT = VERY_LARGE;
}

class MaterialTextStyles {
  static const H1 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 30.0,
  );

  static const H2 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 22.0,
  );

  static const H3 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18.0,
  );

  static const H4 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15.0,
  );

  static const H5 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15.0,
  );

  static const H6 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
  );
}

class MaterialFontWeight {
  static const FontWeight REGULAR = FontWeight.w400;
  static const FontWeight MEDIUM = FontWeight.w500;
  static const FontWeight BOLD = FontWeight.w700;
  static const FontWeight EXTRA_BOLD = FontWeight.w800;
}

class MaterialFont {
  static const String PRIMARY = 'Helvetica';
  static const String SECONDARY = "Helvetica";
  static const String TERTIARY = "";
}
