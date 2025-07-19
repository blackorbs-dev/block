import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color darkGrey;
  final Color white;
  final Color lightGrey;
  final Color lighterGrey;
  final Color midGrey;
  final Color charcoal;
  final Color black;
  final Color black80;
  final Color borderGrey;
  final Color navyBlue;
  final Color mutedGrey;
  final Color greyAccent;
  final Color successGreen;
  final Color greenTint;
  final Color blueBackground;

  const AppColors({
    this.darkGrey = const Color(0xFF141414),
    this.white = const Color(0xFFFFFFFF),
    this.lightGrey = const Color(0xFFD9D9D9),
    this.lighterGrey = const Color(0xFFF5F5F5),
    this.midGrey = const Color(0xFFB4B4B4),
    this.charcoal = const Color(0xFF2F2E32),
    this.black = const Color(0xFF000000),
    this.black80 = const Color(0xFF1E2024),
    this.borderGrey = const Color(0xFFD0D5DD),
    this.navyBlue = const Color(0xFF060C49),
    this.mutedGrey = const Color(0xFF767676),
    this.greyAccent = const Color(0xFFA2A1A2),
    this.successGreen = const Color(0xFF24B24C),
    this.greenTint = const Color(0xFFC1ECD3),
    this.blueBackground = const Color(0xFFF2F7FF),
  });

  @override
  AppColors copyWith({
    Color? darkGrey,
    Color? white,
    Color? lightGrey,
    Color? lighterGrey,
    Color? midGrey,
    Color? charcoal,
    Color? black,
    Color? black80,
    Color? borderGrey,
    Color? navyBlue,
    Color? mutedGrey,
    Color? greyAccent,
    Color? successGreen,
    Color? greenTint,
    Color? blueBackground,
  }) {
    return AppColors(
      darkGrey: darkGrey ?? this.darkGrey,
      white: white ?? this.white,
      lightGrey: lightGrey ?? this.lightGrey,
      lighterGrey: lighterGrey ?? this.lighterGrey,
      midGrey: midGrey ?? this.midGrey,
      charcoal: charcoal ?? this.charcoal,
      black: black ?? this.black,
      black80: black80 ?? this.black80,
      borderGrey: borderGrey ?? this.borderGrey,
      navyBlue: navyBlue ?? this.navyBlue,
      mutedGrey: mutedGrey ?? this.mutedGrey,
      greyAccent: greyAccent ?? this.greyAccent,
      successGreen: successGreen ?? this.successGreen,
      greenTint: greenTint ?? this.greenTint,
      blueBackground: blueBackground ?? this.blueBackground,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      darkGrey: Color.lerp(darkGrey, other.darkGrey, t)!,
      white: Color.lerp(white, other.white, t)!,
      lightGrey: Color.lerp(lightGrey, other.lightGrey, t)!,
      lighterGrey: Color.lerp(lighterGrey, other.lighterGrey, t)!,
      midGrey: Color.lerp(midGrey, other.midGrey, t)!,
      charcoal: Color.lerp(charcoal, other.charcoal, t)!,
      black: Color.lerp(black, other.black, t)!,
      black80: Color.lerp(black80, other.black80, t)!,
      borderGrey: Color.lerp(borderGrey, other.borderGrey, t)!,
      navyBlue: Color.lerp(navyBlue, other.navyBlue, t)!,
      mutedGrey: Color.lerp(mutedGrey, other.mutedGrey, t)!,
      greyAccent: Color.lerp(greyAccent, other.greyAccent, t)!,
      successGreen: Color.lerp(successGreen, other.successGreen, t)!,
      greenTint: Color.lerp(greenTint, other.greenTint, t)!,
      blueBackground: Color.lerp(blueBackground, other.blueBackground, t)!,
    );
  }
}
