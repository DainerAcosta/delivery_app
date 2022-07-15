import 'package:flutter/material.dart';
import 'package:delivery_app/src/helpers/dependency_injection.dart';
import 'src/my_app.dart';

void main() {
  DependencyInjection.initialize();
  runApp(const MyApp());
}
