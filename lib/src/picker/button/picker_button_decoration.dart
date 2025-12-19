// Copyright (c) 2024 Philip Softworks. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';

const CupertinoDynamicColor pickerButtonTextColor = CupertinoColors.label;
const TextStyle pickerButtonTextStyle = TextStyle(
  color: pickerButtonTextColor,
  fontSize: 17.0,
);

const CupertinoDynamicColor pickerButtonBackgroundColor =
    CupertinoColors.tertiarySystemFill;

final BorderRadius pickerBorderRadiusButton = BorderRadius.circular(8.0);

/// A decoration class for the cupertino picker button.
class PickerButtonDecoration {
  /// Creates a cupertino picker button decoration class with default values
  /// for non-provided parameters.
  factory PickerButtonDecoration({
    TextStyle? textStyle,
    Color? backgroundColor,
    BorderRadius? borderRadius,
  }) {
    return PickerButtonDecoration._(
      textStyle: textStyle ?? pickerButtonTextStyle,
      backgroundColor: backgroundColor ?? pickerButtonBackgroundColor,
      borderRadius: borderRadius ?? pickerBorderRadiusButton,
    );
  }

  const PickerButtonDecoration._({
    this.textStyle,
    this.backgroundColor,
    this.borderRadius,
  });

  /// Creates a cupertino picker button decoration class with default values
  /// for non-provided parameters.
  ///
  /// Applies the [CupertinoDynamicColor.resolve] method for colors.
  factory PickerButtonDecoration.withDynamicColor(
    BuildContext context, {
    TextStyle? textStyle,
    CupertinoDynamicColor? backgroundColor,
    BorderRadius? borderRadius,
  }) {
    final TextStyle style = textStyle ?? pickerButtonTextStyle;
    return PickerButtonDecoration(
      textStyle: style.copyWith(
        color: CupertinoDynamicColor.resolve(
          style.color ?? pickerButtonTextColor,
          context,
        ),
      ),
      backgroundColor: CupertinoDynamicColor.resolve(
        backgroundColor ?? pickerButtonBackgroundColor,
        context,
      ),
      borderRadius: borderRadius ?? pickerBorderRadiusButton,
    );
  }

  /// The [TextStyle] of the picker button.
  final TextStyle? textStyle;

  /// The background [Color] of the picker button.
  final Color? backgroundColor;

  /// The [borderRadius] of the picker button.
  final BorderRadius? borderRadius;

  /// Creates a copy of the class with the provided parameters.
  PickerButtonDecoration copyWith({
    TextStyle? textStyle,
    Color? backgroundColor,
    BorderRadius? borderRadius,
  }) {
    return PickerButtonDecoration(
      textStyle: textStyle ?? this.textStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
}
