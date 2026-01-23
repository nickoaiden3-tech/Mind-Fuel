import 'package:flutter/material.dart';
import 'package:mind_fuel_application/Medium Pages/learn_page_medium.dart';


class RecognizingStructure extends StatelessWidget {
  
  final CategoryMedium category;
 
  const RecognizingStructure({Key? key, required this.category}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 29, 61),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 29, 61),
        title: const Text(
          'Recognizing Structure',
          style: TextStyle(
            color: Color.fromARGB(255, 211, 210, 233),
            fontSize: 22,
            fontWeight: FontWeight.w600,
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
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Master Rule Recognition',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Learn to identify which differentiation rule to apply',
                style: TextStyle(
                  color: Color.fromARGB(150, 211, 210, 233),
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 32),

              _buildRuleCard(
                icon: Icons.close,
                ruleTitle: 'Product Rule',
                pattern: 'f(x) · g(x)',
                description: 'Use when two expressions are multiplied together and both are functions of x.',
                examples: [
                  'x³ · cos(x)',
                  'eˣ · ln(x)',
                  '(2x+1) · √x',
                ],
              ),
              const SizedBox(height: 20),

              _buildRuleCard(
                icon: Icons.trending_down,
                ruleTitle: 'Quotient Rule',
                pattern: 'f(x) ÷ g(x)',
                description: 'Use when two expressions are divided and both are functions of x.',
                examples: [
                  'x² ÷ tan(x)',
                  'eˣ ÷ ln(x)',
                  '(3x+4) ÷ √x',
                ],
              ),
              const SizedBox(height: 20),

              _buildRuleCard(
                icon: Icons.layers,
                ruleTitle: 'Chain Rule',
                pattern: 'f(g(x))',
                description: 'Use when one expression is composed inside another (function of a function).',
                examples: [
                  'sin(3x)',
                  '√(2x+5)',
                  'e^(x²)',
                ],
              ),
              const SizedBox(height: 32),

              _buildContentCard(
                title: 'Quick Decision Guide',
                content: 'Check if both parts are functions of x. For products/quotients: Yes → use Product/Quotient Rule, No → simplify first. For composition: Is one function applied to another? Yes → use Chain Rule.',
              ),









              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PracticePageMedium(category: CategoryMedium.RecognizingStructure),
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

  Widget _buildRuleCard({
    required IconData icon,
    required String ruleTitle,
    required String pattern,
    required String description,
    required List<String> examples,
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
              Row(
                children: [
                  Icon(
                    icon,
                    color: const Color.fromARGB(255, 211, 210, 233),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    ruleTitle,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 211, 210, 233),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(30, 100, 150, 200),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: const Color.fromARGB(80, 100, 150, 200),
                  ),
                ),
                child: Text(
                  pattern,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 211, 210, 233),
                    fontSize: 13,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: const TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              ...examples.map((example) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Row(
                    children: [
                      const Text(
                        '✓ ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 144, 238, 144),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          example,
                          style: const TextStyle(
                            color: Color.fromARGB(200, 211, 210, 233),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentCard({
    required String title,
    required String content,
    bool isWarning = false,
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
}
