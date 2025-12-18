import 'package:flutter/material.dart';

/// A professional typography system defined for the application's
/// brand identity.
///
/// This [ThemeExtension] centralizes text styles, ensuring a consistent
/// visual hierarchy that aligns with the design system (e.g., Figma).
/// It decouples the app from Material Design's default [TextTheme] naming,
/// providing more semantic and flexible tokens.
///
/// ### Usage:
/// ```dart
/// Text(
///   'Welcome!',
///   style: BrandTextStyles.of(context).h1,
/// );
/// ```
@immutable
class BrandTextStyles extends ThemeExtension<BrandTextStyles> {
  /// Creates a set of brand-specific typography tokens.
  ///
  /// All parameters must be non-null to ensure smooth interpolation
  /// during theme transitions.
  const BrandTextStyles({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.bodyPrimary,
    required this.bodySecondary,
    required this.button,
    required this.caption,
  });

  /// Standard factory for the application.
  factory BrandTextStyles.standard() {
    return const BrandTextStyles(
      h1: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      h2: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      h3: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodyPrimary: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodySecondary: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      button: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      caption: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  /// Hero title style. Used for major screen headings and high-impact text.
  final TextStyle h1;

  /// Section header style. Used for primary content headings.
  final TextStyle h2;

  /// Subheader style. Used for grouping content or smaller headers.
  final TextStyle h3;

  /// Main content style. Used for paragraphs and primary reading material.
  final TextStyle bodyPrimary;

  /// Auxiliary content style. Used for secondary info, hints, or
  /// descriptive text.
  final TextStyle bodySecondary;

  /// Interactive label style. Optimized for buttons, chips, and
  /// clickable items.
  final TextStyle button;

  /// Smallest text style. Used for legal disclaimers, timestamps, or captions.
  final TextStyle caption;

  /// A static helper method to retrieve [BrandTextStyles]
  /// from the current [BuildContext].
  ///
  /// Throws an [AssertionError] if the extension is not found in
  /// the widget tree,
  /// ensuring developers are alerted early to configuration issues.
  static BrandTextStyles of(BuildContext context) {
    final styles = Theme.of(context).extension<BrandTextStyles>();
    assert(
      styles != null,
      '''
      BrandTextStyles extension not found in Theme.
      Check your MaterialApp configuration.
      ''',
    );
    return styles!;
  }

  /// Creates a copy of this [BrandTextStyles] but with the given
  /// fields replaced with new values.
  @override
  BrandTextStyles copyWith({
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? bodyPrimary,
    TextStyle? bodySecondary,
    TextStyle? button,
    TextStyle? caption,
  }) {
    return BrandTextStyles(
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
      h3: h3 ?? this.h3,
      bodyPrimary: bodyPrimary ?? this.bodyPrimary,
      bodySecondary: bodySecondary ?? this.bodySecondary,
      button: button ?? this.button,
      caption: caption ?? this.caption,
    );
  }

  /// Linearly interpolates between two [BrandTextStyles] instances.
  ///
  /// This ensures that during theme changes, the font sizes, weights,
  /// and colors animate smoothly instead of snapping.
  @override
  BrandTextStyles lerp(
    covariant ThemeExtension<BrandTextStyles>? other,
    double t,
  ) {
    if (other is! BrandTextStyles) return this;

    return BrandTextStyles(
      h1: TextStyle.lerp(h1, other.h1, t) ?? h1,
      h2: TextStyle.lerp(h2, other.h2, t) ?? h2,
      h3: TextStyle.lerp(h3, other.h3, t) ?? h3,
      bodyPrimary:
          TextStyle.lerp(bodyPrimary, other.bodyPrimary, t) ?? bodyPrimary,
      bodySecondary:
          TextStyle.lerp(bodySecondary, other.bodySecondary, t) ??
          bodySecondary,
      button: TextStyle.lerp(button, other.button, t) ?? button,
      caption: TextStyle.lerp(caption, other.caption, t) ?? caption,
    );
  }
}
