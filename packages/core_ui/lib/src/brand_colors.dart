import 'package:flutter/material.dart';

/// A professional-grade [ThemeExtension] for managing custom brand colors.
///
/// This class extends Flutter's [ThemeData] to provide a centralized location
/// for brand-specific color tokens that fall outside
/// the standard [ColorScheme].
/// It supports smooth linear interpolation for theme transitions
/// and provides a safe, static access method.
///
/// ### Usage:
/// ```dart
/// final brandColors = BrandColors.of(context);
/// return Container(color: brandColors.primary);
/// ```
@immutable
class BrandColors extends ThemeExtension<BrandColors> {
  /// Creates a set of brand-specific colors.
  ///
  /// All parameters must be non-null to ensure consistent rendering during
  /// theme switching and interpolation.
  const BrandColors({
    required this.primary,
    required this.secondary,
    required this.success,
    required this.error,
    required this.warning,
    required this.background,
  });

  /// Standard factory for the application.
  factory BrandColors.standard() {
    return const BrandColors(
      primary: Colors.blue,
      secondary: Colors.white,
      success: Colors.green,
      error: Colors.red,
      warning: Colors.yellow,
      background: Colors.white,
    );
  }

  /// The core accent color of the brand, used for primary actions and
  /// key branding.
  final Color primary;

  /// An auxiliary color used for secondary actions, less prominent UI elements,
  /// or complementary branding.
  final Color secondary;

  /// Semantic color used to indicate successful states, positive outcomes,
  /// or completed processes.
  final Color success;

  /// Semantic color used for cautionary alerts, pending states, or
  /// non-destructive warnings.
  final Color warning;

  /// Semantic color used for destructive actions, error states, and critical
  /// system failures.
  final Color error;

  /// The underlying surface color used as the primary background for
  /// brand-specific layouts.
  final Color background;

  /// A static helper method to retrieve [BrandColors]
  /// from the current [BuildContext].
  ///
  /// Throws an [AssertionError]
  /// if the extension is not found in the widget tree,
  /// ensuring developers are alerted early to configuration issues.
  static BrandColors of(BuildContext context) {
    final colors = Theme.of(context).extension<BrandColors>();
    assert(
      colors != null,
      '''
      BrandColors extension not found in Theme.
      Check your MaterialApp configuration.
      ''',
    );
    return colors!;
  }

  /// Creates a copy of this [BrandColors] but with the given fields replaced
  /// with new values.
  @override
  BrandColors copyWith({
    Color? primary,
    Color? secondary,
    Color? success,
    Color? error,
    Color? warning,
    Color? background,
  }) {
    return BrandColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      success: success ?? this.success,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      background: background ?? this.background,
    );
  }

  /// Linearly interpolates between two [BrandColors] instances.
  ///
  /// This method is invoked by Flutter when the app theme changes
  /// (e.g., toggling Dark Mode), providing a smooth visual transition
  /// for all brand colors.
  @override
  BrandColors lerp(covariant BrandColors? other, double t) {
    if (other is! BrandColors) return this;

    return BrandColors(
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      success: Color.lerp(success, other.success, t) ?? success,
      error: Color.lerp(error, other.error, t) ?? error,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      background: Color.lerp(background, other.background, t) ?? background,
    );
  }
}
