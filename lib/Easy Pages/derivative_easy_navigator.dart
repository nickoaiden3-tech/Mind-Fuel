import 'package:flutter/material.dart';

import 'package:mind_fuel_application/Easy Pages/easy_derivative_definiton.dart';
import 'package:mind_fuel_application/Easy Pages/easy_power_rule.dart';
import 'package:mind_fuel_application/Easy Pages/easy_constants.dart';
import 'package:mind_fuel_application/Easy Pages/easy_trig_exp_log.dart';
import 'package:mind_fuel_application/Easy%20Pages/learn_page_easy.dart';

class DerivativeEasyNavigator extends StatelessWidget {
  const DerivativeEasyNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 29, 61),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 29, 61),
        title: const Text(
          'Derivative Easy Navigator', 
          style: TextStyle(
            color: Color.fromARGB(255, 211, 210, 233),
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // With grey subtitle
            const Text(
              'Select Learning Topic',
              style: TextStyle(
                color: Color.fromARGB(255, 211, 210, 233),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tap any topic below to begin',
              style: TextStyle(
                color: Color.fromARGB(180, 211, 210, 233), // Grey text
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 40),
            
            _buildProfessionalButton(
              text: 'Derivative Definition',
              icon: Icons.functions,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EasyDerivativeDefinition(category: Category.basicDefinition,),
                  ),
                );
              },
            ),
            
            const SizedBox(height: 16),
            
            _buildProfessionalButton(
              text: 'Power Rule',
              icon: Icons.bolt,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DerivativePowerRule(category: Category.powerRule,),
                  ),
                );
              },
            ),
            
            const SizedBox(height: 16),
            
            _buildProfessionalButton(
              text: 'Constants Rule',
              icon: Icons.format_list_numbered,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DerivativeConstant(category: Category.constants,),
                  ),
                );
              },
            ),
            
            const SizedBox(height: 16),
            
            _buildProfessionalButton(
              text: 'Exponential, Logarithmic, and Trigonometric Functions',
              icon: Icons.calculate,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DerivativeTrigExpLog(category: Category.trigExpLog,),
                  ),
                );
              },
              isMultiline: true,
            ),
            
            const SizedBox(height: 40),
            
            Container(
              height: 1,
              width: 200,
              color: const Color.fromARGB(80, 211, 210, 233),
            ),
            const SizedBox(height: 20),
            
            const Text(
              'Choose a topic to learn derivative rules',
              style: TextStyle(
                color: Color.fromARGB(150, 211, 210, 233), // More grey text
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfessionalButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
    bool isMultiline = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: const Color.fromARGB(255, 44, 42, 75),
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(40, 211, 210, 233),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: const Color.fromARGB(255, 211, 210, 233),
                    size: 22,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 211, 210, 233),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: isMultiline ? 2 : 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 12),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Color.fromARGB(180, 211, 210, 233),
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
