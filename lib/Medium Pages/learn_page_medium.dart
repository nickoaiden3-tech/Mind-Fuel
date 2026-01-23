import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_fuel_application/Hard Pages/derivatives_hard_navigator.dart';
import 'package:mind_fuel_application/Hard%20Pages/learn_page_hard.dart';
import 'package:mind_fuel_application/Medium%20Pages/recognizing_structure.dart';
import 'package:mind_fuel_application/Medium%20Pages/product_rule.dart';
import 'package:mind_fuel_application/Medium%20Pages/quotient_rule.dart';
import 'package:mind_fuel_application/Medium%20Pages/chain_rule.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

enum CategoryMedium { RecognizingStructure, ProductRule, QuotientRule, ChainRule }

class Question {
  final String text;
  final List<AnswerChoice> choices;
  const Question(this.text, this.choices);
}

class AnswerChoice {
  final String text;
  final bool isCorrect;
  const AnswerChoice(this.text, this.isCorrect);
}

class PracticePageMedium extends StatefulWidget {
  final CategoryMedium category;
  const PracticePageMedium({super.key, required this.category});
  @override
  State<PracticePageMedium> createState() => _PracticePageMediumState();
}

class _PracticePageMediumState extends State<PracticePageMedium> {
  @override
  void initState() {
    super.initState();
    _category = widget.category;
    _loadProgress();
  }

  List<Question> get _activeQuestions {
    switch (_category) {
      case CategoryMedium.RecognizingStructure:
        return _mediumCat1_recognizeStructure;
      case CategoryMedium.ProductRule:
        return _mediumCat2_productRule;
      case CategoryMedium.QuotientRule:
        return _mediumCat3_quotientRule;
      case CategoryMedium.ChainRule:
        return _mediumCat4_chainRule;
    }
  }

  Widget? _buildNextLevelButton() {
    if (_category == CategoryMedium.RecognizingStructure && _productRuleUnlocked) {
      return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const ProductRule(category: CategoryMedium.ProductRule),
            ),
          );
        },
        child: const Text('Learn Product Rule'),
      );
    } else if (_category == CategoryMedium.ProductRule && _quotientRuleUnlocked) {
      return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const QuotientRule(category: CategoryMedium.QuotientRule),
            ),
          );
        },
        child: const Text('Learn Quotient Rule'),
      );
    } else if (_category == CategoryMedium.QuotientRule && _chainRuleUnlocked) {
      return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChainRulePage(category: CategoryMedium.ChainRule),
            ),
          );
        },
        child: const Text('Learn Chain Rule'),
      );
    } else if (_category == CategoryMedium.ChainRule && _hardUnlocked) {
      return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const DerivativesHardNavigator(),
            ),
          );
        },
        child: const Text('Advance to Hard Difficulty'),
      );
    }
    return null;
  }

  String get _streakKey => 'streak_medium_${_category.name}';
  static const String _productRuleUnlockedKey = 'ProductRule_unlocked';
  static const String _quotientRuleUnlockedKey = 'QuotientRule_unlocked';
  static const String _chainRuleUnlockedKey = 'ChainRule_unlocked';
  static const String _hardUnlockedKey = 'Hard_unlocked';

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _streak = prefs.getInt(_streakKey) ?? 0;
      _productRuleUnlocked = prefs.getBool(_productRuleUnlockedKey) ?? false;
      _quotientRuleUnlocked = prefs.getBool(_quotientRuleUnlockedKey) ?? false;
      _chainRuleUnlocked = prefs.getBool(_chainRuleUnlockedKey) ?? false;
      _hardUnlocked = prefs.getBool(_hardUnlockedKey) ?? false;
    });
  }

  Future<void> _saveProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_streakKey, _streak);
    await prefs.setBool(_productRuleUnlockedKey, _productRuleUnlocked);
    await prefs.setBool(_quotientRuleUnlockedKey, _quotientRuleUnlocked);
    await prefs.setBool(_chainRuleUnlockedKey, _chainRuleUnlocked);
    await prefs.setBool(_hardUnlockedKey, _hardUnlocked);
  }

  int _currentQuestionIndex = 0;
  int? _selectedChoiceIndex;
  bool _answered = false;
  String? _feedbackText;

  late CategoryMedium _category;
  int _streak = 0;

  static const int _unlockTarget = 6;
  bool _productRuleUnlocked = false;
  bool _quotientRuleUnlocked = false;
  bool _chainRuleUnlocked = false;
  bool _hardUnlocked = false;

  final List<Question> _mediumCat1_recognizeStructure = [
  Question(
    'Derivative of xˣ  (hint: rewrite first)',
    const [
      AnswerChoice('xˣ ln x', false),
      AnswerChoice('ln x + 1', false),
      AnswerChoice('xˣ (ln x + 1)', true), // C
      AnswerChoice('xˣ⁻¹', false),
    ],
  ),

  Question(
    'Derivative of (sin x)³',
    const [
      AnswerChoice('3(sin x)² · cos x', true), // A
      AnswerChoice('3(sin x)²', false),
      AnswerChoice('3 sin x · cos x', false),
      AnswerChoice('cos(x³)', false),
    ],
  ),

  Question(
    'Derivative of √(1 + x²)',
    const [
      AnswerChoice('√(1 + x²)', false),
      AnswerChoice('x / √(1 + x²)', true), // B
      AnswerChoice('1 / (2√(1 + x²))', false),
      AnswerChoice('x / (1 + x²)', false),
    ],
  ),

  Question(
    'Derivative of ln((3x + 1)⁵)',
    const [
      AnswerChoice('5 ln(3x + 1)', false),
      AnswerChoice('15 / (3x + 1)', true), // B   (since d/dx ln((3x+1)^5)= 5*(3)/(3x+1)=15/(3x+1))
      AnswerChoice('5(3x + 1)', false),
      AnswerChoice('5 / (3x + 1)', false),
    ],
  ),

  Question(
    'Best first step for (x² + 1)⁷ · e^(x²)',
    const [
      AnswerChoice('Use quotient rule', false),
      AnswerChoice('Use product rule, then chain rule', true), // B
      AnswerChoice('Expand (x² + 1)⁷ first', false),
      AnswerChoice('Integrate instead', false),
    ],
  ),

  Question(
    'Derivative of (tan x)⁴',
    const [
      AnswerChoice('4 sec² x', false),
      AnswerChoice('sec² x', false),
      AnswerChoice('4(tan x)³ · sec² x', true), // C
      AnswerChoice('4(tan x)³', false),
    ],
  ),

  Question(
    'Derivative of e^(sin x)',
    const [
      AnswerChoice('e^(sin x) · cos x', true), // A
      AnswerChoice('e^(sin x)', false),
      AnswerChoice('eˣ · cos x', false),
      AnswerChoice('e^(cos x) · sin x', false),
    ],
  ),

  Question(
    'When functions are nested, the usual approach is to:',
    const [
      AnswerChoice('Differentiate only the inner function', false),
      AnswerChoice('Always use the quotient rule', false),
      AnswerChoice('Differentiate everything separately and add', false),
      AnswerChoice('Differentiate the outer function, then multiply by the inner derivative', true), // D
    ],
  ),
];

