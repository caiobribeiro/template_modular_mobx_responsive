import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template_modular_mobx_responsive/app/util/color_schemes.dart';

part 'app_store.g.dart';

// ignore: library_private_types_in_public_api
class AppStore = _AppStoreBase with _$AppStore;

class MyTheme {
  // * Creating both themmes
  static final ThemeData light = _buildLightTheme();
  static final ThemeData dark = _buildDarkTheme();

  // * Iniatilizing light theme
  static ThemeData _buildLightTheme() {
    final lightBase = ThemeData(
      colorScheme: lightColorScheme,
      brightness: Brightness.light,
      useMaterial3: true,
    );
    return lightBase;
  }

  // * Iniatilizing dark theme
  static ThemeData _buildDarkTheme() {
    final darkBase = ThemeData(
      colorScheme: darkColorScheme,
      brightness: Brightness.dark,
      useMaterial3: true,
    );
    return darkBase;
  }
}

abstract class _AppStoreBase with Store {
  // * Type of my current theme
  @observable
  ThemeData? themeType;

  // * bool of my current theme
  @computed
  bool get isDark => themeType?.brightness == Brightness.dark;

  // * function taht change themes and save in my local storage
  @action
  changeTheme() {
    if (isDark) {
      themeType = MyTheme.light;
    } else {
      themeType = MyTheme.dark;
    }
    saveThemePreferences();
  }

  // * function that saves my chose theme as True or False
  @action
  saveThemePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', isDark);
  }

  // * function that fetche my the chose theme on my local sorage
  @action
  Future loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark') ?? false;
    if (prefs.containsKey('isDark') && isDark) {
      themeType = MyTheme.dark;
    } else {
      themeType = MyTheme.light;
    }
  }
}
