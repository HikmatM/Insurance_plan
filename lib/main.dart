import 'package:flutter/material.dart';
import 'package:insurance_plan/app.dart';
import 'package:insurance_plan/di/get_it.dart';

void main() {
  configureDependencies();
  runApp(const App());
}
