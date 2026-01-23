import 'package:flutter/material.dart';
import 'package:mind_fuel_application/Medium Pages/learn_page_medium.dart';

class ProductRule extends StatelessWidget {
  final CategoryMedium category;

  const ProductRule({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 29, 61),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 29, 61),
        title: const Text(
          'The Product Rule',
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
                'Multiply with Confidence',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Learn how to differentiate products of functions',
                style: TextStyle(
                  color: Color.fromARGB(150, 211, 210, 233),
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 32),
              
              _buildContentCard(
                title: 'When to Use the Product Rule',
                content: 'The product rule is used when you need to find the derivative of a function that is the product of two or more functions. If you have a function h(x) that can be expressed as the product of two functions, say f(x) and g(x), i.e., h(x) = f(x) · g(x), then you would use the product rule to find h\'(x).',
              ),
              const SizedBox(height: 20),
              
              _buildFormulaCard(
                formula: '(fg)\' = f\'g + fg\'',
                explanation: 'To differentiate the product, take the derivative of the first function (f\') and multiply it by the second function (g), then add the product of the first function (f) and the derivative of the second function (g\').',
              ),
              const SizedBox(height: 20),
              
              _buildStepsCard(),
              const SizedBox(height: 20),
              
              _buildContentCard(
                title: 'Common Mistake',
                content: 'Never multiply the derivatives of the functions together. The product rule requires you to take the derivative of each function separately and then combine them as shown in the formula.',
                isWarning: true,
              ),
              const SizedBox(height: 32),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PracticePageMedium(category: CategoryMedium.ProductRule),
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
                style: TextStyle(
                  color: isWarning 
                    ? const Color.fromARGB(255, 255, 150, 150)
                    : const Color.fromARGB(255, 211, 210, 233),
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
                'Step-by-Step Application',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 210, 233),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
              _buildStep(
                number: '1',
                title: 'Identify f(x) and g(x)',
                description: 'For example, if h(x) = x² · sin(x), then f(x) = x² and g(x) = sin(x).',
              ),
              const SizedBox(height: 12),
              _buildStep(
                number: '2',
                title: 'Differentiate f(x) and g(x)',
                description: 'Find the derivatives f\'(x) and g\'(x). In our example, f\'(x) = 2x and g\'(x) = cos(x).',
              ),
              const SizedBox(height: 12),
              _buildStep(
                number: '3',
                title: 'Apply the Product Rule',
                description: 'Substitute f(x), g(x), f\'(x), and g\'(x) into the formula: h\'(x) = f\'(x)g(x) + f(x)g\'(x). Result: h\'(x) = (2x)(sin(x)) + (x²)(cos(x)).',
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
                  }

     