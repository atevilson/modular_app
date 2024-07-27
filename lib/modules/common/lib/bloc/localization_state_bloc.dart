
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';

class LocalizationState extends Equatable {
  final Locale locale;

  const LocalizationState(this.locale);

  @override
  List<Object> get props => [locale];
}
