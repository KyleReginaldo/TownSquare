import 'package:flutter/material.dart';

const Color kScaffoldBackground = Color(0xFFFBFBFB);
const Color kScaffoldBackgroundDark = Color(0xFF0E0E0E);

const Color kPrimary600 = Color(0xFF35BAF8);
const Color kPrimary500 = Color(0xFF4FC7FF);
const Color kPrimary400 = Color(0xFF7FD6FF);
const Color kPrimary300 = Color(0xFFA1E1FF);
const Color kPrimary200 = Color(0xFFC1EBFF);
const Color kPrimary100 = Color(0xFFD5F1FF);
const Color kNeutral600 = Color(0xFF6C757D);
const Color kNeutral500 = Color(0xFFADB5BD);
const Color kNeutral400 = Color(0xFFCED4DA);
const Color kNeutral300 = Color(0xFFDEE2E6);
const Color kNeutral200 = Color(0xFFE9ECEF);
const Color kNeutral100 = Color(0xFFF8F9FA);
const Color kBlack = Color(0xFF000000);
const Color kWhite = Color(0xFFFFFFFF);
const Color kSecondaryYellow600 = Color(0xFFEBCF30);
const Color kSecondaryYellow500 = Color(0xFFF6DB43);
const Color kSecondaryYellow400 = Color(0xFFFFE764);
const Color kSecondaryYellow300 = Color(0xFFFFF09C);
const Color kSecondaryYellow200 = Color(0xFFFFF09C);
const Color kSecondaryYellow100 = Color(0xFFFFF8EB);
const Color kSecondaryPurple600 = Color(0xFF7C5D8E);
const Color kSecondaryPurple500 = Color(0xFFAC84C3);
const Color kSecondaryPurple400 = Color(0xFFBAA1C8);
const Color kSecondaryPurple300 = Color(0xFFE5D5EE);
const Color kSecondaryPurple200 = Color(0xFFEEE1F5);
const Color kSecondaryPurple100 = Color(0xFFFBF4FF);
//*TAGS
const Color kLightIntensity = Color(0xFFD5F1FF);
const Color kLightIntensityTitle = Color(0xFF65B5DB);
const Color kMediumIntensity = Color(0xFFF3E8FF);
const Color kMediumIntensityTitle = Color(0xFFC9A4F2);
const Color kHighIntensity = Color(0xFFFFEAD1);
const Color kHighIntensityTitle = Color(0xFFDC974F);
const Color kVeryHighIntensity = Color(0xffFFE0E4);
const Color kVeryHighIntensityTitle = Color(0xFFD98792);
const Color kChildCareTag = Color(0xFFD8F7DF);
const Color kWorkplaceTag = Color(0xFF989AEA);
const Color kChildCareTitle = Color(0xFF8AB58A);

({Color title, Color background}) getTagColor(String tag) {
  switch (tag) {
    case 'light':
      return (title: kLightIntensityTitle, background: kLightIntensity);
    case 'medium':
      return (title: kMediumIntensityTitle, background: kMediumIntensity);
    case 'high':
      return (title: kHighIntensityTitle, background: kHighIntensity);
    case 'veryhigh':
      return (title: kVeryHighIntensityTitle, background: kVeryHighIntensity);
    case 'childcare':
      return (title: kChildCareTitle, background: kChildCareTag);
    default:
      return (title: kSecondaryPurple600, background: kSecondaryPurple600);
  }
}
