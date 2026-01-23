import 'package:flutter/material.dart';
import 'package:mind_fuel_application/Hard Pages/learn_page_hard.dart';

class ImplicitDifferentiation extends StatelessWidget {
  final CategoryHard category;

  const ImplicitDifferentiation({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 29, 61),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 29, 61),
        title: const Text(
          'Implicit Differentiation',
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
                'When Functions Hide Their Secrets',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Master differentiation when y cannot be isolated',
                style: TextStyle(
                  color: Color.fromARGB(150, 211, 210, 233),
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 32),
              
              _buildContentCard(
                title: 'The "Why" Behind Implicit Differentiation',
                content: 'Sometimes You Can\'t Solve for y = f(x). Explicit functions like y = x² + 3x - 5 have y isolated. Implicit relations like x² + y² = 25 have y mixed with x. Some equations are impossible or very difficult to solve for y explicitly. That\'s where implicit differentiation comes in!',
              ),
              const SizedBox(height: 20),
              
              _buildContentCard(
                title: 'The Core Mental Shift',
                content: 'Treat y as y(x) — a function of x! Even when you don\'t know the explicit formula for y(x), you know it depends on x. This changes everything: Now d/dx(y) isn\'t zero — it\'s dy/dx!',
              ),
              const SizedBox(height: 20),
              
              _buildFormulaCard(
                formula: 'd/dx(y²) = 2y(dy/dx)',
                explanation: 'Think: y² means [y(x)]². By the chain rule, the derivative of (something)² is 2(something) × derivative of something. So: d/dx(y²) = 2y × d/dx(y) = 2y(dy/dx). This isn\'t magic — it\'s just the chain rule recognizing that y depends on x!',
              ),
              const SizedBox(height: 20),
              
              _buildPatternsCard(),
              const SizedBox(height: 20),
              
              _buildStepsCard(),
              const SizedBox(height: 20),
              
              _buildExampleCard(),
              const SizedBox(height: 20),
              
              _buildPitfallsCard(),
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
                        builder: (context) => PracticePageHard(category: CategoryHard.ImplicitDifferentiation),
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
                      'The Golden Rule:',
                      style: TextStyle(
                        color: Color.fromARGB(200, 150, 180, 220),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      formula,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 180, 200, 220),
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

  Widget _buildPatternsCard() {
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
                'Common Patterns (The "y" Rules)',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
              _buildPatternLine('d/dx(yⁿ) = ', 'nyⁿ⁻¹(dy/dx)'),
              const SizedBox(height: 10),
              _buildPatternLine('d/dx(eʸ) = ', 'eʸ(dy/dx)'),
              const SizedBox(height: 10),
              _buildPatternLine('d/dx(ln y) = ', '(1/y)(dy/dx)'),
              const SizedBox(height: 10),
              _buildPatternLine('d/dx(sin y) = ', 'cos y(dy/dx)'),
              const SizedBox(height: 12),
              const Text(
                'Notice the pattern: Every y-derivative gets a (dy/dx) multiplier!',
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

  Widget _buildPatternLine(String prefix, String pattern) {
    return Row(
      children: [
        Expanded(
          child: Text(
            prefix,
            style: const TextStyle(
              color: Color.fromARGB(255, 211, 210, 233),
              fontSize: 13,
            ),
          ),
        ),
        Expanded(
          child: Text(
            pattern,
            style: const TextStyle(
              color: Color.fromARGB(255, 180, 200, 220),
              fontSize: 13,
              fontWeight: FontWeight.w600,
              fontFamily: 'monospace',
            ),
          ),
        ),
      ],
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
                'Step-by-Step Thinking Process',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
              _buildStep(
                number: '1',
                title: 'Differentiate BOTH sides with respect to x',
                description: '',
              ),
              const SizedBox(height: 12),
              _buildStep(
                number: '2',
                title: 'For every y-term: Apply the appropriate "y-rule"',
                description: 'Include dy/dx!',
              ),
              const SizedBox(height: 12),
              _buildStep(
                number: '3',
                title: 'For x-terms: Differentiate normally',
                description: 'No dy/dx needed',
              ),
              const SizedBox(height: 12),
              _buildStep(
                number: '4',
                title: 'Collect all dy/dx terms on one side',
                description: '',
              ),
              const SizedBox(height: 12),
              _buildStep(
                number: '5',
                title: 'Factor out dy/dx and solve for it',
                description: '',
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
              if (description.isNotEmpty) ...[
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
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExampleCard() {
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
                'Example: x² + y² = 25',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Step 1: Differentiate both sides',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              _buildExampleLine('d/dx(x²) + d/dx(y²) = d/dx(25)'),
              _buildExampleLine('2x + 2y(dy/dx) = 0'),
              const SizedBox(height: 12),
              const Text(
                'Step 2: Isolate dy/dx',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              _buildExampleLine('2y(dy/dx) = -2x'),
              _buildExampleLine('dy/dx = -x/y', highlight: true),
              const SizedBox(height: 10),
              const Text(
                'Notice: The answer contains BOTH x and y! That\'s normal for implicit differentiation.',
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

  Widget _buildExampleLine(String content, {bool highlight = false}) {
    return Text(
      content,
      style: TextStyle(
        color: highlight
            ? const Color.fromARGB(255, 180, 200, 220)
            : const Color.fromARGB(255, 211, 210, 233),
        fontSize: 12,
        fontFamily: 'monospace',
        fontWeight: highlight ? FontWeight.w700 : FontWeight.normal,
      ),
    );
  }

  Widget _buildPitfallsCard() {
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
                'Common Pitfalls & Tips',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
              _buildTip('🚫 Don\'t forget the dy/dx on y-terms!'),
              const SizedBox(height: 10),
              _buildTip('✅ Product/Quotient Rule still apply: d/dx(xy) = x(dy/dx) + y'),
              const SizedBox(height: 10),
              _buildTip('🎯 Remember: dy/dx answers often contain both x AND y'),
              const SizedBox(height: 10),
              _buildTip('💡 If you need slope at a point: plug in BOTH x and y coordinates'),
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
                'Implicit differentiation isn\'t a new rule — it\'s the chain rule applied to situations where y secretly depends on x. The "dy/dx" is the "missing link" that connects y-changes to x-changes.',
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