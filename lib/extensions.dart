import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

extension StringExtensions on String {
  Uri toUri() => Uri.parse(this);
  SnackBar toSnack() => SnackBar(content: Text(this));
}

extension DoubleExtension on int {
  double adjust() => toDouble();
}

extension LaunchUrl on Uri {
  Future<void> launch() => launchUrl(this);
}
