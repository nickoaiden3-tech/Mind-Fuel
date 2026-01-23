import 'package:flutter/material.dart';
import 'package:mind_fuel_application/Medium%20Pages/learn_page_medium.dart';
import 'package:mind_fuel_application/Pages/home_page.dart';
import 'package:mind_fuel_application/Easy%20Pages/learn_page_easy.dart';


import 'package:mind_fuel_application/Hard Pages/derivatives_hard_navigator.dart';
import 'package:mind_fuel_application/Easy%20Pages/derivative_easy_navigator.dart';


import 'package:mind_fuel_application/Easy Pages/easy_trig_exp_log.dart';
import 'package:mind_fuel_application/Easy Pages/easy_constants.dart';
import 'package:mind_fuel_application/Easy Pages/easy_power_rule.dart';
import 'package:mind_fuel_application/Easy Pages/easy_derivative_definiton.dart';


//Medium Pages imported files
import 'package:mind_fuel_application/Medium Pages/learn_page_medium.dart';
import 'package:mind_fuel_application/Medium Pages/recognizing_structure.dart';
import 'package:mind_fuel_application/Medium%20Pages/derivatives_medium_navigator.dart';
import 'package:mind_fuel_application/Medium Pages/Product_rule.dart';
import 'package:mind_fuel_application/Medium Pages/quotient_rule.dart';
import 'package:mind_fuel_application/Medium Pages/chain_rule.dart';

import 'package:mind_fuel_application/Hard Pages/learn_page_hard.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //this gets rid of the debug tag in the top right.
      home: HomePage(),  
// this code sets the other tap named home_page.dart as the main page, 
//so we code the first page on that tab. this is so we dont have all the 
//code on the same file.
      routes: {
       
        '/derivativeeasynavigator': (context) => const DerivativeEasyNavigator(),
       
        

       
       
       
       //Easy
        '/learnpageEasy': (context) => const PracticePageEasy(category: Category.basicDefinition),
       
       //Pages Easy Catagories
        '/constant_easy': (context) => const DerivativeConstant(category: Category.constants),
        '/exp_log_easy': (context) => const DerivativeTrigExpLog(category: Category.trigExpLog),
        '/easy_derivative_definition': (context) => const EasyDerivativeDefinition(category: Category.basicDefinition),
        '/power_rule_easy': (context) => const DerivativePowerRule(category: Category.powerRule),


       
       
        //Medium
        
        
        //medium Page Catagories
        '/recognizing_structure': (context) => const RecognizingStructure(category: CategoryMedium.RecognizingStructure),
        '/product_rule': (context) => const ProductRule(category: CategoryMedium.ProductRule),
        '/quotient_rule': (context) => const QuotientRule(category: CategoryMedium.QuotientRule),
        '/chain_rule': (context) => const ChainRulePage(category: CategoryMedium.ChainRule),
        
        
        
      },
      

    );
  }
} 