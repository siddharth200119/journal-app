import 'package:flutter/material.dart';

const List<ColorScheme> lightColorSchemes = [
  // Default: White and Blue
  ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.blueAccent,
    surface: Color(0xFFFDFDFD),
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  // Green and Cream
  ColorScheme.light(
    primary: Colors.green,
    secondary: Colors.greenAccent,
    surface: Color(0xFFF0EFE6),
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  // Purple and Light Gray
  ColorScheme.light(
    primary: Colors.deepPurple,
    secondary: Colors.purpleAccent,
    surface: Color(0xFFF7F7F7),
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
];

const List<ColorScheme> darkColorSchemes = [
  // Dark Blue
  ColorScheme.dark(
    primary: Colors.blue,
    secondary: Colors.blueAccent,
    surface: Color(0xFF0A0A0A),
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onError: Colors.white,
    brightness: Brightness.dark,
  ),
  // Dark Green
  ColorScheme.dark(
    primary: Colors.green,
    secondary: Colors.greenAccent,
    surface: Color(0xFF0A140A),
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.white,
    onError: Colors.white,
    brightness: Brightness.dark,
  ),
  // Dark Purple
  ColorScheme.dark(
    primary: Colors.deepPurple,
    secondary: Colors.purpleAccent,
    surface: Color(0xFF000000),
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onError: Colors.white,
    brightness: Brightness.dark,
  ),
];
