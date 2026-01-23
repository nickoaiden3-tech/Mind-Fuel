import 'package:flutter/material.dart';
import 'package:mind_fuel_application/Easy%20Pages/learn_page_easy.dart';

class DerivativePowerRule extends StatelessWidget {
  final Category category;

  const DerivativePowerRule({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 29, 61),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 29, 61),
        title: const Text(
          'The Power Rule',
          style: TextStyle(
            color: Color.fromARGB(255, 211, 210, 233),
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
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
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Master the Power Rule',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'The simplest and most useful differentiation rule',
                style: TextStyle(
                  color: Color.fromARGB(150, 211, 210, 233),
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 32),

              _buildContentCard(
                title: 'What is the Power Rule?',
                content: 'To find the derivative of x raised to any power, "bring down" the power and reduce it by 1. This is the fastest and easiest rule to use!',
              ),
              const SizedBox(height: 20),

              _buildFormulaCard(
                formula: 'd/dx(xⁿ) = n·xⁿ⁻¹',
                explanation: 'Bring down the exponent n as a coefficient, then reduce the exponent by 1.',
              ),
              const SizedBox(height: 20),

              _buildStepsCard(),
              const SizedBox(height: 20),

              _buildApplicationsCard(),
              const SizedBox(height: 20),

              _buildContentCard(
                title: 'Important Limitation',
                content: 'The power rule ONLY works for variables with exponents. Constants (numbers without variables) have a derivative of 0. It does not work for 2ˣ, eˣ, sin(x), or other non-power functions.',
              ),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PracticePageEasy(category: category),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 211, 210, 233),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Start Practice',
                    style: TextStyle(
                      color: Color.fromARGB(255, 31, 29, 61),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentCard({
    required String title,
    required String content,
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
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                content,
                style: const TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormulaCard({
    required String formula,
    required String explanation,
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
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(30, 100, 150, 200),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color.fromARGB(80, 100, 150, 200),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Formula:',
                      style: TextStyle(
                        color: Color.fromARGB(255, 211, 210, 233),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      formula,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 211, 210, 233),
                        fontSize: 16,
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                explanation,
                style: const TextStyle(
                  color: Color.fromARGB(200, 211, 210, 233),
                  fontSize: 12,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepsCard() {
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
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Example: Find the derivative of x⁴',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              _buildStep(
                number: '1',
                title: 'Identify n',
                description: 'In x⁴, the exponent n = 4',
              ),
              const SizedBox(height: 16),
              _buildStep(
                number: '2',
                title: 'Bring down the exponent',
                description: 'Write n in front: 4·x',
              ),
              const SizedBox(height: 16),
              _buildStep(
                number: '3',
                title: 'Reduce the exponent by 1',
                description: 'Subtract 1 from the power: 4·x³',
              ),
              const SizedBox(height: 16),
              _buildStep(
                number: '✓',
                title: 'Final Answer',
                description: 'd/dx(x⁴) = 4x³',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep({
    required String number,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 211, 210, 233),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                color: Color.fromARGB(255, 31, 29, 61),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  color: Color.fromARGB(200, 211, 210, 233),
                  fontSize: 12,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildApplicationsCard() {
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
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Works for All Types of Powers',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              _buildExample('Positive integers:', 'x² → 2x,  x³ → 3x²,  x⁴ → 4x³'),
              const SizedBox(height: 10),
              _buildExample('Negative integers:', 'x⁻¹ → -x⁻²,  x⁻² → -2x⁻³'),
              const SizedBox(height: 10),
              _buildExample('Fractions:', 'x^(1/2) → (1/2)x^(-1/2),  x^(3/2) → (3/2)x^(1/2)'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExample(String category, String examples) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: const TextStyle(
            color: Color.fromARGB(255, 211, 210, 233),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          examples,
          style: const TextStyle(
            color: Color.fromARGB(200, 211, 210, 233),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}