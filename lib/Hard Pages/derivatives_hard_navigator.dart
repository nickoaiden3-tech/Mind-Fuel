import 'package:flutter/material.dart';
import 'package:mind_fuel_application/Hard Pages/derivative_from_definition.dart';
import 'package:mind_fuel_application/Hard Pages/implicit_differentiation.dart';
import 'package:mind_fuel_application/Hard Pages/tangent_and_normal_lines.dart';
import 'package:mind_fuel_application/Hard Pages/motion_interpretation.dart';
import 'package:mind_fuel_application/Hard Pages/related_rates.dart';
import 'package:mind_fuel_application/Hard Pages/learn_page_hard.dart';
import 'package:mind_fuel_application/Hard%20Pages/logarithmic_differentiation.dart';



class DerivativesHardNavigator extends StatelessWidget {
  const DerivativesHardNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 29, 61),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 29, 61),
        title: const Text(
          'Hard Difficulty',
          style: TextStyle(
            color: Color.fromARGB(255, 211, 210, 233),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 211, 210, 233),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Advanced Topics',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 30),
              
              _buildStyledCategoryButton(
                context,
                'Implicit Differentiation',
                () => const ImplicitDifferentiation(category: CategoryHard.ImplicitDifferentiation),
              ),
              const SizedBox(height: 16),
              
              _buildStyledCategoryButton(
                context,
                'Logarithmic Differentiation',
                () => LogarithmicDifferentiation(category: CategoryHard.LogarithmicDifferentiation),
              ),
              const SizedBox(height: 16),
              
              _buildStyledCategoryButton(
                context,
                'Derivative From Definition',
                () => const DerivativeFromDefinition(category: CategoryHard.DerivativeFromDefinition),
              ),
              const SizedBox(height: 16),
              
              _buildStyledCategoryButton(
                context,
                'Related Rates',
                () => const RelatedRates(category: CategoryHard.RelatedRates),
              ),
              const SizedBox(height: 16),
              
              _buildStyledCategoryButton(
                context,
                'Motion Interpretation',
                () => const MotionInterpretation(category: CategoryHard.MotionInterpretation),
              ),
              const SizedBox(height: 16),
              
              _buildStyledCategoryButton(
                context,
                'Tangent & Normal Lines',
                () => const TangentNormalLines(category: CategoryHard.TangentAndNormalLines),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStyledCategoryButton(
    BuildContext context,
    String label,
    Widget Function() pageBuilder,
  ) {
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
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 52, 50, 85),
          foregroundColor: const Color.fromARGB(255, 211, 210, 233),
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => pageBuilder(),
            ),
          );
        },
        child: SizedBox(
          width: double.infinity,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}