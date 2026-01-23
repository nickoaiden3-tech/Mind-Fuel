import 'package:flutter/material.dart';
import 'package:mind_fuel_application/Hard Pages/learn_page_hard.dart';

class LogarithmicDifferentiation extends StatelessWidget {
  final CategoryHard category;

  const LogarithmicDifferentiation({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 29, 61),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 29, 61),
        title: const Text(
          'Logarithmic Differentiation',
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
                'The Power Tool for Complex Functions',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Master differentiation with variables in exponents',
                style: TextStyle(
                  color: Color.fromARGB(150, 211, 210, 233),
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 32),
              
              _buildContentCard(
                title: 'When Regular Rules Break Down',
                content: 'Power Rule works for xⁿ (n is constant). Exponential Rule works for aˣ (a is constant). But what about xˣ? Or (sin x)^(cos x)? When the variable is in BOTH the base AND the exponent, you need logarithmic differentiation!',
              ),
              const SizedBox(height: 20),
              
              _buildScenariosCard(),
              const SizedBox(height: 20),
              
              _buildMagicCard(),
              const SizedBox(height: 20),
              
              _buildAlgorithmCard(),
              const SizedBox(height: 20),
              
              _buildExampleXxCard(),
              const SizedBox(height: 20),
              
              _buildExampleProductCard(),
              const SizedBox(height: 20),
              
              _buildTipsCard(),
              const SizedBox(height: 20),
              
              _buildInsightCard(),
              const SizedBox(height: 32),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PracticePageHard(category: CategoryHard.LogarithmicDifferentiation),
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
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
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

  Widget _buildScenariosCard() {
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
                'When to Use It: The 3 Key Scenarios',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
              _buildScenario(
                number: '1',
                title: 'Variable in both base AND exponent',
                example: 'Examples: xˣ, (sin x)^(x²), (ln x)^(1/x)',
              ),
              const SizedBox(height: 12),
              _buildScenario(
                number: '2',
                title: 'Products/Quotients with many factors',
                example: 'Example: y = (x²+1)³·(sin x)⁵·eˣ / (x-1)²',
              ),
              const SizedBox(height: 12),
              _buildScenario(
                number: '3',
                title: 'Functions raised to variable powers',
                example: 'Example: y = (x² + 3)^(x)',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScenario({
    required String number,
    required String title,
    required String example,
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
                example,
                style: const TextStyle(
                  color: Color.fromARGB(200, 211, 210, 233),
                  fontSize: 12,
                  height: 1.4,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMagicCard() {
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
                'The Magic: Why Logarithms Work',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Logarithm Properties are Superpowers:',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              _buildProperty('ln(a·b) = ln a + ln b'),
              const SizedBox(height: 6),
              _buildProperty('ln(a/b) = ln a - ln b'),
              const SizedBox(height: 6),
              _buildProperty('ln(aⁿ) = n·ln a'),
              const SizedBox(height: 12),
              const Text(
                'These turn multiplication into addition, division into subtraction, and exponents into multiplication! This makes differentiation MUCH easier.',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 13,
                  height: 1.5,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProperty(String property) {
    return Text(
      '• $property',
      style: const TextStyle(
        color: Color.fromARGB(255, 211, 210, 233),
        fontSize: 12,
      ),
    );
  }

  Widget _buildAlgorithmCard() {
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
                'Step-by-Step Algorithm',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
              _buildStep(
                number: '1',
                title: 'Take ln of both sides',
                description: 'ln y = ln(f(x))',
              ),
              const SizedBox(height: 12),
              _buildStep(
                number: '2',
                title: 'Use log properties to simplify',
                description: 'Expand the right side',
              ),
              const SizedBox(height: 12),
              _buildStep(
                number: '3',
                title: 'Differentiate implicitly',
                description: 'Differentiate both sides',
              ),
              const SizedBox(height: 12),
              _buildStep(
                number: '4',
                title: 'Solve for dy/dx (or y\')',
                description: 'Isolate the derivative',
              ),
              const SizedBox(height: 12),
              _buildStep(
                number: '5',
                title: 'Substitute original y back in',
                description: 'Replace y with the original function',
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

  Widget _buildExampleXxCard() {
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
                'Classic Example: y = xˣ',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
              _buildExampleStep('1', 'ln y = ln(xˣ)'),
              const SizedBox(height: 10),
              _buildExampleStep('2', 'ln y = x·ln x'),
              const SizedBox(height: 10),
              _buildExampleStep('3', '(1/y)·(dy/dx) = ln x + x·(1/x)'),
              const SizedBox(height: 10),
              _buildExampleStep('4', '(1/y)·(dy/dx) = ln x + 1'),
              const SizedBox(height: 10),
              _buildExampleStep('5', 'dy/dx = y·(ln x + 1)'),
              const SizedBox(height: 10),
              _buildExampleStep('6', 'dy/dx = xˣ·(ln x + 1)', highlight: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExampleStep(String step, String content, {bool highlight = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: const Color.fromARGB(100, 211, 210, 233),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              step,
              style: const TextStyle(
                color: Color.fromARGB(255, 211, 210, 233),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            content,
            style: TextStyle(
              color: highlight
                  ? const Color.fromARGB(255, 180, 200, 220)
                  : const Color.fromARGB(255, 211, 210, 233),
              fontSize: 12,
              fontFamily: 'monospace',
              fontWeight: highlight ? FontWeight.w700 : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExampleProductCard() {
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
                'Another Example: Complex Product',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Let y = (x²+1)³·√(sin x)',
                style: TextStyle(
                  color: Color.fromARGB(255, 180, 200, 220),
                  fontSize: 12,
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              _buildProductStep('ln y = ln[(x²+1)³·√(sin x)]'),
              const SizedBox(height: 8),
              _buildProductStep('ln y = 3·ln(x²+1) + ½·ln(sin x)'),
              const SizedBox(height: 8),
              _buildProductStep('(1/y)·y\' = 3·(2x/(x²+1)) + ½·(cos x/sin x)'),
              const SizedBox(height: 8),
              _buildProductStep('y\' = y·[6x/(x²+1) + (cos x)/(2 sin x)]', highlight: true),
              const SizedBox(height: 12),
              const Text(
                'Much easier than product rule on the original!',
                style: TextStyle(
                  color: Color.fromARGB(200, 211, 210, 233),
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductStep(String content, {bool highlight = false}) {
    return Text(
      content,
      style: TextStyle(
        color: highlight
            ? const Color.fromARGB(255, 180, 200, 220)
            : const Color.fromARGB(255, 211, 210, 233),
        fontSize: 12,
        fontFamily: 'monospace',
        fontWeight: highlight ? FontWeight.w700 : FontWeight.normal,
        height: 1.4,
      ),
    );
  }

  Widget _buildTipsCard() {
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
                'Pro Tips & Common Mistakes',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
              _buildTip('✅ Always remember to multiply by y at the end!'),
              const SizedBox(height: 10),
              _buildTip('🚫 Don\'t forget implicit differentiation on ln y → (1/y)y\''),
              const SizedBox(height: 10),
              _buildTip('💡 For absolute values: ln|y| works the same, but be careful with domain'),
              const SizedBox(height: 10),
              _buildTip('🎯 When in doubt: If it has variables in exponents, use logarithmic differentiation'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTip(String content) {
    return Text(
      content,
      style: const TextStyle(
        color: Color.fromARGB(255, 211, 210, 233),
        fontSize: 12,
        height: 1.5,
      ),
    );
  }

  Widget _buildInsightCard() {
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
                '💡 Key Insight',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Logarithmic differentiation isn\'t a "different" type of differentiation — it\'s a clever trick that uses algebra (log properties) to transform a hard differentiation problem into an easier one. The ln() acts like a "differentiation assistant" that simplifies the structure before you differentiate.',
                style: TextStyle(
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
