import 'package:flutter/material.dart';
import 'package:mind_fuel_application/Medium Pages/learn_page_medium.dart';
import 'package:mind_fuel_application/Medium Pages/product_rule.dart';
import 'package:mind_fuel_application/Medium Pages/quotient_rule.dart';
import 'package:mind_fuel_application/Medium Pages/chain_rule.dart';
import 'package:mind_fuel_application/Medium Pages/recognizing_structure.dart';


class DerivativeMediumNavigator extends StatelessWidget {
  
  final CategoryMedium category;
  
  const DerivativeMediumNavigator({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 29, 61),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 29, 61),
        title: const Text(
          'Derivative Medium Navigator', 
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
            // Title only
            const Text(
              'Intermediate Topics',
              style: TextStyle(
                color: Color.fromARGB(255, 211, 210, 233),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            
            // Product Rule Button
            _buildMediumButton(
              text: 'Recognizing structure',
              icon: Icons.close,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecognizingStructure(category: category)
                  ),
                );
              },
            ),
            
            const SizedBox(height: 16),
            
            // Quotient Rule Button
            _buildMediumButton(
              text: 'Product Rule',
              icon: Icons.percent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductRule(category: category),
                  ),
                );
              },
            ),
            
            const SizedBox(height: 16),
            
            // Chain Rule Button
            _buildMediumButton(
              text: 'Quotient Rule',
              icon: Icons.link,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuotientRule(category: category),
                  ),
                );
              },
            ),
            
            const SizedBox(height: 16),
            
            // Recognizing Structure Button
            _buildMediumButton(
              text: 'Chain Rule',
              icon: Icons.psychology,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChainRulePage(category: category),  
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMediumButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: const Color.fromARGB(255, 44, 42, 75),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(40, 211, 210, 233),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    color: const Color.fromARGB(255, 211, 210, 233),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 211, 210, 233),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
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