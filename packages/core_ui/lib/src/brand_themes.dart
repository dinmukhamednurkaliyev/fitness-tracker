import 'package:core_ui/src/brand_colors.dart';
import 'package:core_ui/src/brand_dimensions.dart';
import 'package:core_ui/src/brand_text_styles.dart';
import 'package:flutter/material.dart';

/// The central coordinator for the Brand Design System's theme configuration.
///
/// [BrandThemes] is responsible for assembling various [ThemeExtension]s
/// (Colors, Typography, Dimensions) into a cohesive [ThemeData] object.
///
/// This class follows the Singleton pattern with a private constructor to
/// provide static access to theme generators, ensuring that theme logic
/// remains encapsulated and consistent across the application.
class BrandThemes {
  /// Private constructor to prevent instantiation.
  const BrandThemes._();

  /// Generates the standard [ThemeData] for Light mode.
  ///
  /// This includes the [BrandColors], [BrandTextStyles], and [BrandDimensions]
  /// configured specifically for light-intensity environments.
  static ThemeData light() {
    final colors = BrandColors.standard();
    final dimensions = BrandDimensions.standard();
    final textStyles = BrandTextStyles.standard();
    return ThemeData(
      brightness: Brightness.light,
      extensions: [
        colors,
        textStyles,
        dimensions,
      ],
    );
  }

  /// Generates the standard [ThemeData] for Dark mode.
  ///
  /// This includes the [BrandColors], [BrandTextStyles], and [BrandDimensions]
  /// extensions. Use this to provide a comfortable viewing experience in
  /// low-light conditions.
  static ThemeData dark() {
    final colors = BrandColors.standard();
    final dimensions = BrandDimensions.standard();
    final textStyles = BrandTextStyles.standard();
    return ThemeData(
      brightness: Brightness.dark,
      extensions: [
        colors,
        textStyles,
        dimensions,
      ],
    );
  }
}

/// A developer-friendly extension on [BuildContext] for efficient theme access.
///
/// This extension implements the "Short-circuit" pattern, allowing developers
/// to access brand tokens without verbose [Theme.of] or extensions calls.
/// It promotes cleaner widget code and improves readability.
///
/// ### Example:
/// ```dart
/// Container(
///   padding: EdgeInsets.all(context.dimension.spaceM),
///   color: context.colors.primary,
///   child: Text('Hello', style: context.text.h1),
/// )
/// ```
extension BrandThemesExtension on BuildContext {
  /// Provides direct access to the [BrandColors] extension.
  ///
  /// Usage: `context.colors.success`
  BrandColors get colors => BrandColors.of(this);

  /// Provides direct access to the [BrandTextStyles] extension.
  ///
  /// Usage: `context.textStyles.h2`
  BrandTextStyles get textStyles => BrandTextStyles.of(this);

  /// Provides direct access to the [BrandDimensions] extension.
  ///
  /// Usage: `context.dimensions.spaceL`
  BrandDimensions get dimensions => BrandDimensions.of(this);
}