// 2) Product Rule
final List<Question> _mediumCat2_productRule = [
  Question(
    'Derivative of x² · eˣ',
    const [
      AnswerChoice('x² · eˣ', false),
      AnswerChoice('x² · eˣ + 2x · eˣ', true), 
      AnswerChoice('2x · eˣ', false),
      AnswerChoice('2x · eˣ − x² · eˣ', false),
    ],
  ),

  Question(
    'Derivative of (3x) · sin x',
    const [
      AnswerChoice('3x cos x', false),
      AnswerChoice('sin x + x cos x', false),
      AnswerChoice('3 sin x + 3x cos x', true), 
      AnswerChoice('3 sin x', false),
    ],
  ),

  Question(
    'Derivative of x³ · ln x',
    const [
      AnswerChoice('3x² ln x + x²', true), 
      AnswerChoice('3x² ln x', false),
      AnswerChoice('x³ / x', false),
      AnswerChoice('x³ · (1 / x)', false),
    ],
  ),

  Question(
    'Derivative of (2x + 1)(x² − 4)',
    const [
      AnswerChoice('2(x² − 4) + (2x + 1)(2x)', true), 
      AnswerChoice('2(x² − 4)', false),
      AnswerChoice('(2x + 1)(2x)', false),
      AnswerChoice('4x(x² − 4)', false),
    ],
  ),

  Question(
    'Derivative of x · cos x',
    const [
      AnswerChoice('cos x', false),
      AnswerChoice('−x sin x', false),
      AnswerChoice('x cos x', false),
      AnswerChoice('cos x − x sin x', true), 
    ],
  ),

  Question(
    'Derivative of (x² + 1)(x² − 1)',
    const [
      AnswerChoice('4x(x² − 1)', false),
      AnswerChoice('2x(x² − 1) + 2x(x² + 1)', true), 
      AnswerChoice('2x(x² − 1)', false),
      AnswerChoice('4x(x² + 1)', false),
    ],
  ),

  Question(
    'Derivative of eˣ · tan x',
    const [
      AnswerChoice('tan x + sec² x', false),
      AnswerChoice('eˣ sec² x', false),
      AnswerChoice('eˣ tan x + eˣ sec² x', true), 
      AnswerChoice('eˣ tan x', false),
    ],
  ),

  Question(
    'If y = f(x)g(x), then y′ equals:',
    const [
      AnswerChoice('fg', false),
      AnswerChoice('f + g', false),
      AnswerChoice('f′g′', false),
      AnswerChoice('f′g + fg′', true), 
    ],
  ),
];

