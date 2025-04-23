import 'package:get/get_utils/get_utils.dart';

extension StringExtension on String {
  String get capitalizeWords {
    final words = split(' ');
    return words
        .reduce((value, word) => '${value.capitalizeFirst} ${word.capitalize}')
        .trim();
  }

  String get removeFirstZero {
    final regexp = RegExp('^0+(?=.)');
    return replaceAll(regexp, '');
  }

  String checkNullString([String defaultValue = '']) {
    return this == 'null' ? defaultValue : this;
  }
}
