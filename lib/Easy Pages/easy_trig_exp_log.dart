import 'package:flutter/material.dart';
import 'package:mind_fuel_application/Easy%20Pages/learn_page_easy.dart';

class DerivativeTrigExpLog extends StatelessWidget {
  final Category category;

  const DerivativeTrigExpLog({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 29, 61),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 29, 61),
        title: const Text(
          'Trig, Exponential & Log',
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
                'Key Derivatives to Remember',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Trigonometric, exponential, and logarithmic functions',
                style: TextStyle(
                  color: Color.fromARGB(150, 211, 210, 233),
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 32),

              _buildContentCard(
                title: 'Why Memorize These?',
                content: 'These are the fundamental derivatives you\'ll use constantly in calculus. Knowing them by heart will save you time and improve your problem-solving speed.',
              ),
              const SizedBox(height: 20),

              _buildTrigFunctionsCard(),
              const SizedBox(height: 20),

              _buildExpLogFunctionsCard(),
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

  Widget _buildTrigFunctionsCard() {
    final List<String> trigDerivatives = [
      'sin(x) → cos(x)',
      'cos(x) → -sin(x)',
      'tan(x) → sec²(x)',
      'csc(x) → -csc(x)cot(x)',
      'sec(x) → sec(x)tan(x)',
      'cot(x) → -csc²(x)',
    ];

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
                'Trigonometric Functions',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              ...trigDerivatives.map((formula) => _buildFormulaItem(formula)).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpLogFunctionsCard() {
    final List<String> expLogDerivatives = [
      'eˣ → eˣ',
      'aˣ → aˣ·ln(a)',
      'ln(x) → 1/x',
      'logₐ(x) → 1/(x·ln(a))',
    ];

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
                'Exponential & Logarithmic Functions',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              ...expLogDerivatives.map((formula) => _buildFormulaItem(formula)).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormulaItem(String formula) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 211, 210, 233),
            ),
          ),
          Expanded(
            child: Text(
              formula,
              style: const TextStyle(
                fontSize: 13,
                color: Color.fromARGB(200, 211, 210, 233),
                fontFamily: 'monospace',
              ),
            ),
          ),
        ],
      ),
    );
  }
}