import 'package:flutter/material.dart';
import 'package:mind_fuel_application/Hard Pages/learn_page_hard.dart';

class MotionInterpretation extends StatelessWidget {
  final CategoryHard category;

  const MotionInterpretation({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 29, 61),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 29, 61),
        title: const Text(
          'Motion Interpretation',
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
                'Understanding Motion Through Derivatives',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Interpret position, velocity, and acceleration relationships',
                style: TextStyle(
                  color: Color.fromARGB(150, 211, 210, 233),
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 32),
              
              _buildHierarchyCard(),
              const SizedBox(height: 20),
              
              _buildPositionCard(),
              const SizedBox(height: 20),
              
              _buildVelocityCard(),
              const SizedBox(height: 20),
              
              _buildAccelerationCard(),
              const SizedBox(height: 20),
              
              _buildSignsCard(),
              const SizedBox(height: 20),
              
              _buildApplicationCard(),
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
                        builder: (context) => const PracticePageHard(category: CategoryHard.MotionInterpretation),
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

  Widget _buildHierarchyCard() {
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
                'The Hierarchy of Motion',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Position → Velocity → Acceleration',
                style: TextStyle(
                  color: Color.fromARGB(255, 180, 200, 220),
                  fontSize: 14,
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'This is the fundamental relationship in motion analysis. Each is the derivative of the previous: Velocity is the derivative of Position. Acceleration is the derivative of Velocity. Understanding this flow is key to interpreting motion problems.',
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

  Widget _buildPositionCard() {
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
                '1. Position s(t)',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Position tells WHERE an object is relative to a reference point (usually the origin). s(t) positive = right/up from origin. s(t) negative = left/down from origin. Position alone doesn\'t tell you about movement.',
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

  Widget _buildVelocityCard() {
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
                '2. Velocity v(t) = s\'(t)',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Velocity tells HOW FAST and IN WHAT DIRECTION.',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              _buildVelocityBullet('v(t) > 0: Moving RIGHT/UP (positive direction)'),
              const SizedBox(height: 6),
              _buildVelocityBullet('v(t) < 0: Moving LEFT/DOWN (negative direction)'),
              const SizedBox(height: 6),
              _buildVelocityBullet('v(t) = 0: Object is STOPPED (instantaneously at rest)'),
              const SizedBox(height: 10),
              const Text(
                'Speed = |v(t)| (absolute value, always positive). Speed tells how fast regardless of direction.',
                style: TextStyle(
                  color: Color.fromARGB(200, 211, 210, 233),
                  fontSize: 12,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVelocityBullet(String text) {
    return Text(
      '• $text',
      style: const TextStyle(
        color: Color.fromARGB(255, 211, 210, 233),
        fontSize: 12,
      ),
    );
  }

  Widget _buildAccelerationCard() {
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
                '3. Acceleration a(t) = v\'(t) = s\'\'(t)',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Acceleration tells HOW VELOCITY IS CHANGING.',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              _buildAccelBullet('a(t) > 0: Velocity is INCREASING (speeding up if v>0, slowing down if v<0)'),
              const SizedBox(height: 6),
              _buildAccelBullet('a(t) < 0: Velocity is DECREASING (slowing down if v>0, speeding up if v<0)'),
              const SizedBox(height: 6),
              _buildAccelBullet('a(t) = 0: Velocity is CONSTANT (not changing)'),
              const SizedBox(height: 10),
              const Text(
                'Critical: Acceleration sign does NOT tell if object is speeding up or slowing down! You need BOTH velocity and acceleration signs.',
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

  Widget _buildAccelBullet(String text) {
    return Text(
      '• $text',
      style: const TextStyle(
        color: Color.fromARGB(255, 211, 210, 233),
        fontSize: 12,
      ),
    );
  }

  Widget _buildSignsCard() {
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
                'Signs Tell Direction: The Complete Picture',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
              _buildSignRule('Speeding Up:', 'When velocity and acceleration have SAME sign\n(v>0 and a>0) OR (v<0 and a<0)'),
              const SizedBox(height: 12),
              _buildSignRule('Slowing Down:', 'When velocity and acceleration have OPPOSITE signs\n(v>0 and a<0) OR (v<0 and a>0)'),
              const SizedBox(height: 12),
              _buildExample('Example 1:', 'Car moving right (v>0) and accelerating right (a>0) = Speeding up'),
              const SizedBox(height: 8),
              _buildExample('Example 2:', 'Car moving right (v>0) and braking (a<0) = Slowing down'),
              const SizedBox(height: 8),
              _buildExample('Example 3:', 'Car moving left (v<0) and accelerating left (a<0) = Speeding up (in negative direction)'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignRule(String title, String description) {
    return Column(
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
    );
  }

  Widget _buildExample(String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 70,
          child: Text(
            title,
            style: const TextStyle(
              color: Color.fromARGB(255, 211, 210, 233),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
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

  Widget _buildApplicationCard() {
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
                'Practical Application Steps',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
              _buildStep(
                number: '1',
                title: 'Given s(t), find v(t) = s\'(t) and a(t) = v\'(t)',
                description: '',
              ),
              const SizedBox(height: 12),
              _buildStep(
                number: '2',
                title: 'Find when object stops: Solve v(t) = 0',
                description: '',
              ),
              const SizedBox(height: 12),
              _buildStep(
                number: '3',
                title: 'Determine direction on intervals: Check sign of v(t)',
                description: '',
              ),
              const SizedBox(height: 12),
              _buildStep(
                number: '4',
                title: 'Find speeding up/slowing down: Compare signs of v(t) and a(t)',
                description: '',
              ),
              const SizedBox(height: 12),
              _buildStep(
                number: '5',
                title: 'Interpret position changes: s(t) based on v(t) sign',
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
                'The sign tells the story. Positive = increasing/moving right. Negative = decreasing/moving left. Zero = stopped/constant. But remember: positive acceleration doesn\'t mean speeding up if velocity is negative! Always check both signs together.',
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