// 3) Quotient Rule
final List<Question> _mediumCat3_quotientRule = [
  Question(
    'Derivative of x² / (x + 1)',
    const [
      AnswerChoice('((2x)(x + 1) − x²) / (x + 1)²', true), 
      AnswerChoice('2x / (x + 1)', false),
      AnswerChoice('(2x − x²) / (x + 1)', false),
      AnswerChoice('((2x)(x + 1) + x²) / (x + 1)', false),
    ],
  ),

  Question(
    'Derivative of sin x / x',
    const [
      AnswerChoice('cos x / x', false),
      AnswerChoice('sin x / x²', false),
      AnswerChoice('((cos x)(x) − sin x) / x²', true), 
      AnswerChoice('((cos x)(x) + sin x) / x²', false),
    ],
  ),

  Question(
    'Derivative of eˣ / x²',
    const [
      AnswerChoice('(eˣ − 2x) / x²', false),
      AnswerChoice('((eˣ)(x²) − eˣ(2x)) / x⁴', true), 
      AnswerChoice('eˣ / x²', false),
      AnswerChoice('(2x eˣ − eˣ) / x²', false),
    ],
  ),

  Question(
    'Derivative of (3x + 1) / (x² − 4)',
    const [
      AnswerChoice('3 / (x² − 4)', false),
      AnswerChoice('(3x + 1) / (x² − 4)²', false),
      AnswerChoice('((3)(x² − 4) − (3x + 1)(2x)) / (x² − 4)²', true), 
      AnswerChoice('((3)(x² − 4) + (3x + 1)(2x)) / (x² − 4)', false),
    ],
  ),

  Question(
    'Derivative of ln x / x',
    const [
      AnswerChoice('((1 / x)(x) − ln x) / x²', true), 
      AnswerChoice('1 / x²', false),
      AnswerChoice('ln x / x²', false),
      AnswerChoice('((1 / x)(x) + ln x) / x²', false),
    ],
  ),

  Question(
    'Derivative of 5x / (2x − 3)',
    const [
      AnswerChoice('5 / (2x − 3)', false),
      AnswerChoice('10 / (2x − 3)²', false),
      AnswerChoice('((5)(2x − 3) + 10x) / (2x − 3)²', false),
      AnswerChoice('((5)(2x − 3) − 10x) / (2x − 3)²', true), 
    ],
  ),

  Question(
    'Derivative of (x² + 1) / (x² + x)',
    const [
      AnswerChoice('2x / (x² + x)', false),
      AnswerChoice('((2x)(x² + x) − (x² + 1)(2x + 1)) / (x² + x)²', true), 
      AnswerChoice('((2x)(x² + x) + (x² + 1)(2x + 1)) / (x² + x)', false),
      AnswerChoice('(2x + 1) / (x² + x)²', false),
    ],
  ),

  Question(
    'Quotient rule pattern:',
    const [
      AnswerChoice('(low · d(high) + high · d(low)) / low²', false),
      AnswerChoice('(high · d(high) − low · d(low)) / low²', false),
      AnswerChoice('(d(high) − d(low)) / low', false),
      AnswerChoice('(low · d(high) − high · d(low)) / low²', true), 
    ],
  ),
];

