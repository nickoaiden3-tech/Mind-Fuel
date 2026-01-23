import 'package:flutter/material.dart';
import 'package:mind_fuel_application/Hard Pages/learn_page_hard.dart';

class RelatedRates extends StatelessWidget {
  final CategoryHard category;

  const RelatedRates({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 29, 61),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 29, 61),
        title: const Text(
          'Related Rates',
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
                'Connecting Changing Quantities',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Finding rates through relationships and careful setup',
                style: TextStyle(
                  color: Color.fromARGB(150, 211, 210, 233),
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 32),

              _buildPhilosophyCard(),
              const SizedBox(height: 20),

              _buildUnitsCard(),
              const SizedBox(height: 20),

              _buildMethodCard(),
              const SizedBox(height: 20),

              _buildExampleCard(),
              const SizedBox(height: 20),

              _buildPitfallsCard(),
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
                        builder: (context) => const PracticePageHard(category: CategoryHard.RelatedRates),
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

  Widget _buildPhilosophyCard() {
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
                'The Core Philosophy',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Related rates problems are about finding how different changing quantities are connected. The key isn\'t speed—it\'s careful setup. A perfectly set up problem solves itself; a rushed setup leads to wrong answers no matter how fast you calculate.',
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

  Widget _buildUnitsCard() {
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
                '⚠️ CRITICAL: Units Matter More Than Speed',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Always check units before starting. If one rate is in meters/second and another is in kilometers/hour, convert first. If volume is in cm³ and radius in cm, make sure derivatives have consistent units. Wrong units = wrong answer, regardless of math.',
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

  Widget _buildMethodCard() {
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
                'The 5-Step Method (Follow in Order)',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
              _buildMethodStep(
                '1',
                'Draw & Label',
                'Draw a clear diagram. Label ALL quantities with variables. Identify what\'s given and what\'s asked for.',
              ),
              const SizedBox(height: 12),
              _buildMethodStep(
                '2',
                'Write Relating Equation',
                'Find the geometric/physical relationship between variables. Common: Pythagorean, Volume formulas, Similar triangles.',
              ),
              const SizedBox(height: 12),
              _buildMethodStep(
                '3',
                'Differentiate with Respect to Time',
                'Differentiate ENTIRE equation with respect to t. Use chain rule. Every variable gets its own derivative factor.',
              ),
              const SizedBox(height: 12),
              _buildMethodStep(
                '4',
                'Plug in Known Values',
                'Substitute ALL known numbers AND rates at the specific instant. Never plug in earlier! Include units.',
              ),
              const SizedBox(height: 12),
              _buildMethodStep(
                '5',
                'Solve for Unknown Rate',
                'Isolate the desired rate. Check sign: positive means increasing, negative means decreasing.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMethodStep(String num, String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 211, 210, 233),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  num,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 31, 29, 61),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                color: Color.fromARGB(255, 211, 210, 233),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Text(
            description,
            style: const TextStyle(
              color: Color.fromARGB(200, 211, 210, 233),
              fontSize: 12,
              height: 1.4,
            ),
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
                'Example: Ladder Sliding Down Wall',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Problem: 10 ft ladder slides down wall. When bottom is 6 ft from wall, it moves at 2 ft/s. How fast is top sliding down?',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 12),
              _buildExampleStep('Step 1', 'Draw: Right triangle. x = distance from wall, y = height on wall, L = 10 ft ladder. Given: dx/dt = 2 ft/s when x = 6 ft. Find: dy/dt.'),
              const SizedBox(height: 8),
              _buildExampleStep('Step 2', 'Equation: x² + y² = 10² (Pythagorean)'),
              const SizedBox(height: 8),
              _buildExampleStep('Step 3', 'Differentiate: 2x(dx/dt) + 2y(dy/dt) = 0'),
              const SizedBox(height: 8),
              _buildExampleStep('Step 4', 'Plug: x = 6 → y = 8. So: 2(6)(2) + 2(8)(dy/dt) = 0'),
              const SizedBox(height: 8),
              _buildExampleStep('Step 5', 'Solve: 24 + 16(dy/dt) = 0 → dy/dt = -1.5 ft/s (height decreasing)'),
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
            fontSize: 12,
            height: 1.4,
          ),
        ),
      ],
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
                'Common Pitfalls to Avoid',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              _buildPitfall('Plugging numbers BEFORE differentiating (must differentiate general equation first)'),
              const SizedBox(height: 8),
              _buildPitfall('Forgetting chain rule factors (dy/dt, dx/dt, etc.)'),
              const SizedBox(height: 8),
              _buildPitfall('Mixing units (inches vs feet, minutes vs seconds)'),
              const SizedBox(height: 8),
              _buildPitfall('Not drawing a diagram (visualization is essential)'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPitfall(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '• ',
          style: TextStyle(
            color: Color.fromARGB(255, 211, 210, 233),
            fontSize: 12,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(200, 211, 210, 233),
              fontSize: 12,
              height: 1.4,
            ),
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
                'Speed doesn\'t matter if you\'re solving the wrong problem. Take time on steps 1-2 (drawing and equation). If those are correct, the math will be straightforward. If you rush and get them wrong, no amount of calculus will save you.',
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