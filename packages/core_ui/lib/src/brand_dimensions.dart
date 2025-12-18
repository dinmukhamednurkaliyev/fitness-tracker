import 'dart:ui';

import 'package:flutter/material.dart';

/// A set of geometric design tokens for the application.
///
/// This [ThemeExtension] manages the spatial system of the brand, including
/// spacing (padding/margins) and corner radiuses. Using these tokens instead
/// of raw numbers ensures a consistent grid and visual harmony across
/// different screens and components.
///
/// ### Usage:
/// ```dart
/// final dimension = BrandDimensions.of(context);
/// return Padding(
///   padding: EdgeInsets.all(dimension.spaceM),
///   child: Container(
///     decoration: BoxDecoration(
///       borderRadius: BorderRadius.circular(dimension.radiusM),
///     ),
///   ),
/// );
/// ```
@immutable
class BrandDimensions extends ThemeExtension<BrandDimensions> {
  /// Creates a set of brand-specific dimension tokens.
  const BrandDimensions({
    required this.spaceXS,
    required this.spaceS,
    required this.spaceM,
    required this.spaceL,
    required this.radiusS,
    required this.radiusM,
    required this.radiusL,
  });

  /// Standard 8px-grid based factory for the application.
  factory BrandDimensions.standard() => const BrandDimensions(
    spaceXS: 4,
    spaceS: 8,
    spaceM: 16,
    spaceL: 24,
    radiusS: 4,
    radiusM: 12,
    radiusL: 24,
  );

  /// Extra small spacing. Use for tight element grouping.
  final double spaceXS;

  /// Small spacing. Use for internal padding of small components.
  final double spaceS;

  /// Medium spacing. The standard gutter for margins and paddings.
  final double spaceM;

  /// Large spacing. Use for separating major layout sections.
  final double spaceL;

  /// Small corner radius. Use for small elements like tags or checkboxes.
  final double radiusS;

  /// Medium corner radius. Use for primary components like buttons or cards.
  final double radiusM;

  /// Large corner radius. Use for large containers like bottom sheets
  /// or dialogs.
  final double radiusL;

  /// A static helper method to retrieve [BrandDimensions]
  /// from the [BuildContext].
  ///
  /// Throws an [AssertionError] if the extension is not found in the
  /// theme tree.
  static BrandDimensions of(BuildContext context) {
    final dimensions = Theme.of(context).extension<BrandDimensions>();
    assert(
      dimensions != null,
      'BrandDimensions extension not found in Theme. Check your configuration.',
    );
    return dimensions!;
  }

  @override
  BrandDimensions copyWith({
    double? spaceXS,
    double? spaceS,
    double? spaceM,
    double? spaceL,
    double? radiusS,
    double? radiusM,
    double? radiusL,
  }) {
    return BrandDimensions(
      spaceXS: spaceXS ?? this.spaceXS,
      spaceS: spaceS ?? this.spaceS,
      spaceM: spaceM ?? this.spaceM,
      spaceL: spaceL ?? this.spaceL,
      radiusS: radiusS ?? this.radiusS,
      radiusM: radiusM ?? this.radiusM,
      radiusL: radiusL ?? this.radiusL,
    );
  }

  /// Linearly interpolates between two [BrandDimensions] instances.
  ///
  /// This ensures that spacing and radius changes animate smoothly
  /// during theme or layout transitions.
  @override
  BrandDimensions lerp(
    covariant ThemeExtension<BrandDimensions>? other,
    double t,
  ) {
    if (other is! BrandDimensions) return this;
    return BrandDimensions(
      spaceXS: lerpDouble(spaceXS, other.spaceXS, t) ?? spaceXS,
      spaceS: lerpDouble(spaceS, other.spaceS, t) ?? spaceS,
      spaceM: lerpDouble(spaceM, other.spaceM, t) ?? spaceM,
      spaceL: lerpDouble(spaceL, other.spaceL, t) ?? spaceL,
      radiusS: lerpDouble(radiusS, other.radiusS, t) ?? radiusS,
      radiusM: lerpDouble(radiusM, other.radiusM, t) ?? radiusM,
      radiusL: lerpDouble(radiusL, other.radiusL, t) ?? radiusL,
    );
  }
}
