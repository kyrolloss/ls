import 'package:flutter/material.dart';

class Themes{
  //lighte theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,

      ),
      datePickerTheme: const DatePickerThemeData(
        backgroundColor: Colors.white,
        cancelButtonStyle: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.black,),
          textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)),

        ),
        confirmButtonStyle: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.black,),
          textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)),
        ),
        dividerColor: Colors.white,

      ),
      timePickerTheme: const TimePickerThemeData(
          backgroundColor: Colors.black,
          cancelButtonStyle: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.black,),
            textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)),



          )
      )
  );

  //dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,

    ),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: Colors.black,
        cancelButtonStyle: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.black,),
          textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)),

        ),
      confirmButtonStyle: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.black,),
        textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)),
      ),
      dividerColor: Colors.white,

    ),
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: Colors.black,
      cancelButtonStyle: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.black,),
        textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)),



      )
    )
  );
}