// 4) Chain Rule
final List<Question> _mediumCat4_chainRule = [
  Question(
    'Derivative of (3x² + 1)⁴',
    const [
      AnswerChoice('4(3x² + 1)³ · 6x', true), 
      AnswerChoice('4(3x² + 1)³', false),
      AnswerChoice('12x(3x² + 1)⁴', false),
      AnswerChoice('6x(3x² + 1)', false),
    ],
  ),

  Question(
    'Derivative of sin(5x)',
    const [
      AnswerChoice('cos(5x)', false),
      AnswerChoice('5 cos(5x)', true), 
      AnswerChoice('sin(5x) · 5x', false),
      AnswerChoice('−5 sin(5x)', false),
    ],
  ),

  Question(
    'Derivative of e^(2x)',
    const [
      AnswerChoice('eˣ', false),
      AnswerChoice('e^(2x)', false),
      AnswerChoice('2e^(2x)', true), 
      AnswerChoice('2x e^(2x)', false),
    ],
  ),

  Question(
    'Derivative of (x³ − 2x)⁵',
    const [
      AnswerChoice('5(x³ − 2x)⁴', false),
      AnswerChoice('15x²(x³ − 2x)⁵', false),
      AnswerChoice('(x³ − 2x)⁵ · (3x² − 2)', false),
      AnswerChoice('5(x³ − 2x)⁴ · (3x² − 2)', true), 
    ],
  ),

  Question(
    'Derivative of ln(7x² + 1)',
    const [
      AnswerChoice('14x / (7x² + 1)', true),
      AnswerChoice('1 / (7x² + 1)', false),
      AnswerChoice('14x', false),
      AnswerChoice('(7x² + 1) ln(7x² + 1)', false),
    ],
  ),

  Question(
    'Derivative of cos(4x³)',
    const [
      AnswerChoice('12x² cos(4x³)', false),
      AnswerChoice('−12x² sin(4x³)', true), 
      AnswerChoice('−sin(4x³)', false),
      AnswerChoice('−4x³ sin(4x³)', false),
    ],
  ),

  Question(
    'Derivative of (5x − 1)⁻²',
    const [
      AnswerChoice('−2(5x − 1)⁻³', false),
      AnswerChoice('10(5x − 1)⁻²', false),
      AnswerChoice('−10(5x − 1)⁻³', true), 
      AnswerChoice('−2(5x − 1)⁻²', false),
    ],
  ),

  Question(
    'If y = (g(x))³, then y′ equals:',
    const [
      AnswerChoice('3(g(x))²', false),
      AnswerChoice('g′(x)³', false),
      AnswerChoice('3g(x) · g′(x)', false),
      AnswerChoice('3(g(x))² · g′(x)', true), 
    ],
  ),
];
  void _tryAgain() {
    setState(() {
      _answered = false;
      _selectedChoiceIndex = null;
      _feedbackText = null;
    });
  }

  void _nextQuestion() {
    final questions = _activeQuestions;
    setState(() {
      if (_currentQuestionIndex < questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _currentQuestionIndex = 0;
      }
      _answered = false;
      _selectedChoiceIndex = null;
      _feedbackText = null;
    });
  }

  void _checkUnlock() {
    if (_streak < _unlockTarget) return;

    if (_category == CategoryMedium.RecognizingStructure && !_productRuleUnlocked) {
      _productRuleUnlocked = true;
      _feedbackText = 'next level unlocked!';
      _streak = 0;
    } else if (_category == CategoryMedium.ProductRule && !_quotientRuleUnlocked) {
      _quotientRuleUnlocked = true;
      _feedbackText = 'next level unlocked!';
      _streak = 0;
    } else if (_category == CategoryMedium.QuotientRule && !_chainRuleUnlocked) {
      _chainRuleUnlocked = true;
      _feedbackText = 'next level unlocked!';
      _streak = 0;
    } else if (_category == CategoryMedium.ChainRule && !_hardUnlocked) {
      _hardUnlocked = true;
      _feedbackText = 'next level unlocked!';
      _streak = 0;
    }

    _saveProgress();
  }

  @override
  Widget build(BuildContext context) {
    final questions = _activeQuestions;
    final currentQuestion = questions[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 29, 61),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 207, 207, 192)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromARGB(255, 31, 29, 61),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            Container(
              width: 335,
              padding: const EdgeInsets.symmetric(horizontal: 39, vertical: 40),
              constraints: const BoxConstraints(
                minHeight: 120,
                maxHeight: 200,
              ),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 45, 56, 85),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                currentQuestion.text,
                style: const TextStyle(
                    color: CupertinoColors.secondarySystemGroupedBackground,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Streak: $_streak / $_unlockTarget',
              style: const TextStyle(
                color: CupertinoColors.secondarySystemGroupedBackground,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 50),
            Column(
              children: currentQuestion.choices.map((choice) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: 320,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 45, 56, 85),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onPressed: _answered
                          ? null
                          : () {
                              setState(() {
                                _selectedChoiceIndex = currentQuestion.choices
                                    .indexOf(choice);
                                _answered = true;
                                if (choice.isCorrect) {
                                  _feedbackText = 'Correct';
                                  _streak++;
                                  _checkUnlock();
                                } else {
                                  _feedbackText = 'Wrong';
                                  _streak = 0;
                                }
                              });
                              _saveProgress();
                            },
                      child: Text(
                        choice.text,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 207, 207, 192),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            if (_feedbackText != null)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  _feedbackText!,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: _feedbackText == 'Correct'
                        ? Colors.green
                        : _feedbackText == 'Wrong'
                            ? Colors.red
                            : Colors.yellow,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 48,
                  width: 140,
                  child: ElevatedButton(
                      onPressed: _answered ? _tryAgain : null,
                      child: const Text("Try Again")),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  height: 48,
                  width: 140,
                  child: ElevatedButton(
                      onPressed: _answered ? _nextQuestion : null,
                      child: const Text("Next Question")),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (_buildNextLevelButton() != null) _buildNextLevelButton()!,
          ],
        ),
      ),
    );
  }
}