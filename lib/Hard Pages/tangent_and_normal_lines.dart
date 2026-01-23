import 'package:flutter/material.dart';
import 'package:mind_fuel_application/Hard Pages/learn_page_hard.dart';

class TangentNormalLines extends StatelessWidget {
  final CategoryHard category;

  const TangentNormalLines({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 29, 61),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 29, 61),
        title: const Text(
          'Tangent & Normal Lines',
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
                'Finding Lines at a Point',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Point, Slope, and Line Equations',
                style: TextStyle(
                  color: Color.fromARGB(150, 211, 210, 233),
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 32),

              _buildFoundationCard(),
              const SizedBox(height: 20),

              _buildPointCard(),
              const SizedBox(height: 20),

              _buildSlopeCard(),
              const SizedBox(height: 20),

              _buildPointSlopeFormCard(),
              const SizedBox(height: 20),

              _buildCompleteExampleCard(),
              const SizedBox(height: 20),

              _buildSpecialCasesCard(),
              const SizedBox(height: 20),

              _buildKeyInsightCard(),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PracticePageHard(category: CategoryHard.TangentAndNormalLines),
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

  Widget _buildFoundationCard() {
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
                'The Three Essential Components',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '1. Point  2. Slope  3. Point-Slope Form',
                style: TextStyle(
                  color: Color.fromARGB(255, 180, 200, 220),
                  fontSize: 14,
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Every tangent/normal line problem reduces to these three elements. Master this structure and you can solve any such problem, regardless of the function complexity.',
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

  Widget _buildPointCard() {
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
                '1. The Point: Where It Touches',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'You need both coordinates (x, y). Usually given: "Find tangent at x = 3."',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              _buildPointStep('Step 1', 'Plug x into f(x) to get y'),
              const SizedBox(height: 6),
              _buildPointStep('Step 2', 'You now have point (x, f(x))'),
              const SizedBox(height: 10),
              const Text(
                'Example: f(x) = x² at x = 2: y = f(2) = 4 → Point is (2, 4)',
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

  Widget _buildPointStep(String num, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$num: ',
          style: const TextStyle(
            color: Color.fromARGB(255, 211, 210, 233),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(200, 211, 210, 233),
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSlopeCard() {
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
                '2. The Slope: From Derivative',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Slope of Tangent Line = f\'(x)',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              _buildSlopeDescription('Find derivative f\'(x). Plug the SAME x into f\'(x). Example: f(x)=x², f\'(x)=2x. At x=2: slope = f\'(2) = 4.'),
              const SizedBox(height: 14),
              const Text(
                'Slope of Normal Line = -1 / f\'(x)',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              _buildSlopeDescription('Normal line is PERPENDICULAR to tangent. If tangent slope = m, normal slope = -1/m (negative reciprocal). Example: If tangent slope = 4, normal slope = -1/4.'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlopeDescription(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color.fromARGB(200, 211, 210, 233),
        fontSize: 12,
        height: 1.4,
      ),
    );
  }

  Widget _buildPointSlopeFormCard() {
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
                '3. Point-Slope Form: Putting It Together',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(30, 100, 150, 200),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'y - y₁ = m(x - x₁)',
                  style: TextStyle(
                    color: Color.fromARGB(255, 180, 200, 220),
                    fontSize: 16,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Where (x₁, y₁) is your point and m is your slope.',
                style: TextStyle(
                  color: Color.fromARGB(200, 211, 210, 233),
                  fontSize: 12,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 12),
              _buildFormUsage('Tangent Line', 'm = f\'(x₁)\nExample: Point (2,4), slope=4 → y - 4 = 4(x - 2)'),
              const SizedBox(height: 10),
              _buildFormUsage('Normal Line', 'm = -1/f\'(x₁)\nExample: Point (2,4), slope=-1/4 → y - 4 = (-1/4)(x - 2)'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormUsage(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color.fromARGB(255, 211, 210, 233),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          description,
          style: const TextStyle(
            color: Color.fromARGB(200, 211, 210, 233),
            fontSize: 11,
            height: 1.4,
            fontFamily: 'monospace',
          ),
        ),
      ],
    );
  }

  Widget _buildCompleteExampleCard() {
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
                'Complete Example: f(x) = x³ at x = 1',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              _buildExampleStep('Step 1: Find Point', 'f(1) = 1³ = 1 → Point: (1, 1)'),
              const SizedBox(height: 8),
              _buildExampleStep('Step 2: Find Slope', 'f\'(x) = 3x² → f\'(1) = 3(1)² = 3\nTangent slope = 3, Normal slope = -1/3'),
              const SizedBox(height: 8),
              _buildExampleStep('Step 3: Tangent Equation', 'y - 1 = 3(x - 1) → y = 3x - 2'),
              const SizedBox(height: 8),
              _buildExampleStep('Step 4: Normal Equation', 'y - 1 = (-1/3)(x - 1) → y = (-1/3)x + 4/3'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExampleStep(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color.fromARGB(255, 211, 210, 233),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          description,
          style: const TextStyle(
            color: Color.fromARGB(200, 211, 210, 233),
            fontSize: 11,
            height: 1.4,
            fontFamily: 'monospace',
          ),
        ),
      ],
    );
  }

  Widget _buildSpecialCasesCard() {
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
                'Special Cases & Warnings',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              _buildCaseItem('Horizontal Tangent', 'f\'(x) = 0 → Equation: y = y₁ (constant)'),
              const SizedBox(height: 8),
              _buildCaseItem('Vertical Tangent', 'f\'(x) undefined/infinite → Equation: x = x₁ (vertical line)'),
              const SizedBox(height: 8),
              _buildCaseItem('Horizontal Normal', 'When f\'(x) undefined → normal is horizontal (y = y₁)'),
              const SizedBox(height: 8),
              _buildCaseItem('Vertical Normal', 'When f\'(x) = 0 → normal is vertical (x = x₁)'),
              const SizedBox(height: 8),
              _buildCaseItem('CRITICAL', 'Use the SAME x value for both f(x) and f\'(x)'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCaseItem(String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• ',
          style: const TextStyle(
            color: Color.fromARGB(255, 211, 210, 233),
            fontSize: 12,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 1),
              Text(
                description,
                style: const TextStyle(
                  color: Color.fromARGB(200, 211, 210, 233),
                  fontSize: 11,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildKeyInsightCard() {
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
                'The structure never changes. 1) Find the point. 2) Find the slope using derivative. 3) Use point-slope form. Whether the function is polynomial, trigonometric, exponential, or implicit—the three-step process remains the same.',
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