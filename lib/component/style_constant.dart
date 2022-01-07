import 'package:flutter/cupertino.dart';
import 'package:firstapps/component/color_constant.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';

// Style for title
var mTitleStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w600, color: mTitleColor, fontSize: 16);

// Style for More Section
var mMoreStyle = GoogleFonts.inter(
    fontSize: 12, fontWeight: FontWeight.w700, color: mBlueColor);

// Style for Collection Section
var mCollectionStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w500, fontSize: 12, color: mTitleColor);

// Style for Popular & newest Section
var mPopularTitleStyle = GoogleFonts.inter(
  fontWeight: FontWeight.w700,
  fontSize: 12,
  color: mCardTitleColor,
);
var mPopularSubtitleStyle = GoogleFonts.inter(
  fontWeight: FontWeight.w500,
  fontSize: 10,
  color: mCardSubtitleColor,
);
