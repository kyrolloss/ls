// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hey,`
  String get home_Hey {
    return Intl.message(
      'Hey,',
      name: 'home_Hey',
      desc: '',
      args: [],
    );
  }

  /// `Today's Plan`
  String get home_Today_Plan {
    return Intl.message(
      'Today\'s Plan',
      name: 'home_Today_Plan',
      desc: '',
      args: [],
    );
  }

  /// `Discover`
  String get home_Discover {
    return Intl.message(
      'Discover',
      name: 'home_Discover',
      desc: '',
      args: [],
    );
  }

  /// `See more`
  String get home_See_more {
    return Intl.message(
      'See more',
      name: 'home_See_more',
      desc: '',
      args: [],
    );
  }

  /// `Find`
  String get home_Find {
    return Intl.message(
      'Find',
      name: 'home_Find',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'home_your Workout' key

  /// `Vitamins`
  String get home_Vitamins {
    return Intl.message(
      'Vitamins',
      name: 'home_Vitamins',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'home_Food Calculator' key

  /// `Nutrition`
  String get home_Nutrition {
    return Intl.message(
      'Nutrition',
      name: 'home_Nutrition',
      desc: '',
      args: [],
    );
  }

  /// `Your`
  String get home_Your {
    return Intl.message(
      'Your',
      name: 'home_Your',
      desc: '',
      args: [],
    );
  }

  /// `Progress`
  String get home_Progress {
    return Intl.message(
      'Progress',
      name: 'home_Progress',
      desc: '',
      args: [],
    );
  }

  /// `Vitamin`
  String get Vitamin {
    return Intl.message(
      'Vitamin',
      name: 'Vitamin',
      desc: '',
      args: [],
    );
  }

  /// `Vitamins & Supplements`
  String get Vitamin_And_Supplements {
    return Intl.message(
      'Vitamins & Supplements',
      name: 'Vitamin_And_Supplements',
      desc: '',
      args: [],
    );
  }

  /// `Supplements`
  String get Supplements {
    return Intl.message(
      'Supplements',
      name: 'Supplements',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get Vitamin_Details_About {
    return Intl.message(
      'About',
      name: 'Vitamin_Details_About',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Vitamin A' key

  // skipped getter for the 'Vitamin B' key

  // skipped getter for the 'Vitamin C' key

  // skipped getter for the 'Vitamin D' key

  // skipped getter for the 'Vitamin E' key

  // skipped getter for the 'Vitamin K' key

  // skipped getter for the 'Omega 3' key

  /// `carrots , sweet potatoes, and spinach`
  String get location1 {
    return Intl.message(
      'carrots , sweet potatoes, and spinach',
      name: 'location1',
      desc: '',
      args: [],
    );
  }

  /// `meat , eggs , dairy products , and whole grains`
  String get location2 {
    return Intl.message(
      'meat , eggs , dairy products , and whole grains',
      name: 'location2',
      desc: '',
      args: [],
    );
  }

  /// `citrus fruits , strawberries , and oranges`
  String get location3 {
    return Intl.message(
      'citrus fruits , strawberries , and oranges',
      name: 'location3',
      desc: '',
      args: [],
    );
  }

  /// `sunlight , fatty fish , and dairy products`
  String get location4 {
    return Intl.message(
      'sunlight , fatty fish , and dairy products',
      name: 'location4',
      desc: '',
      args: [],
    );
  }

  /// `nuts , seeds , and vegetable oils`
  String get location5 {
    return Intl.message(
      'nuts , seeds , and vegetable oils',
      name: 'location5',
      desc: '',
      args: [],
    );
  }

  /// `fatty fish like salmon and tuna , and walnuts`
  String get location6 {
    return Intl.message(
      'fatty fish like salmon and tuna , and walnuts',
      name: 'location6',
      desc: '',
      args: [],
    );
  }

  /// `Helps maintain eye health and strengthens immunity`
  String get benefits1 {
    return Intl.message(
      'Helps maintain eye health and strengthens immunity',
      name: 'benefits1',
      desc: '',
      args: [],
    );
  }

  /// `Supports energy production and nervous system health`
  String get benefits2 {
    return Intl.message(
      'Supports energy production and nervous system health',
      name: 'benefits2',
      desc: '',
      args: [],
    );
  }

  /// `Boosts immunity and maintains skin health`
  String get benefits3 {
    return Intl.message(
      'Boosts immunity and maintains skin health',
      name: 'benefits3',
      desc: '',
      args: [],
    );
  }

  /// `Supports bone health and calcium absorption`
  String get benefits4 {
    return Intl.message(
      'Supports bone health and calcium absorption',
      name: 'benefits4',
      desc: '',
      args: [],
    );
  }

  /// `Protects cells from damage as an antioxidant`
  String get benefits5 {
    return Intl.message(
      'Protects cells from damage as an antioxidant',
      name: 'benefits5',
      desc: '',
      args: [],
    );
  }

  /// `Supports blood clotting and bone health`
  String get benefits6 {
    return Intl.message(
      'Supports blood clotting and bone health',
      name: 'benefits6',
      desc: '',
      args: [],
    );
  }

  /// `Promotes heart health and reduces inflammation`
  String get benefits7 {
    return Intl.message(
      'Promotes heart health and reduces inflammation',
      name: 'benefits7',
      desc: '',
      args: [],
    );
  }

  /// `700-900 mcg`
  String get dailyAmount1 {
    return Intl.message(
      '700-900 mcg',
      name: 'dailyAmount1',
      desc: '',
      args: [],
    );
  }

  /// `1 to 3 mg`
  String get dailyAmount2 {
    return Intl.message(
      '1 to 3 mg',
      name: 'dailyAmount2',
      desc: '',
      args: [],
    );
  }

  /// `75-90 mg`
  String get dailyAmount3 {
    return Intl.message(
      '75-90 mg',
      name: 'dailyAmount3',
      desc: '',
      args: [],
    );
  }

  /// `600-800 IU`
  String get dailyAmount4 {
    return Intl.message(
      '600-800 IU',
      name: 'dailyAmount4',
      desc: '',
      args: [],
    );
  }

  /// `15 mg`
  String get dailyAmount5 {
    return Intl.message(
      '15 mg',
      name: 'dailyAmount5',
      desc: '',
      args: [],
    );
  }

  /// `90-120 mcg`
  String get dailyAmount6 {
    return Intl.message(
      '90-120 mcg',
      name: 'dailyAmount6',
      desc: '',
      args: [],
    );
  }

  /// `90-120 mcg`
  String get dailyAmount7 {
    return Intl.message(
      '90-120 mcg',
      name: 'dailyAmount7',
      desc: '',
      args: [],
    );
  }

  /// `Progress`
  String get Progress {
    return Intl.message(
      'Progress',
      name: 'Progress',
      desc: '',
      args: [],
    );
  }

  /// `Add Your Image Here`
  String get Nutrition_Add_Image {
    return Intl.message(
      'Add Your Image Here',
      name: 'Nutrition_Add_Image',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get Settings_My_Profile {
    return Intl.message(
      'My Profile',
      name: 'Settings_My_Profile',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get Settings_Log_Out {
    return Intl.message(
      'Log Out',
      name: 'Settings_Log_Out',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get Settings_Change_Password {
    return Intl.message(
      'Change Password',
      name: 'Settings_Change_Password',
      desc: '',
      args: [],
    );
  }

  /// `Sounds`
  String get Settings_Sounds {
    return Intl.message(
      'Sounds',
      name: 'Settings_Sounds',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Settings_Language {
    return Intl.message(
      'Language',
      name: 'Settings_Language',
      desc: '',
      args: [],
    );
  }

  /// `Steps Counter`
  String get Settings_Steps_Counter {
    return Intl.message(
      'Steps Counter',
      name: 'Settings_Steps_Counter',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get Settings_Edit_Profile {
    return Intl.message(
      'Edit Profile',
      name: 'Settings_Edit_Profile',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get Settings_Edit {
    return Intl.message(
      'Edit',
      name: 'Settings_Edit',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get Settings_Change {
    return Intl.message(
      'Change',
      name: 'Settings_Change',
      desc: '',
      args: [],
    );
  }

  /// `Steps Counter`
  String get Steps_Counter {
    return Intl.message(
      'Steps Counter',
      name: 'Steps_Counter',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get Steps_Counter_Error {
    return Intl.message(
      'Error',
      name: 'Steps_Counter_Error',
      desc: '',
      args: [],
    );
  }

  /// `Step`
  String get Steps_Counter_Steps {
    return Intl.message(
      'Step',
      name: 'Steps_Counter_Steps',
      desc: '',
      args: [],
    );
  }

  /// `Target : `
  String get Steps_Counter_Target {
    return Intl.message(
      'Target : ',
      name: 'Steps_Counter_Target',
      desc: '',
      args: [],
    );
  }

  /// `Add Target Steps`
  String get Steps_Counter_Set_Target {
    return Intl.message(
      'Add Target Steps',
      name: 'Steps_Counter_Set_Target',
      desc: '',
      args: [],
    );
  }

  /// `Set`
  String get Steps_Counter_Set {
    return Intl.message(
      'Set',
      name: 'Steps_Counter_Set',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get Profile {
    return Intl.message(
      'Phone',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Profile_Email {
    return Intl.message(
      'Email',
      name: 'Profile_Email',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get Profile_Gender {
    return Intl.message(
      'Gender',
      name: 'Profile_Gender',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get Profile_Age {
    return Intl.message(
      'Age',
      name: 'Profile_Age',
      desc: '',
      args: [],
    );
  }

  /// `Length`
  String get Profile_Length {
    return Intl.message(
      'Length',
      name: 'Profile_Length',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get Profile_Weight {
    return Intl.message(
      'Weight',
      name: 'Profile_Weight',
      desc: '',
      args: [],
    );
  }

  /// `Target Weight`
  String get Profile_Target_Weight {
    return Intl.message(
      'Target Weight',
      name: 'Profile_Target_Weight',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get Profile_Edit {
    return Intl.message(
      'Edit',
      name: 'Profile_Edit',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Profile_Logout {
    return Intl.message(
      'Logout',
      name: 'Profile_Logout',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get Change_Password {
    return Intl.message(
      'Change Password',
      name: 'Change_Password',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get Change_Password_Old {
    return Intl.message(
      'Old Password',
      name: 'Change_Password_Old',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get Change_Password_New {
    return Intl.message(
      'New Password',
      name: 'Change_Password_New',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get Change_Password_Confirm {
    return Intl.message(
      'Confirm Password',
      name: 'Change_Password_Confirm',
      desc: '',
      args: [],
    );
  }

  /// `Old Password Incorrect`
  String get Change_Password_Error {
    return Intl.message(
      'Old Password Incorrect',
      name: 'Change_Password_Error',
      desc: '',
      args: [],
    );
  }

  /// `Change Password Successfully`
  String get Change_Password_Success {
    return Intl.message(
      'Change Password Successfully',
      name: 'Change_Password_Success',
      desc: '',
      args: [],
    );
  }

  /// `Update Successful`
  String get Change_Password_Success_Message {
    return Intl.message(
      'Update Successful',
      name: 'Change_Password_Success_Message',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get Change_Password_Required {
    return Intl.message(
      'Required',
      name: 'Change_Password_Required',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get Change_Password_Submit {
    return Intl.message(
      'Submit',
      name: 'Change_Password_Submit',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get Edit_Profile {
    return Intl.message(
      'Edit Profile',
      name: 'Edit_Profile',
      desc: '',
      args: [],
    );
  }

  /// `Change Photo Profile`
  String get Edit_Profile_Photo {
    return Intl.message(
      'Change Photo Profile',
      name: 'Edit_Profile_Photo',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get Edit_Profile_Username {
    return Intl.message(
      'Username',
      name: 'Edit_Profile_Username',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get Edit_Profile_Phone {
    return Intl.message(
      'Phone',
      name: 'Edit_Profile_Phone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Edit_Profile_Email {
    return Intl.message(
      'Email',
      name: 'Edit_Profile_Email',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get Edit_Profile_Gender {
    return Intl.message(
      'Gender',
      name: 'Edit_Profile_Gender',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get Edit_Profile_Age {
    return Intl.message(
      'Age',
      name: 'Edit_Profile_Age',
      desc: '',
      args: [],
    );
  }

  /// `Length`
  String get Edit_Profile_Length {
    return Intl.message(
      'Length',
      name: 'Edit_Profile_Length',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get Edit_Profile_Weight {
    return Intl.message(
      'Weight',
      name: 'Edit_Profile_Weight',
      desc: '',
      args: [],
    );
  }

  /// `Target Weight`
  String get Edit_Profile_Target_Weight {
    return Intl.message(
      'Target Weight',
      name: 'Edit_Profile_Target_Weight',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get Edit_Profile_Edit {
    return Intl.message(
      'Edit',
      name: 'Edit_Profile_Edit',
      desc: '',
      args: [],
    );
  }

  /// `Save Profile`
  String get Edit_Profile_Save_Profile {
    return Intl.message(
      'Save Profile',
      name: 'Edit_Profile_Save_Profile',
      desc: '',
      args: [],
    );
  }

  /// `Sounds`
  String get Sounds {
    return Intl.message(
      'Sounds',
      name: 'Sounds',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get Change {
    return Intl.message(
      'Change',
      name: 'Change',
      desc: '',
      args: [],
    );
  }

  /// `Warmup`
  String get Person_Warmup {
    return Intl.message(
      'Warmup',
      name: 'Person_Warmup',
      desc: '',
      args: [],
    );
  }

  /// `Neck`
  String get Person_Neck {
    return Intl.message(
      'Neck',
      name: 'Person_Neck',
      desc: '',
      args: [],
    );
  }

  /// `Chest`
  String get Person_Chest {
    return Intl.message(
      'Chest',
      name: 'Person_Chest',
      desc: '',
      args: [],
    );
  }

  /// `Triceps`
  String get Person_Triceps {
    return Intl.message(
      'Triceps',
      name: 'Person_Triceps',
      desc: '',
      args: [],
    );
  }

  /// `Biceps`
  String get Person_Biceps {
    return Intl.message(
      'Biceps',
      name: 'Person_Biceps',
      desc: '',
      args: [],
    );
  }

  /// `Cardio`
  String get Person_Cardio {
    return Intl.message(
      'Cardio',
      name: 'Person_Cardio',
      desc: '',
      args: [],
    );
  }

  /// `Calves`
  String get Person_Calves {
    return Intl.message(
      'Calves',
      name: 'Person_Calves',
      desc: '',
      args: [],
    );
  }

  /// `Legs`
  String get Person_Legs {
    return Intl.message(
      'Legs',
      name: 'Person_Legs',
      desc: '',
      args: [],
    );
  }

  /// `Traps`
  String get Person_Traps {
    return Intl.message(
      'Traps',
      name: 'Person_Traps',
      desc: '',
      args: [],
    );
  }

  /// `Forearms`
  String get Person_Forearms {
    return Intl.message(
      'Forearms',
      name: 'Person_Forearms',
      desc: '',
      args: [],
    );
  }

  /// `Lats`
  String get Person_Lats {
    return Intl.message(
      'Lats',
      name: 'Person_Lats',
      desc: '',
      args: [],
    );
  }

  /// `Abs`
  String get Person_Abs {
    return Intl.message(
      'Abs',
      name: 'Person_Abs',
      desc: '',
      args: [],
    );
  }

  /// `Lower Back`
  String get Person_LowerBack {
    return Intl.message(
      'Lower Back',
      name: 'Person_LowerBack',
      desc: '',
      args: [],
    );
  }

  /// `Shoulder`
  String get Person_Shoulder {
    return Intl.message(
      'Shoulder',
      name: 'Person_Shoulder',
      desc: '',
      args: [],
    );
  }

  /// `Hamstrings`
  String get Person_Hamstrings {
    return Intl.message(
      'Hamstrings',
      name: 'Person_Hamstrings',
      desc: '',
      args: [],
    );
  }

  /// `Glutes`
  String get Person_Glutes {
    return Intl.message(
      'Glutes',
      name: 'Person_Glutes',
      desc: '',
      args: [],
    );
  }

  /// `Quads`
  String get Person_Quads {
    return Intl.message(
      'Quads',
      name: 'Person_Quads',
      desc: '',
      args: [],
    );
  }

  /// `Adductors`
  String get Person_Adductors {
    return Intl.message(
      'Adductors',
      name: 'Person_Adductors',
      desc: '',
      args: [],
    );
  }

  /// `Flip`
  String get Person_Flip {
    return Intl.message(
      'Flip',
      name: 'Person_Flip',
      desc: '',
      args: [],
    );
  }

  /// `Goals`
  String get Goals {
    return Intl.message(
      'Goals',
      name: 'Goals',
      desc: '',
      args: [],
    );
  }

  /// `Body Data`
  String get AgeSelection_Body_Data {
    return Intl.message(
      'Body Data',
      name: 'AgeSelection_Body_Data',
      desc: '',
      args: [],
    );
  }

  /// `Your age`
  String get AgeSelection_Age {
    return Intl.message(
      'Your age',
      name: 'AgeSelection_Age',
      desc: '',
      args: [],
    );
  }

  /// `years old`
  String get AgeSelection_Years_Old {
    return Intl.message(
      'years old',
      name: 'AgeSelection_Years_Old',
      desc: '',
      args: [],
    );
  }

  /// `Age information helps us more accurately\nassess your metabolic level`
  String get AgeSelection_Age_Information {
    return Intl.message(
      'Age information helps us more accurately\nassess your metabolic level',
      name: 'AgeSelection_Age_Information',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `Your Estimated Body Fat: <15% \nYou need to increase your nutrient intake and maintain muscle mass through exercise`
  String get CurrentBody1 {
    return Intl.message(
      'Your Estimated Body Fat: <15% \nYou need to increase your nutrient intake and maintain muscle mass through exercise',
      name: 'CurrentBody1',
      desc: '',
      args: [],
    );
  }

  /// `Your Estimated Body Fat: 15-20%\nYou are at a normal body fat level! Try the personalized plan for you to keep your body active`
  String get CurrentBody2 {
    return Intl.message(
      'Your Estimated Body Fat: 15-20%\nYou are at a normal body fat level! Try the personalized plan for you to keep your body active',
      name: 'CurrentBody2',
      desc: '',
      args: [],
    );
  }

  /// `Your Estimated Body Fat: 21-30%\nYour body fat percentage is slightly higher and you need to exercise properly to get back to a healthy level`
  String get CurrentBody3 {
    return Intl.message(
      'Your Estimated Body Fat: 21-30%\nYour body fat percentage is slightly higher and you need to exercise properly to get back to a healthy level',
      name: 'CurrentBody3',
      desc: '',
      args: [],
    );
  }

  /// `Your Estimated Body Fat: 31-40%\nThe current body fate rate is a bit high so lets start exercising to burn fat`
  String get CurrentBody4 {
    return Intl.message(
      'Your Estimated Body Fat: 31-40%\nThe current body fate rate is a bit high so lets start exercising to burn fat',
      name: 'CurrentBody4',
      desc: '',
      args: [],
    );
  }

  /// `Your Estimated Body Fat: >40%\nHigh body fat percentage may lead to health problems.Focus on fitness and diet!`
  String get CurrentBody5 {
    return Intl.message(
      'Your Estimated Body Fat: >40%\nHigh body fat percentage may lead to health problems.Focus on fitness and diet!',
      name: 'CurrentBody5',
      desc: '',
      args: [],
    );
  }

  /// `Body Data`
  String get CurrentBody_Body_Data {
    return Intl.message(
      'Body Data',
      name: 'CurrentBody_Body_Data',
      desc: '',
      args: [],
    );
  }

  /// `What’s your current body shape`
  String get CurrentBody_Shape {
    return Intl.message(
      'What’s your current body shape',
      name: 'CurrentBody_Shape',
      desc: '',
      args: [],
    );
  }

  /// `Do you follow any of \n  these diets`
  String get Diets_Question {
    return Intl.message(
      'Do you follow any of \n  these diets',
      name: 'Diets_Question',
      desc: '',
      args: [],
    );
  }

  /// `No Dietary Restrictions`
  String get Diets_Restrictions {
    return Intl.message(
      'No Dietary Restrictions',
      name: 'Diets_Restrictions',
      desc: '',
      args: [],
    );
  }

  /// `Vegetation`
  String get Diets_Vegetation {
    return Intl.message(
      'Vegetation',
      name: 'Diets_Vegetation',
      desc: '',
      args: [],
    );
  }

  /// `Vegan`
  String get Diets_Vegan {
    return Intl.message(
      'Vegan',
      name: 'Diets_Vegan',
      desc: '',
      args: [],
    );
  }

  /// `Keto`
  String get Diets_Keto {
    return Intl.message(
      'Keto',
      name: 'Diets_Keto',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get Diets_Other {
    return Intl.message(
      'Other',
      name: 'Diets_Other',
      desc: '',
      args: [],
    );
  }

  /// `thanks for your time`
  String get End {
    return Intl.message(
      'thanks for your time',
      name: 'End',
      desc: '',
      args: [],
    );
  }

  /// `Do you experience any of \n    the following issues`
  String get Experience_Question {
    return Intl.message(
      'Do you experience any of \n    the following issues',
      name: 'Experience_Question',
      desc: '',
      args: [],
    );
  }

  /// `Prolonged sitting`
  String get Experience_Prolonged {
    return Intl.message(
      'Prolonged sitting',
      name: 'Experience_Prolonged',
      desc: '',
      args: [],
    );
  }

  /// `Poor Sleep Quality`
  String get Experience_Poor_Sleep_Quality {
    return Intl.message(
      'Poor Sleep Quality',
      name: 'Experience_Poor_Sleep_Quality',
      desc: '',
      args: [],
    );
  }

  /// `Dietary issues`
  String get Experience_Dietary_issues {
    return Intl.message(
      'Dietary issues',
      name: 'Experience_Dietary_issues',
      desc: '',
      args: [],
    );
  }

  /// `None, Iam healthy! `
  String get Experience_None_Iam_healthy {
    return Intl.message(
      'None, Iam healthy! ',
      name: 'Experience_None_Iam_healthy',
      desc: '',
      args: [],
    );
  }

  /// `What’s your main goal?`
  String get Main_Goal {
    return Intl.message(
      'What’s your main goal?',
      name: 'Main_Goal',
      desc: '',
      args: [],
    );
  }

  /// `We’ll tailor the best blend of strength and cardio training to align with your goal?`
  String get Goal_Best_Strategy {
    return Intl.message(
      'We’ll tailor the best blend of strength and cardio training to align with your goal?',
      name: 'Goal_Best_Strategy',
      desc: '',
      args: [],
    );
  }

  /// `Reduce fat percentage`
  String get Goal_Lose_Weight {
    return Intl.message(
      'Reduce fat percentage',
      name: 'Goal_Lose_Weight',
      desc: '',
      args: [],
    );
  }

  /// `Increase muscle mass`
  String get Goal_Build_Muscle {
    return Intl.message(
      'Increase muscle mass',
      name: 'Goal_Build_Muscle',
      desc: '',
      args: [],
    );
  }

  /// `Get the perfect body`
  String get Goal_Keep_Fit {
    return Intl.message(
      'Get the perfect body',
      name: 'Goal_Keep_Fit',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Are_you_allergic_to_those-substances' key

  /// `Fish`
  String get Fish {
    return Intl.message(
      'Fish',
      name: 'Fish',
      desc: '',
      args: [],
    );
  }

  /// `Legumes`
  String get Legumes {
    return Intl.message(
      'Legumes',
      name: 'Legumes',
      desc: '',
      args: [],
    );
  }

  /// `Egg`
  String get Egg {
    return Intl.message(
      'Egg',
      name: 'Egg',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get Other {
    return Intl.message(
      'Other',
      name: 'Other',
      desc: '',
      args: [],
    );
  }

  /// `What fitness equipment can you use?`
  String get what_fitness_equipment {
    return Intl.message(
      'What fitness equipment can you use?',
      name: 'what_fitness_equipment',
      desc: '',
      args: [],
    );
  }

  /// `No equipment`
  String get no_equipment {
    return Intl.message(
      'No equipment',
      name: 'no_equipment',
      desc: '',
      args: [],
    );
  }

  /// `Portable equipment`
  String get portable_equipment {
    return Intl.message(
      'Portable equipment',
      name: 'portable_equipment',
      desc: '',
      args: [],
    );
  }

  /// `Gym equipment`
  String get gym_equipment {
    return Intl.message(
      'Gym equipment',
      name: 'gym_equipment',
      desc: '',
      args: [],
    );
  }

  /// `What is your gender?`
  String get what_is_your_gender {
    return Intl.message(
      'What is your gender?',
      name: 'what_is_your_gender',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Afghan`
  String get afghan {
    return Intl.message(
      'Afghan',
      name: 'afghan',
      desc: '',
      args: [],
    );
  }

  /// `Albanian`
  String get albanian {
    return Intl.message(
      'Albanian',
      name: 'albanian',
      desc: '',
      args: [],
    );
  }

  /// `Algerian`
  String get algerian {
    return Intl.message(
      'Algerian',
      name: 'algerian',
      desc: '',
      args: [],
    );
  }

  /// `American`
  String get american {
    return Intl.message(
      'American',
      name: 'american',
      desc: '',
      args: [],
    );
  }

  /// `Andorran`
  String get andorran {
    return Intl.message(
      'Andorran',
      name: 'andorran',
      desc: '',
      args: [],
    );
  }

  /// `Angolan`
  String get angolan {
    return Intl.message(
      'Angolan',
      name: 'angolan',
      desc: '',
      args: [],
    );
  }

  /// `Antiguan`
  String get antiguan {
    return Intl.message(
      'Antiguan',
      name: 'antiguan',
      desc: '',
      args: [],
    );
  }

  /// `Argentine`
  String get argentine {
    return Intl.message(
      'Argentine',
      name: 'argentine',
      desc: '',
      args: [],
    );
  }

  /// `Armenian`
  String get armenian {
    return Intl.message(
      'Armenian',
      name: 'armenian',
      desc: '',
      args: [],
    );
  }

  /// `Australian`
  String get australian {
    return Intl.message(
      'Australian',
      name: 'australian',
      desc: '',
      args: [],
    );
  }

  /// `Austrian`
  String get austrian {
    return Intl.message(
      'Austrian',
      name: 'austrian',
      desc: '',
      args: [],
    );
  }

  /// `Azerbaijani`
  String get azerbaijani {
    return Intl.message(
      'Azerbaijani',
      name: 'azerbaijani',
      desc: '',
      args: [],
    );
  }

  /// `Bahamian`
  String get bahamian {
    return Intl.message(
      'Bahamian',
      name: 'bahamian',
      desc: '',
      args: [],
    );
  }

  /// `Bahraini`
  String get bahraini {
    return Intl.message(
      'Bahraini',
      name: 'bahraini',
      desc: '',
      args: [],
    );
  }

  /// `Bangladeshi`
  String get bangladeshi {
    return Intl.message(
      'Bangladeshi',
      name: 'bangladeshi',
      desc: '',
      args: [],
    );
  }

  /// `Barbadian`
  String get barbadian {
    return Intl.message(
      'Barbadian',
      name: 'barbadian',
      desc: '',
      args: [],
    );
  }

  /// `Belarusian`
  String get belarusian {
    return Intl.message(
      'Belarusian',
      name: 'belarusian',
      desc: '',
      args: [],
    );
  }

  /// `Belgian`
  String get belgian {
    return Intl.message(
      'Belgian',
      name: 'belgian',
      desc: '',
      args: [],
    );
  }

  /// `Belizean`
  String get belizean {
    return Intl.message(
      'Belizean',
      name: 'belizean',
      desc: '',
      args: [],
    );
  }

  /// `Beninese`
  String get beninese {
    return Intl.message(
      'Beninese',
      name: 'beninese',
      desc: '',
      args: [],
    );
  }

  /// `Bhutanese`
  String get bhutanese {
    return Intl.message(
      'Bhutanese',
      name: 'bhutanese',
      desc: '',
      args: [],
    );
  }

  /// `Bolivian`
  String get bolivian {
    return Intl.message(
      'Bolivian',
      name: 'bolivian',
      desc: '',
      args: [],
    );
  }

  /// `Bosnian`
  String get bosnian {
    return Intl.message(
      'Bosnian',
      name: 'bosnian',
      desc: '',
      args: [],
    );
  }

  /// `Brazilian`
  String get brazilian {
    return Intl.message(
      'Brazilian',
      name: 'brazilian',
      desc: '',
      args: [],
    );
  }

  /// `British`
  String get british {
    return Intl.message(
      'British',
      name: 'british',
      desc: '',
      args: [],
    );
  }

  /// `Bruneian`
  String get bruneian {
    return Intl.message(
      'Bruneian',
      name: 'bruneian',
      desc: '',
      args: [],
    );
  }

  /// `Bulgarian`
  String get bulgarian {
    return Intl.message(
      'Bulgarian',
      name: 'bulgarian',
      desc: '',
      args: [],
    );
  }

  /// `Burkinabe`
  String get burkinabe {
    return Intl.message(
      'Burkinabe',
      name: 'burkinabe',
      desc: '',
      args: [],
    );
  }

  /// `Burmese`
  String get burmese {
    return Intl.message(
      'Burmese',
      name: 'burmese',
      desc: '',
      args: [],
    );
  }

  /// `Burundian`
  String get burundian {
    return Intl.message(
      'Burundian',
      name: 'burundian',
      desc: '',
      args: [],
    );
  }

  /// `Cambodian`
  String get cambodian {
    return Intl.message(
      'Cambodian',
      name: 'cambodian',
      desc: '',
      args: [],
    );
  }

  /// `Cameroonian`
  String get cameroonian {
    return Intl.message(
      'Cameroonian',
      name: 'cameroonian',
      desc: '',
      args: [],
    );
  }

  /// `Canadian`
  String get canadian {
    return Intl.message(
      'Canadian',
      name: 'canadian',
      desc: '',
      args: [],
    );
  }

  /// `Cape Verdean`
  String get cape_verdean {
    return Intl.message(
      'Cape Verdean',
      name: 'cape_verdean',
      desc: '',
      args: [],
    );
  }

  /// `Central African`
  String get central_african {
    return Intl.message(
      'Central African',
      name: 'central_african',
      desc: '',
      args: [],
    );
  }

  /// `Chadian`
  String get chadian {
    return Intl.message(
      'Chadian',
      name: 'chadian',
      desc: '',
      args: [],
    );
  }

  /// `Chilean`
  String get chilean {
    return Intl.message(
      'Chilean',
      name: 'chilean',
      desc: '',
      args: [],
    );
  }

  /// `Chinese`
  String get chinese {
    return Intl.message(
      'Chinese',
      name: 'chinese',
      desc: '',
      args: [],
    );
  }

  /// `Colombian`
  String get colombian {
    return Intl.message(
      'Colombian',
      name: 'colombian',
      desc: '',
      args: [],
    );
  }

  /// `Comoran`
  String get comoran {
    return Intl.message(
      'Comoran',
      name: 'comoran',
      desc: '',
      args: [],
    );
  }

  /// `Congolese`
  String get congolese {
    return Intl.message(
      'Congolese',
      name: 'congolese',
      desc: '',
      args: [],
    );
  }

  /// `Costa Rican`
  String get costa_rican {
    return Intl.message(
      'Costa Rican',
      name: 'costa_rican',
      desc: '',
      args: [],
    );
  }

  /// `Croatian`
  String get croatian {
    return Intl.message(
      'Croatian',
      name: 'croatian',
      desc: '',
      args: [],
    );
  }

  /// `Cuban`
  String get cuban {
    return Intl.message(
      'Cuban',
      name: 'cuban',
      desc: '',
      args: [],
    );
  }

  /// `Cypriot`
  String get cypriot {
    return Intl.message(
      'Cypriot',
      name: 'cypriot',
      desc: '',
      args: [],
    );
  }

  /// `Czech`
  String get czech {
    return Intl.message(
      'Czech',
      name: 'czech',
      desc: '',
      args: [],
    );
  }

  /// `Danish`
  String get danish {
    return Intl.message(
      'Danish',
      name: 'danish',
      desc: '',
      args: [],
    );
  }

  /// `Djiboutian`
  String get djiboutian {
    return Intl.message(
      'Djiboutian',
      name: 'djiboutian',
      desc: '',
      args: [],
    );
  }

  /// `Dominican`
  String get dominican {
    return Intl.message(
      'Dominican',
      name: 'dominican',
      desc: '',
      args: [],
    );
  }

  /// `Dutch`
  String get dutch {
    return Intl.message(
      'Dutch',
      name: 'dutch',
      desc: '',
      args: [],
    );
  }

  /// `East Timorese`
  String get east_timorese {
    return Intl.message(
      'East Timorese',
      name: 'east_timorese',
      desc: '',
      args: [],
    );
  }

  /// `Ecuadorian`
  String get ecuadorian {
    return Intl.message(
      'Ecuadorian',
      name: 'ecuadorian',
      desc: '',
      args: [],
    );
  }

  /// `Egyptian`
  String get egyptian {
    return Intl.message(
      'Egyptian',
      name: 'egyptian',
      desc: '',
      args: [],
    );
  }

  /// `Emirati`
  String get emirati {
    return Intl.message(
      'Emirati',
      name: 'emirati',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Equatorial Guinean`
  String get equatorial_guinean {
    return Intl.message(
      'Equatorial Guinean',
      name: 'equatorial_guinean',
      desc: '',
      args: [],
    );
  }

  /// `Eritrean`
  String get eritrean {
    return Intl.message(
      'Eritrean',
      name: 'eritrean',
      desc: '',
      args: [],
    );
  }

  /// `Estonian`
  String get estonian {
    return Intl.message(
      'Estonian',
      name: 'estonian',
      desc: '',
      args: [],
    );
  }

  /// `Ethiopian`
  String get ethiopian {
    return Intl.message(
      'Ethiopian',
      name: 'ethiopian',
      desc: '',
      args: [],
    );
  }

  /// `Fijian`
  String get fijian {
    return Intl.message(
      'Fijian',
      name: 'fijian',
      desc: '',
      args: [],
    );
  }

  /// `Filipino`
  String get filipino {
    return Intl.message(
      'Filipino',
      name: 'filipino',
      desc: '',
      args: [],
    );
  }

  /// `Finnish`
  String get finnish {
    return Intl.message(
      'Finnish',
      name: 'finnish',
      desc: '',
      args: [],
    );
  }

  /// `French`
  String get french {
    return Intl.message(
      'French',
      name: 'french',
      desc: '',
      args: [],
    );
  }

  /// `Gabonese`
  String get gabonese {
    return Intl.message(
      'Gabonese',
      name: 'gabonese',
      desc: '',
      args: [],
    );
  }

  /// `Gambian`
  String get gambian {
    return Intl.message(
      'Gambian',
      name: 'gambian',
      desc: '',
      args: [],
    );
  }

  /// `Georgian`
  String get georgian {
    return Intl.message(
      'Georgian',
      name: 'georgian',
      desc: '',
      args: [],
    );
  }

  /// `German`
  String get german {
    return Intl.message(
      'German',
      name: 'german',
      desc: '',
      args: [],
    );
  }

  /// `Ghanaian`
  String get ghanaian {
    return Intl.message(
      'Ghanaian',
      name: 'ghanaian',
      desc: '',
      args: [],
    );
  }

  /// `Greek`
  String get greek {
    return Intl.message(
      'Greek',
      name: 'greek',
      desc: '',
      args: [],
    );
  }

  /// `Grenadian`
  String get grenadian {
    return Intl.message(
      'Grenadian',
      name: 'grenadian',
      desc: '',
      args: [],
    );
  }

  /// `Guatemalan`
  String get guatemalan {
    return Intl.message(
      'Guatemalan',
      name: 'guatemalan',
      desc: '',
      args: [],
    );
  }

  /// `Guinean`
  String get guinean {
    return Intl.message(
      'Guinean',
      name: 'guinean',
      desc: '',
      args: [],
    );
  }

  /// `Guyanese`
  String get guyanese {
    return Intl.message(
      'Guyanese',
      name: 'guyanese',
      desc: '',
      args: [],
    );
  }

  /// `Haitian`
  String get haitian {
    return Intl.message(
      'Haitian',
      name: 'haitian',
      desc: '',
      args: [],
    );
  }

  /// `Honduran`
  String get honduran {
    return Intl.message(
      'Honduran',
      name: 'honduran',
      desc: '',
      args: [],
    );
  }

  /// `Hungarian`
  String get hungarian {
    return Intl.message(
      'Hungarian',
      name: 'hungarian',
      desc: '',
      args: [],
    );
  }

  /// `Icelander`
  String get icelander {
    return Intl.message(
      'Icelander',
      name: 'icelander',
      desc: '',
      args: [],
    );
  }

  /// `Indian`
  String get indian {
    return Intl.message(
      'Indian',
      name: 'indian',
      desc: '',
      args: [],
    );
  }

  /// `Indonesian`
  String get indonesian {
    return Intl.message(
      'Indonesian',
      name: 'indonesian',
      desc: '',
      args: [],
    );
  }

  /// `Iranian`
  String get iranian {
    return Intl.message(
      'Iranian',
      name: 'iranian',
      desc: '',
      args: [],
    );
  }

  /// `Iraqi`
  String get iraqi {
    return Intl.message(
      'Iraqi',
      name: 'iraqi',
      desc: '',
      args: [],
    );
  }

  /// `Irish`
  String get irish {
    return Intl.message(
      'Irish',
      name: 'irish',
      desc: '',
      args: [],
    );
  }

  /// `Israeli`
  String get israeli {
    return Intl.message(
      'Israeli',
      name: 'israeli',
      desc: '',
      args: [],
    );
  }

  /// `Italian`
  String get italian {
    return Intl.message(
      'Italian',
      name: 'italian',
      desc: '',
      args: [],
    );
  }

  /// `Ivorian`
  String get ivorian {
    return Intl.message(
      'Ivorian',
      name: 'ivorian',
      desc: '',
      args: [],
    );
  }

  /// `Jamaican`
  String get jamaican {
    return Intl.message(
      'Jamaican',
      name: 'jamaican',
      desc: '',
      args: [],
    );
  }

  /// `Japanese`
  String get japanese {
    return Intl.message(
      'Japanese',
      name: 'japanese',
      desc: '',
      args: [],
    );
  }

  /// `Jordanian`
  String get jordanian {
    return Intl.message(
      'Jordanian',
      name: 'jordanian',
      desc: '',
      args: [],
    );
  }

  /// `Kazakh`
  String get kazakh {
    return Intl.message(
      'Kazakh',
      name: 'kazakh',
      desc: '',
      args: [],
    );
  }

  /// `Kenyan`
  String get kenyan {
    return Intl.message(
      'Kenyan',
      name: 'kenyan',
      desc: '',
      args: [],
    );
  }

  /// `Kittian`
  String get kittian {
    return Intl.message(
      'Kittian',
      name: 'kittian',
      desc: '',
      args: [],
    );
  }

  /// `Kuwaiti`
  String get kuwaiti {
    return Intl.message(
      'Kuwaiti',
      name: 'kuwaiti',
      desc: '',
      args: [],
    );
  }

  /// `Kyrgyz`
  String get kyrgyz {
    return Intl.message(
      'Kyrgyz',
      name: 'kyrgyz',
      desc: '',
      args: [],
    );
  }

  /// `Laotian`
  String get laotian {
    return Intl.message(
      'Laotian',
      name: 'laotian',
      desc: '',
      args: [],
    );
  }

  /// `Latvian`
  String get latvian {
    return Intl.message(
      'Latvian',
      name: 'latvian',
      desc: '',
      args: [],
    );
  }

  /// `Lebanese`
  String get lebanese {
    return Intl.message(
      'Lebanese',
      name: 'lebanese',
      desc: '',
      args: [],
    );
  }

  /// `Liberian`
  String get liberian {
    return Intl.message(
      'Liberian',
      name: 'liberian',
      desc: '',
      args: [],
    );
  }

  /// `Libyan`
  String get libyan {
    return Intl.message(
      'Libyan',
      name: 'libyan',
      desc: '',
      args: [],
    );
  }

  /// `Liechtensteiner`
  String get liechtensteiner {
    return Intl.message(
      'Liechtensteiner',
      name: 'liechtensteiner',
      desc: '',
      args: [],
    );
  }

  /// `Lithuanian`
  String get lithuanian {
    return Intl.message(
      'Lithuanian',
      name: 'lithuanian',
      desc: '',
      args: [],
    );
  }

  /// `Luxembourger`
  String get luxembourger {
    return Intl.message(
      'Luxembourger',
      name: 'luxembourger',
      desc: '',
      args: [],
    );
  }

  /// `Macedonian`
  String get macedonian {
    return Intl.message(
      'Macedonian',
      name: 'macedonian',
      desc: '',
      args: [],
    );
  }

  /// `Malagasy`
  String get malagasy {
    return Intl.message(
      'Malagasy',
      name: 'malagasy',
      desc: '',
      args: [],
    );
  }

  /// `Malawian`
  String get malawian {
    return Intl.message(
      'Malawian',
      name: 'malawian',
      desc: '',
      args: [],
    );
  }

  /// `Malaysian`
  String get malaysian {
    return Intl.message(
      'Malaysian',
      name: 'malaysian',
      desc: '',
      args: [],
    );
  }

  /// `Maldivian`
  String get maldivian {
    return Intl.message(
      'Maldivian',
      name: 'maldivian',
      desc: '',
      args: [],
    );
  }

  /// `Malian`
  String get malian {
    return Intl.message(
      'Malian',
      name: 'malian',
      desc: '',
      args: [],
    );
  }

  /// `Maltese`
  String get maltese {
    return Intl.message(
      'Maltese',
      name: 'maltese',
      desc: '',
      args: [],
    );
  }

  /// `Marshallese`
  String get marshallese {
    return Intl.message(
      'Marshallese',
      name: 'marshallese',
      desc: '',
      args: [],
    );
  }

  /// `Mauritanian`
  String get mauritanian {
    return Intl.message(
      'Mauritanian',
      name: 'mauritanian',
      desc: '',
      args: [],
    );
  }

  /// `Mauritian`
  String get mauritian {
    return Intl.message(
      'Mauritian',
      name: 'mauritian',
      desc: '',
      args: [],
    );
  }

  /// `Mexican`
  String get mexican {
    return Intl.message(
      'Mexican',
      name: 'mexican',
      desc: '',
      args: [],
    );
  }

  /// `Micronesian`
  String get micronesian {
    return Intl.message(
      'Micronesian',
      name: 'micronesian',
      desc: '',
      args: [],
    );
  }

  /// `Moldovan`
  String get moldovan {
    return Intl.message(
      'Moldovan',
      name: 'moldovan',
      desc: '',
      args: [],
    );
  }

  /// `Monacan`
  String get monacan {
    return Intl.message(
      'Monacan',
      name: 'monacan',
      desc: '',
      args: [],
    );
  }

  /// `Mongolian`
  String get mongolian {
    return Intl.message(
      'Mongolian',
      name: 'mongolian',
      desc: '',
      args: [],
    );
  }

  /// `Moroccan`
  String get moroccan {
    return Intl.message(
      'Moroccan',
      name: 'moroccan',
      desc: '',
      args: [],
    );
  }

  /// `Mosotho`
  String get mosotho {
    return Intl.message(
      'Mosotho',
      name: 'mosotho',
      desc: '',
      args: [],
    );
  }

  /// `Motswana`
  String get motswana {
    return Intl.message(
      'Motswana',
      name: 'motswana',
      desc: '',
      args: [],
    );
  }

  /// `Mozambican`
  String get mozambican {
    return Intl.message(
      'Mozambican',
      name: 'mozambican',
      desc: '',
      args: [],
    );
  }

  /// `Namibian`
  String get namibian {
    return Intl.message(
      'Namibian',
      name: 'namibian',
      desc: '',
      args: [],
    );
  }

  /// `Nauruan`
  String get nauruan {
    return Intl.message(
      'Nauruan',
      name: 'nauruan',
      desc: '',
      args: [],
    );
  }

  /// `Nepalese`
  String get nepalese {
    return Intl.message(
      'Nepalese',
      name: 'nepalese',
      desc: '',
      args: [],
    );
  }

  /// `New Zealander`
  String get new_zealander {
    return Intl.message(
      'New Zealander',
      name: 'new_zealander',
      desc: '',
      args: [],
    );
  }

  /// `Nicaraguan`
  String get nicaraguan {
    return Intl.message(
      'Nicaraguan',
      name: 'nicaraguan',
      desc: '',
      args: [],
    );
  }

  /// `Nigerian`
  String get nigerian {
    return Intl.message(
      'Nigerian',
      name: 'nigerian',
      desc: '',
      args: [],
    );
  }

  /// `Nigerien`
  String get nigerien {
    return Intl.message(
      'Nigerien',
      name: 'nigerien',
      desc: '',
      args: [],
    );
  }

  /// `North Korean`
  String get north_korean {
    return Intl.message(
      'North Korean',
      name: 'north_korean',
      desc: '',
      args: [],
    );
  }

  /// `Norwegian`
  String get norwegian {
    return Intl.message(
      'Norwegian',
      name: 'norwegian',
      desc: '',
      args: [],
    );
  }

  /// `Omani`
  String get omani {
    return Intl.message(
      'Omani',
      name: 'omani',
      desc: '',
      args: [],
    );
  }

  /// `Pakistani`
  String get pakistani {
    return Intl.message(
      'Pakistani',
      name: 'pakistani',
      desc: '',
      args: [],
    );
  }

  /// `Palauan`
  String get palauan {
    return Intl.message(
      'Palauan',
      name: 'palauan',
      desc: '',
      args: [],
    );
  }

  /// `Palestinian`
  String get palestinian {
    return Intl.message(
      'Palestinian',
      name: 'palestinian',
      desc: '',
      args: [],
    );
  }

  /// `Panamanian`
  String get panamanian {
    return Intl.message(
      'Panamanian',
      name: 'panamanian',
      desc: '',
      args: [],
    );
  }

  /// `Papua New Guinean`
  String get papua_new_guinean {
    return Intl.message(
      'Papua New Guinean',
      name: 'papua_new_guinean',
      desc: '',
      args: [],
    );
  }

  /// `Paraguayan`
  String get paraguayan {
    return Intl.message(
      'Paraguayan',
      name: 'paraguayan',
      desc: '',
      args: [],
    );
  }

  /// `Peruvian`
  String get peruvian {
    return Intl.message(
      'Peruvian',
      name: 'peruvian',
      desc: '',
      args: [],
    );
  }

  /// `Polish`
  String get polish {
    return Intl.message(
      'Polish',
      name: 'polish',
      desc: '',
      args: [],
    );
  }

  /// `Portuguese`
  String get portuguese {
    return Intl.message(
      'Portuguese',
      name: 'portuguese',
      desc: '',
      args: [],
    );
  }

  /// `Qatari`
  String get qatari {
    return Intl.message(
      'Qatari',
      name: 'qatari',
      desc: '',
      args: [],
    );
  }

  /// `Romanian`
  String get romanian {
    return Intl.message(
      'Romanian',
      name: 'romanian',
      desc: '',
      args: [],
    );
  }

  /// `Russian`
  String get russian {
    return Intl.message(
      'Russian',
      name: 'russian',
      desc: '',
      args: [],
    );
  }

  /// `Rwandan`
  String get rwandan {
    return Intl.message(
      'Rwandan',
      name: 'rwandan',
      desc: '',
      args: [],
    );
  }

  /// `Saint Lucian`
  String get saint_lucian {
    return Intl.message(
      'Saint Lucian',
      name: 'saint_lucian',
      desc: '',
      args: [],
    );
  }

  /// `Salvadoran`
  String get salvadoran {
    return Intl.message(
      'Salvadoran',
      name: 'salvadoran',
      desc: '',
      args: [],
    );
  }

  /// `Samoan`
  String get samoan {
    return Intl.message(
      'Samoan',
      name: 'samoan',
      desc: '',
      args: [],
    );
  }

  /// `San Marinese`
  String get san_marinese {
    return Intl.message(
      'San Marinese',
      name: 'san_marinese',
      desc: '',
      args: [],
    );
  }

  /// `Sao Tomean`
  String get sao_tomean {
    return Intl.message(
      'Sao Tomean',
      name: 'sao_tomean',
      desc: '',
      args: [],
    );
  }

  /// `Saudi`
  String get saudi {
    return Intl.message(
      'Saudi',
      name: 'saudi',
      desc: '',
      args: [],
    );
  }

  /// `Scottish`
  String get scottish {
    return Intl.message(
      'Scottish',
      name: 'scottish',
      desc: '',
      args: [],
    );
  }

  /// `Senegalese`
  String get senegalese {
    return Intl.message(
      'Senegalese',
      name: 'senegalese',
      desc: '',
      args: [],
    );
  }

  /// `Serbian`
  String get serbian {
    return Intl.message(
      'Serbian',
      name: 'serbian',
      desc: '',
      args: [],
    );
  }

  /// `Seychellois`
  String get seychellois {
    return Intl.message(
      'Seychellois',
      name: 'seychellois',
      desc: '',
      args: [],
    );
  }

  /// `Sierra Leonean`
  String get sierra_leonean {
    return Intl.message(
      'Sierra Leonean',
      name: 'sierra_leonean',
      desc: '',
      args: [],
    );
  }

  /// `Singaporean`
  String get singaporean {
    return Intl.message(
      'Singaporean',
      name: 'singaporean',
      desc: '',
      args: [],
    );
  }

  /// `Slovak`
  String get slovak {
    return Intl.message(
      'Slovak',
      name: 'slovak',
      desc: '',
      args: [],
    );
  }

  /// `Slovenian`
  String get slovenian {
    return Intl.message(
      'Slovenian',
      name: 'slovenian',
      desc: '',
      args: [],
    );
  }

  /// `Solomon Islander`
  String get solomon_islander {
    return Intl.message(
      'Solomon Islander',
      name: 'solomon_islander',
      desc: '',
      args: [],
    );
  }

  /// `Somali`
  String get somali {
    return Intl.message(
      'Somali',
      name: 'somali',
      desc: '',
      args: [],
    );
  }

  /// `South African`
  String get south_african {
    return Intl.message(
      'South African',
      name: 'south_african',
      desc: '',
      args: [],
    );
  }

  /// `South Korean`
  String get south_korean {
    return Intl.message(
      'South Korean',
      name: 'south_korean',
      desc: '',
      args: [],
    );
  }

  /// `Spanish`
  String get spanish {
    return Intl.message(
      'Spanish',
      name: 'spanish',
      desc: '',
      args: [],
    );
  }

  /// `Sri Lankan`
  String get sri_lankan {
    return Intl.message(
      'Sri Lankan',
      name: 'sri_lankan',
      desc: '',
      args: [],
    );
  }

  /// `Sudanese`
  String get sudanese {
    return Intl.message(
      'Sudanese',
      name: 'sudanese',
      desc: '',
      args: [],
    );
  }

  /// `Surinamer`
  String get surinamer {
    return Intl.message(
      'Surinamer',
      name: 'surinamer',
      desc: '',
      args: [],
    );
  }

  /// `Swazi`
  String get swazi {
    return Intl.message(
      'Swazi',
      name: 'swazi',
      desc: '',
      args: [],
    );
  }

  /// `Swedish`
  String get swedish {
    return Intl.message(
      'Swedish',
      name: 'swedish',
      desc: '',
      args: [],
    );
  }

  /// `Swiss`
  String get swiss {
    return Intl.message(
      'Swiss',
      name: 'swiss',
      desc: '',
      args: [],
    );
  }

  /// `Syrian`
  String get syrian {
    return Intl.message(
      'Syrian',
      name: 'syrian',
      desc: '',
      args: [],
    );
  }

  /// `Taiwanese`
  String get taiwanese {
    return Intl.message(
      'Taiwanese',
      name: 'taiwanese',
      desc: '',
      args: [],
    );
  }

  /// `Tajik`
  String get tajik {
    return Intl.message(
      'Tajik',
      name: 'tajik',
      desc: '',
      args: [],
    );
  }

  /// `Tanzanian`
  String get tanzanian {
    return Intl.message(
      'Tanzanian',
      name: 'tanzanian',
      desc: '',
      args: [],
    );
  }

  /// `Thai`
  String get thai {
    return Intl.message(
      'Thai',
      name: 'thai',
      desc: '',
      args: [],
    );
  }

  /// `Togolese`
  String get togolese {
    return Intl.message(
      'Togolese',
      name: 'togolese',
      desc: '',
      args: [],
    );
  }

  /// `Tongan`
  String get tongan {
    return Intl.message(
      'Tongan',
      name: 'tongan',
      desc: '',
      args: [],
    );
  }

  /// `Trinidadian`
  String get trinidadian {
    return Intl.message(
      'Trinidadian',
      name: 'trinidadian',
      desc: '',
      args: [],
    );
  }

  /// `Tunisian`
  String get tunisian {
    return Intl.message(
      'Tunisian',
      name: 'tunisian',
      desc: '',
      args: [],
    );
  }

  /// `Turkish`
  String get turkish {
    return Intl.message(
      'Turkish',
      name: 'turkish',
      desc: '',
      args: [],
    );
  }

  /// `Turkmen`
  String get turkmen {
    return Intl.message(
      'Turkmen',
      name: 'turkmen',
      desc: '',
      args: [],
    );
  }

  /// `Tuvaluan`
  String get tuvaluan {
    return Intl.message(
      'Tuvaluan',
      name: 'tuvaluan',
      desc: '',
      args: [],
    );
  }

  /// `Ugandan`
  String get ugandan {
    return Intl.message(
      'Ugandan',
      name: 'ugandan',
      desc: '',
      args: [],
    );
  }

  /// `Ukrainian`
  String get ukrainian {
    return Intl.message(
      'Ukrainian',
      name: 'ukrainian',
      desc: '',
      args: [],
    );
  }

  /// `Uruguayan`
  String get uruguayan {
    return Intl.message(
      'Uruguayan',
      name: 'uruguayan',
      desc: '',
      args: [],
    );
  }

  /// `Uzbek`
  String get uzbek {
    return Intl.message(
      'Uzbek',
      name: 'uzbek',
      desc: '',
      args: [],
    );
  }

  /// `Vanuatuan`
  String get vanuatuan {
    return Intl.message(
      'Vanuatuan',
      name: 'vanuatuan',
      desc: '',
      args: [],
    );
  }

  /// `Venezuelan`
  String get venezuelan {
    return Intl.message(
      'Venezuelan',
      name: 'venezuelan',
      desc: '',
      args: [],
    );
  }

  /// `Vietnamese`
  String get vietnamese {
    return Intl.message(
      'Vietnamese',
      name: 'vietnamese',
      desc: '',
      args: [],
    );
  }

  /// `Welsh`
  String get welsh {
    return Intl.message(
      'Welsh',
      name: 'welsh',
      desc: '',
      args: [],
    );
  }

  /// `Yemeni`
  String get yemeni {
    return Intl.message(
      'Yemeni',
      name: 'yemeni',
      desc: '',
      args: [],
    );
  }

  /// `Zambian`
  String get zambian {
    return Intl.message(
      'Zambian',
      name: 'zambian',
      desc: '',
      args: [],
    );
  }

  /// `Zimbabwean`
  String get zimbabwean {
    return Intl.message(
      'Zimbabwean',
      name: 'zimbabwean',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'What_is_your_nationality?' key

  /// `Select your nationality`
  String get Select_your_nationality {
    return Intl.message(
      'Select your nationality',
      name: 'Select_your_nationality',
      desc: '',
      args: [],
    );
  }

  /// `Where do you live?`
  String get Where_do_you_live {
    return Intl.message(
      'Where do you live?',
      name: 'Where_do_you_live',
      desc: '',
      args: [],
    );
  }

  /// `Your Phone For Contact?`
  String get Your_Phone_For_Contact {
    return Intl.message(
      'Your Phone For Contact?',
      name: 'Your_Phone_For_Contact',
      desc: '',
      args: [],
    );
  }

  /// `Personal Data Done`
  String get Personal_Data_Done {
    return Intl.message(
      'Personal Data Done',
      name: 'Personal_Data_Done',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Work-Routine' key

  /// `Morning shift`
  String get Morning_shift {
    return Intl.message(
      'Morning shift',
      name: 'Morning_shift',
      desc: '',
      args: [],
    );
  }

  /// `Evening shift`
  String get Evening_shift {
    return Intl.message(
      'Evening shift',
      name: 'Evening_shift',
      desc: '',
      args: [],
    );
  }

  /// `Variable shifts`
  String get Variable_shifts {
    return Intl.message(
      'Variable shifts',
      name: 'Variable_shifts',
      desc: '',
      args: [],
    );
  }

  /// `Student`
  String get Student {
    return Intl.message(
      'Student',
      name: 'Student',
      desc: '',
      args: [],
    );
  }

  /// `Your current weight`
  String get Your_current_weight {
    return Intl.message(
      'Your current weight',
      name: 'Your_current_weight',
      desc: '',
      args: [],
    );
  }

  /// `Body Dimensions Measurement`
  String get Body_Dimensions_Measurement {
    return Intl.message(
      'Body Dimensions Measurement',
      name: 'Body_Dimensions_Measurement',
      desc: '',
      args: [],
    );
  }

  /// `Choose the measurement`
  String get Choose_the_measurement {
    return Intl.message(
      'Choose the measurement',
      name: 'Choose_the_measurement',
      desc: '',
      args: [],
    );
  }

  /// `thighs`
  String get thighs {
    return Intl.message(
      'thighs',
      name: 'thighs',
      desc: '',
      args: [],
    );
  }

  /// `Foot fat`
  String get Foot_fat {
    return Intl.message(
      'Foot fat',
      name: 'Foot_fat',
      desc: '',
      args: [],
    );
  }

  /// `neck`
  String get neck {
    return Intl.message(
      'neck',
      name: 'neck',
      desc: '',
      args: [],
    );
  }

  /// `Chest`
  String get chest {
    return Intl.message(
      'Chest',
      name: 'chest',
      desc: '',
      args: [],
    );
  }

  /// `Waist`
  String get waist {
    return Intl.message(
      'Waist',
      name: 'waist',
      desc: '',
      args: [],
    );
  }

  /// `hand`
  String get hand {
    return Intl.message(
      'hand',
      name: 'hand',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get Save {
    return Intl.message(
      'Save',
      name: 'Save',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'How_Much_Do_You_Walk_Daily?' key

  /// `Less Than 1 Hour`
  String get Less_Than_1_Hour {
    return Intl.message(
      'Less Than 1 Hour',
      name: 'Less_Than_1_Hour',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '1-2_Hours' key

  // skipped getter for the 'More-Than_2_Hours' key

  // skipped getter for the 'Body-Data_Done' key

  /// `Body Data`
  String get body_data {
    return Intl.message(
      'Body Data',
      name: 'body_data',
      desc: '',
      args: [],
    );
  }

  /// `Your height`
  String get your_height {
    return Intl.message(
      'Your height',
      name: 'your_height',
      desc: '',
      args: [],
    );
  }

  /// `Height information helps us calculate your BMI more accurately`
  String get height_info {
    return Intl.message(
      'Height information helps us calculate your BMI more accurately',
      name: 'height_info',
      desc: '',
      args: [],
    );
  }

  /// `FT`
  String get ft {
    return Intl.message(
      'FT',
      name: 'ft',
      desc: '',
      args: [],
    );
  }

  /// `CM`
  String get cm {
    return Intl.message(
      'CM',
      name: 'cm',
      desc: '',
      args: [],
    );
  }

  /// `Have you suffered any injuries recently?`
  String get recent_injuries_question {
    return Intl.message(
      'Have you suffered any injuries recently?',
      name: 'recent_injuries_question',
      desc: '',
      args: [],
    );
  }

  /// `None. I am healthy`
  String get none_healthy {
    return Intl.message(
      'None. I am healthy',
      name: 'none_healthy',
      desc: '',
      args: [],
    );
  }

  /// `Shoulder`
  String get shoulder {
    return Intl.message(
      'Shoulder',
      name: 'shoulder',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Wrist`
  String get wrist {
    return Intl.message(
      'Wrist',
      name: 'wrist',
      desc: '',
      args: [],
    );
  }

  /// `Knee`
  String get knee {
    return Intl.message(
      'Knee',
      name: 'knee',
      desc: '',
      args: [],
    );
  }

  /// `Leg`
  String get leg {
    return Intl.message(
      'Leg',
      name: 'leg',
      desc: '',
      args: [],
    );
  }

  /// `Ankle`
  String get ankle {
    return Intl.message(
      'Ankle',
      name: 'ankle',
      desc: '',
      args: [],
    );
  }

  /// `How would you rate your\n fitness level?`
  String get fitness_level_question {
    return Intl.message(
      'How would you rate your\n fitness level?',
      name: 'fitness_level_question',
      desc: '',
      args: [],
    );
  }

  /// `Beginner`
  String get beginner {
    return Intl.message(
      'Beginner',
      name: 'beginner',
      desc: '',
      args: [],
    );
  }

  /// `Intermediate`
  String get intermediate {
    return Intl.message(
      'Intermediate',
      name: 'intermediate',
      desc: '',
      args: [],
    );
  }

  /// `Advanced`
  String get advanced {
    return Intl.message(
      'Advanced',
      name: 'advanced',
      desc: '',
      args: [],
    );
  }

  /// `Do you suffer from any diseases?`
  String get Do_you_suffer_from_any_diseases {
    return Intl.message(
      'Do you suffer from any diseases?',
      name: 'Do_you_suffer_from_any_diseases',
      desc: '',
      args: [],
    );
  }

  /// `None. I am healthy`
  String get None_Iam_healthy {
    return Intl.message(
      'None. I am healthy',
      name: 'None_Iam_healthy',
      desc: '',
      args: [],
    );
  }

  /// `Sugar`
  String get Sugar {
    return Intl.message(
      'Sugar',
      name: 'Sugar',
      desc: '',
      args: [],
    );
  }

  /// `Pressure`
  String get Pressure {
    return Intl.message(
      'Pressure',
      name: 'Pressure',
      desc: '',
      args: [],
    );
  }

  /// `Heart Diseases`
  String get Heart_Diseases {
    return Intl.message(
      'Heart Diseases',
      name: 'Heart_Diseases',
      desc: '',
      args: [],
    );
  }

  /// `Lung Problems`
  String get Lung_Problems {
    return Intl.message(
      'Lung Problems',
      name: 'Lung_Problems',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Illness and injury Data Done`
  String get Illness_and_injury_Data_Done {
    return Intl.message(
      'Illness and injury Data Done',
      name: 'Illness_and_injury_Data_Done',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Number-of_Training_Days' key

  /// `One Day`
  String get One_Day {
    return Intl.message(
      'One Day',
      name: 'One_Day',
      desc: '',
      args: [],
    );
  }

  /// `Two Days`
  String get Two_Days {
    return Intl.message(
      'Two Days',
      name: 'Two_Days',
      desc: '',
      args: [],
    );
  }

  /// `Three Days`
  String get Three_Days {
    return Intl.message(
      'Three Days',
      name: 'Three_Days',
      desc: '',
      args: [],
    );
  }

  /// `Four Days`
  String get Four_Days {
    return Intl.message(
      'Four Days',
      name: 'Four_Days',
      desc: '',
      args: [],
    );
  }

  /// `Five Days`
  String get Five_Days {
    return Intl.message(
      'Five Days',
      name: 'Five_Days',
      desc: '',
      args: [],
    );
  }

  /// `Six Days`
  String get Six_Days {
    return Intl.message(
      'Six Days',
      name: 'Six_Days',
      desc: '',
      args: [],
    );
  }

  /// `The Type Of Exercise You Prefer`
  String get The_Type_Of_Exercise_You_Prefer {
    return Intl.message(
      'The Type Of Exercise You Prefer',
      name: 'The_Type_Of_Exercise_You_Prefer',
      desc: '',
      args: [],
    );
  }

  /// `I Don't Know`
  String get I_Dont_Know {
    return Intl.message(
      'I Don\'t Know',
      name: 'I_Dont_Know',
      desc: '',
      args: [],
    );
  }

  /// `Push Pull Leg`
  String get Push_Pull_Leg {
    return Intl.message(
      'Push Pull Leg',
      name: 'Push_Pull_Leg',
      desc: '',
      args: [],
    );
  }

  /// `Upper Lower Body`
  String get Upper_Lower_Body {
    return Intl.message(
      'Upper Lower Body',
      name: 'Upper_Lower_Body',
      desc: '',
      args: [],
    );
  }

  /// `One Muscle`
  String get One_Muscle {
    return Intl.message(
      'One Muscle',
      name: 'One_Muscle',
      desc: '',
      args: [],
    );
  }

  /// `Two Muscle`
  String get Two_Muscle {
    return Intl.message(
      'Two Muscle',
      name: 'Two_Muscle',
      desc: '',
      args: [],
    );
  }

  /// `Super Set`
  String get Super_Set {
    return Intl.message(
      'Super Set',
      name: 'Super_Set',
      desc: '',
      args: [],
    );
  }

  /// `Drop Set`
  String get Drop_Set {
    return Intl.message(
      'Drop Set',
      name: 'Drop_Set',
      desc: '',
      args: [],
    );
  }

  /// `Supported Repetitions`
  String get Supported_Repetitions {
    return Intl.message(
      'Supported Repetitions',
      name: 'Supported_Repetitions',
      desc: '',
      args: [],
    );
  }

  /// `The Hierarchical Style`
  String get The_Hierarchical_Style {
    return Intl.message(
      'The Hierarchical Style',
      name: 'The_Hierarchical_Style',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your Training Time?`
  String get Training_Time {
    return Intl.message(
      'Choose Your Training Time?',
      name: 'Training_Time',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '30-45_Minutes' key

  // skipped getter for the '45-60_Minutes' key

  // skipped getter for the '60-75_Minutes' key

  // skipped getter for the '75-100_Minutes' key

  // skipped getter for the '100-120_Minutes' key

  // skipped getter for the '120-140_Minutes' key

  // skipped getter for the '140-160_Minutes' key

  // skipped getter for the '160-180_Minutes' key

  /// `Choose Your Training Days?`
  String get Choose_Your_Training_Days {
    return Intl.message(
      'Choose Your Training Days?',
      name: 'Choose_Your_Training_Days',
      desc: '',
      args: [],
    );
  }

  /// `Sunday`
  String get Sunday {
    return Intl.message(
      'Sunday',
      name: 'Sunday',
      desc: '',
      args: [],
    );
  }

  /// `Saturday`
  String get Saturday {
    return Intl.message(
      'Saturday',
      name: 'Saturday',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get Monday {
    return Intl.message(
      'Monday',
      name: 'Monday',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get Tuesday {
    return Intl.message(
      'Tuesday',
      name: 'Tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get Wednesday {
    return Intl.message(
      'Wednesday',
      name: 'Wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get Thursday {
    return Intl.message(
      'Thursday',
      name: 'Thursday',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get Friday {
    return Intl.message(
      'Friday',
      name: 'Friday',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your Training Break?`
  String get Training_Break {
    return Intl.message(
      'Choose Your Training Break?',
      name: 'Training_Break',
      desc: '',
      args: [],
    );
  }

  /// `Fitness Data Done`
  String get Fitness_Data_Done {
    return Intl.message(
      'Fitness Data Done',
      name: 'Fitness_Data_Done',
      desc: '',
      args: [],
    );
  }

  /// `Where do you train`
  String get Where_do_you_train {
    return Intl.message(
      'Where do you train',
      name: 'Where_do_you_train',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Small Gym`
  String get Small_Gym {
    return Intl.message(
      'Small Gym',
      name: 'Small_Gym',
      desc: '',
      args: [],
    );
  }

  /// `Big Gym`
  String get Big_Gym {
    return Intl.message(
      'Big Gym',
      name: 'Big_Gym',
      desc: '',
      args: [],
    );
  }

  /// `Where Did You Hear About Us?`
  String get HearAboutUs {
    return Intl.message(
      'Where Did You Hear About Us?',
      name: 'HearAboutUs',
      desc: '',
      args: [],
    );
  }

  /// `FaceBook`
  String get Facebook {
    return Intl.message(
      'FaceBook',
      name: 'Facebook',
      desc: '',
      args: [],
    );
  }

  /// `TikTok`
  String get TikTok {
    return Intl.message(
      'TikTok',
      name: 'TikTok',
      desc: '',
      args: [],
    );
  }

  /// `Instagram`
  String get Instagram {
    return Intl.message(
      'Instagram',
      name: 'Instagram',
      desc: '',
      args: [],
    );
  }

  /// `Twitter`
  String get Twitter {
    return Intl.message(
      'Twitter',
      name: 'Twitter',
      desc: '',
      args: [],
    );
  }

  /// `Improving Health`
  String get improving_health {
    return Intl.message(
      'Improving Health',
      name: 'improving_health',
      desc: '',
      args: [],
    );
  }

  /// `Boosting Immune System`
  String get boosting_immune_system {
    return Intl.message(
      'Boosting Immune System',
      name: 'boosting_immune_system',
      desc: '',
      args: [],
    );
  }

  /// `Looking Better`
  String get looking_better {
    return Intl.message(
      'Looking Better',
      name: 'looking_better',
      desc: '',
      args: [],
    );
  }

  /// `Building Strength and Endurance`
  String get building_strength_endurance {
    return Intl.message(
      'Building Strength and Endurance',
      name: 'building_strength_endurance',
      desc: '',
      args: [],
    );
  }

  /// `Boosting Libido`
  String get boosting_libido {
    return Intl.message(
      'Boosting Libido',
      name: 'boosting_libido',
      desc: '',
      args: [],
    );
  }

  /// `What motivates you to exercise?`
  String get what_motivates_to_exercise {
    return Intl.message(
      'What motivates you to exercise?',
      name: 'what_motivates_to_exercise',
      desc: '',
      args: [],
    );
  }

  /// `Selected Goals`
  String get selected_goals_title {
    return Intl.message(
      'Selected Goals',
      name: 'selected_goals_title',
      desc: '',
      args: [],
    );
  }

  /// `You have selected:`
  String get you_have_selected {
    return Intl.message(
      'You have selected:',
      name: 'you_have_selected',
      desc: '',
      args: [],
    );
  }

  /// `Your target weight`
  String get your_target_weight {
    return Intl.message(
      'Your target weight',
      name: 'your_target_weight',
      desc: '',
      args: [],
    );
  }

  /// `LB`
  String get lb {
    return Intl.message(
      'LB',
      name: 'lb',
      desc: '',
      args: [],
    );
  }

  /// `KG`
  String get kg {
    return Intl.message(
      'KG',
      name: 'kg',
      desc: '',
      args: [],
    );
  }

  /// `Which areas do you want to focus on?`
  String get which_areas_focus {
    return Intl.message(
      'Which areas do you want to focus on?',
      name: 'which_areas_focus',
      desc: '',
      args: [],
    );
  }

  /// `Select the target area for more accurate course recommendations`
  String get select_target_area {
    return Intl.message(
      'Select the target area for more accurate course recommendations',
      name: 'select_target_area',
      desc: '',
      args: [],
    );
  }

  /// `Arms`
  String get arms {
    return Intl.message(
      'Arms',
      name: 'arms',
      desc: '',
      args: [],
    );
  }

  /// `Abs`
  String get abs {
    return Intl.message(
      'Abs',
      name: 'abs',
      desc: '',
      args: [],
    );
  }

  /// `Butt`
  String get butt {
    return Intl.message(
      'Butt',
      name: 'butt',
      desc: '',
      args: [],
    );
  }

  /// `Legs`
  String get legs {
    return Intl.message(
      'Legs',
      name: 'legs',
      desc: '',
      args: [],
    );
  }

  /// `Whole Body`
  String get whole_body {
    return Intl.message(
      'Whole Body',
      name: 'whole_body',
      desc: '',
      args: [],
    );
  }

  /// `Your current weight`
  String get your_current_weight {
    return Intl.message(
      'Your current weight',
      name: 'your_current_weight',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email`
  String get enter_email {
    return Intl.message(
      'Enter Your Email',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get enter_password {
    return Intl.message(
      'Enter Your Password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Name`
  String get enter_name {
    return Intl.message(
      'Enter Your Name',
      name: 'enter_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Phone Number`
  String get enter_phone {
    return Intl.message(
      'Enter Your Phone Number',
      name: 'enter_phone',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get invalid_email {
    return Intl.message(
      'Please enter a valid email',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get invalid_password {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'invalid_password',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get password_mismatch {
    return Intl.message(
      'Passwords do not match',
      name: 'password_mismatch',
      desc: '',
      args: [],
    );
  }

  /// `Account successfully created`
  String get account_created_success {
    return Intl.message(
      'Account successfully created',
      name: 'account_created_success',
      desc: '',
      args: [],
    );
  }

  /// `Successfully logged in`
  String get login_success {
    return Intl.message(
      'Successfully logged in',
      name: 'login_success',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect email or password`
  String get login_error {
    return Intl.message(
      'Incorrect email or password',
      name: 'login_error',
      desc: '',
      args: [],
    );
  }

  /// `Already Have an Account?`
  String get already_have_account {
    return Intl.message(
      'Already Have an Account?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forget_password {
    return Intl.message(
      'Forget Password?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Train and live the new experience of exercising at home`
  String get train_experience {
    return Intl.message(
      'Train and live the new experience of exercising at home',
      name: 'train_experience',
      desc: '',
      args: [],
    );
  }

  /// `Login with Facebook`
  String get social_login_facebook {
    return Intl.message(
      'Login with Facebook',
      name: 'social_login_facebook',
      desc: '',
      args: [],
    );
  }

  /// `Login with Google`
  String get social_login_google {
    return Intl.message(
      'Login with Google',
      name: 'social_login_google',
      desc: '',
      args: [],
    );
  }

  /// `Login with Apple`
  String get social_login_apple {
    return Intl.message(
      'Login with Apple',
      name: 'social_login_apple',
      desc: '',
      args: [],
    );
  }

  /// `Food Calculator`
  String get food_calculator {
    return Intl.message(
      'Food Calculator',
      name: 'food_calculator',
      desc: '',
      args: [],
    );
  }

  /// `calories`
  String get calories {
    return Intl.message(
      'calories',
      name: 'calories',
      desc: '',
      args: [],
    );
  }

  /// `proteins`
  String get proteins {
    return Intl.message(
      'proteins',
      name: 'proteins',
      desc: '',
      args: [],
    );
  }

  /// `carbohydrates`
  String get carbohydrates {
    return Intl.message(
      'carbohydrates',
      name: 'carbohydrates',
      desc: '',
      args: [],
    );
  }

  /// `fats`
  String get fats {
    return Intl.message(
      'fats',
      name: 'fats',
      desc: '',
      args: [],
    );
  }

  /// `fibers`
  String get fibers {
    return Intl.message(
      'fibers',
      name: 'fibers',
      desc: '',
      args: [],
    );
  }

  /// `sugar`
  String get sugar {
    return Intl.message(
      'sugar',
      name: 'sugar',
      desc: '',
      args: [],
    );
  }

  /// `VitaminA`
  String get VitaminA {
    return Intl.message(
      'VitaminA',
      name: 'VitaminA',
      desc: '',
      args: [],
    );
  }

  /// `VitaminB1`
  String get VitaminB1 {
    return Intl.message(
      'VitaminB1',
      name: 'VitaminB1',
      desc: '',
      args: [],
    );
  }

  /// `VitaminB2`
  String get VitaminB2 {
    return Intl.message(
      'VitaminB2',
      name: 'VitaminB2',
      desc: '',
      args: [],
    );
  }

  /// `VitaminB3`
  String get VitaminB3 {
    return Intl.message(
      'VitaminB3',
      name: 'VitaminB3',
      desc: '',
      args: [],
    );
  }

  /// `VitaminB5`
  String get VitaminB5 {
    return Intl.message(
      'VitaminB5',
      name: 'VitaminB5',
      desc: '',
      args: [],
    );
  }

  /// `VitaminB6`
  String get VitaminB6 {
    return Intl.message(
      'VitaminB6',
      name: 'VitaminB6',
      desc: '',
      args: [],
    );
  }

  /// `VitaminB7`
  String get VitaminB7 {
    return Intl.message(
      'VitaminB7',
      name: 'VitaminB7',
      desc: '',
      args: [],
    );
  }

  /// `VitaminB9`
  String get VitaminB9 {
    return Intl.message(
      'VitaminB9',
      name: 'VitaminB9',
      desc: '',
      args: [],
    );
  }

  /// `VitaminB12`
  String get VitaminB12 {
    return Intl.message(
      'VitaminB12',
      name: 'VitaminB12',
      desc: '',
      args: [],
    );
  }

  /// `VitaminC`
  String get VitaminC {
    return Intl.message(
      'VitaminC',
      name: 'VitaminC',
      desc: '',
      args: [],
    );
  }

  /// `VitaminD`
  String get VitaminD {
    return Intl.message(
      'VitaminD',
      name: 'VitaminD',
      desc: '',
      args: [],
    );
  }

  /// `VitaminE`
  String get VitaminE {
    return Intl.message(
      'VitaminE',
      name: 'VitaminE',
      desc: '',
      args: [],
    );
  }

  /// `VitaminK`
  String get VitaminK {
    return Intl.message(
      'VitaminK',
      name: 'VitaminK',
      desc: '',
      args: [],
    );
  }

  /// `calcium`
  String get calcium {
    return Intl.message(
      'calcium',
      name: 'calcium',
      desc: '',
      args: [],
    );
  }

  /// `iron`
  String get iron {
    return Intl.message(
      'iron',
      name: 'iron',
      desc: '',
      args: [],
    );
  }

  /// `magnesium`
  String get magnesium {
    return Intl.message(
      'magnesium',
      name: 'magnesium',
      desc: '',
      args: [],
    );
  }

  /// `Phosphorus`
  String get Phosphorus {
    return Intl.message(
      'Phosphorus',
      name: 'Phosphorus',
      desc: '',
      args: [],
    );
  }

  /// `potassium`
  String get potassium {
    return Intl.message(
      'potassium',
      name: 'potassium',
      desc: '',
      args: [],
    );
  }

  /// `sodium`
  String get sodium {
    return Intl.message(
      'sodium',
      name: 'sodium',
      desc: '',
      args: [],
    );
  }

  /// `zinc`
  String get zinc {
    return Intl.message(
      'zinc',
      name: 'zinc',
      desc: '',
      args: [],
    );
  }

  /// `copper`
  String get copper {
    return Intl.message(
      'copper',
      name: 'copper',
      desc: '',
      args: [],
    );
  }

  /// `manganese`
  String get manganese {
    return Intl.message(
      'manganese',
      name: 'manganese',
      desc: '',
      args: [],
    );
  }

  /// `selenium`
  String get selenium {
    return Intl.message(
      'selenium',
      name: 'selenium',
      desc: '',
      args: [],
    );
  }

  /// `Alarms`
  String get Alarms {
    return Intl.message(
      'Alarms',
      name: 'Alarms',
      desc: '',
      args: [],
    );
  }

  /// `Meals`
  String get Meals {
    return Intl.message(
      'Meals',
      name: 'Meals',
      desc: '',
      args: [],
    );
  }

  /// `Supplement`
  String get Supplement {
    return Intl.message(
      'Supplement',
      name: 'Supplement',
      desc: '',
      args: [],
    );
  }

  /// `Workout`
  String get Workout {
    return Intl.message(
      'Workout',
      name: 'Workout',
      desc: '',
      args: [],
    );
  }

  /// ` Vitamin `
  String get Vitamin_Alarm1 {
    return Intl.message(
      ' Vitamin ',
      name: 'Vitamin_Alarm1',
      desc: '',
      args: [],
    );
  }

  /// `Creatine`
  String get Creatine {
    return Intl.message(
      'Creatine',
      name: 'Creatine',
      desc: '',
      args: [],
    );
  }

  /// `Breakfast`
  String get Breakfast {
    return Intl.message(
      'Breakfast',
      name: 'Breakfast',
      desc: '',
      args: [],
    );
  }

  /// `Lunch`
  String get Lunch {
    return Intl.message(
      'Lunch',
      name: 'Lunch',
      desc: '',
      args: [],
    );
  }

  /// `Dinner`
  String get Dinner {
    return Intl.message(
      'Dinner',
      name: 'Dinner',
      desc: '',
      args: [],
    );
  }

  /// `Training`
  String get Training {
    return Intl.message(
      'Training',
      name: 'Training',
      desc: '',
      args: [],
    );
  }

  /// `protein`
  String get protein {
    return Intl.message(
      'protein',
      name: 'protein',
      desc: '',
      args: [],
    );
  }

  /// `Carbs`
  String get Carbs {
    return Intl.message(
      'Carbs',
      name: 'Carbs',
      desc: '',
      args: [],
    );
  }

  /// `PreWorkout`
  String get PreWorkout {
    return Intl.message(
      'PreWorkout',
      name: 'PreWorkout',
      desc: '',
      args: [],
    );
  }

  /// `BCAAS`
  String get BCAAS {
    return Intl.message(
      'BCAAS',
      name: 'BCAAS',
      desc: '',
      args: [],
    );
  }

  /// `Omega`
  String get omega {
    return Intl.message(
      'Omega',
      name: 'omega',
      desc: '',
      args: [],
    );
  }

  /// `Vitamins`
  String get Vitamins {
    return Intl.message(
      'Vitamins',
      name: 'Vitamins',
      desc: '',
      args: [],
    );
  }

  /// `Glutathione`
  String get Glutathione {
    return Intl.message(
      'Glutathione',
      name: 'Glutathione',
      desc: '',
      args: [],
    );
  }

  /// `Wake Up`
  String get WakeUp {
    return Intl.message(
      'Wake Up',
      name: 'WakeUp',
      desc: '',
      args: [],
    );
  }

  /// `Sleep`
  String get Sleep {
    return Intl.message(
      'Sleep',
      name: 'Sleep',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Work Out' key

  /// `Vitamin A`
  String get Vitamin_A {
    return Intl.message(
      'Vitamin A',
      name: 'Vitamin_A',
      desc: '',
      args: [],
    );
  }

  /// `Vitamin B Complex`
  String get Vitamin_B {
    return Intl.message(
      'Vitamin B Complex',
      name: 'Vitamin_B',
      desc: '',
      args: [],
    );
  }

  /// `Vitamin C`
  String get Vitamin_C {
    return Intl.message(
      'Vitamin C',
      name: 'Vitamin_C',
      desc: '',
      args: [],
    );
  }

  /// `Vitamin D`
  String get Vitamin_D {
    return Intl.message(
      'Vitamin D',
      name: 'Vitamin_D',
      desc: '',
      args: [],
    );
  }

  /// `Vitamin E`
  String get Vitamin_E {
    return Intl.message(
      'Vitamin E',
      name: 'Vitamin_E',
      desc: '',
      args: [],
    );
  }

  /// `Omega3`
  String get Omega3 {
    return Intl.message(
      'Omega3',
      name: 'Omega3',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
