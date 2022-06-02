import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/resources/app_colors.dart';

abstract class AppTextStyles {
  static const fs10w500 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 1.6,
    color: AppColors.color22A2BD,
  );
  static const fs12w400 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.3,
    color: AppColors.color5B6975,
  );
  static const fs14w400White = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: Color(0xffffffff),
  );
  static const fs14w400Grey = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: Color(0xff6E798C),
  );
  static const fs13w400 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: Color(0xffffffff),
  );
  static const fs16w500 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.5,
    color: Color(0xffffffff),
  );
  static const fs20w500 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: Color(0xffffffff),
  );
}
