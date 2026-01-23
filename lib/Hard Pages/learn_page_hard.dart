import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

enum CategoryHard { ImplicitDifferentiation, LogarithmicDifferentiation, DerivativeFromDefinition, RelatedRates, MotionInterpretation, TangentAndNormalLines }

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

class PracticePageHard extends StatefulWidget {
  final CategoryHard category;
  const PracticePageHard({super.key, required this.category});
  @override
  State<PracticePageHard> createState() => _PracticePageHardState();
}

class _PracticePageHardState extends State<PracticePageHard> {
  @override
  void initState() {
    super.initState();
    _category = widget.category;
    _loadProgress();
  }

  List<Question> get _activeQuestions {
    switch (_category) {
      case CategoryHard.ImplicitDifferentiation:
        return _implicitDifferentiation;
      case CategoryHard.LogarithmicDifferentiation:
        return _logarithmicDifferentiation;
      case CategoryHard.DerivativeFromDefinition:
        return _derivativeFromDefinition;
      case CategoryHard.RelatedRates:
        return _relatedRates;
      case CategoryHard.MotionInterpretation:
        return _motionInterpretation;
      case CategoryHard.TangentAndNormalLines:
        return _tangentAndNormalLines;
    }
  }

  Widget? _buildNextLevelButton() {
    return null;
  }

  String get _streakKey => 'streak_hard_${_category.name}';
  static const String _logarithmicDifferentiationUnlockedKey = 'LogarithmicDifferentiation_unlocked';
  static const String _derivativeFromDefinitionUnlockedKey = 'DerivativeFromDefinition_unlocked';
  static const String _relatedRatesUnlockedKey = 'RelatedRates_unlocked';
  static const String _motionInterpretationUnlockedKey = 'MotionInterpretation_unlocked';
  static const String _tangentAndNormalLinesUnlockedKey = 'TangentAndNormalLines_unlocked';

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _streak = prefs.getInt(_streakKey) ?? 0;
      _logarithmicDifferentiationUnlocked = prefs.getBool(_logarithmicDifferentiationUnlockedKey) ?? false;
      _derivativeFromDefinitionUnlocked = prefs.getBool(_derivativeFromDefinitionUnlockedKey) ?? false;
      _relatedRatesUnlocked = prefs.getBool(_relatedRatesUnlockedKey) ?? false;
      _motionInterpretationUnlocked = prefs.getBool(_motionInterpretationUnlockedKey) ?? false;
      _tangentAndNormalLinesUnlocked = prefs.getBool(_tangentAndNormalLinesUnlockedKey) ?? false;
    });
  }

  Future<void> _saveProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_streakKey, _streak);
    await prefs.setBool(_logarithmicDifferentiationUnlockedKey, _logarithmicDifferentiationUnlocked);
    await prefs.setBool(_derivativeFromDefinitionUnlockedKey, _derivativeFromDefinitionUnlocked);
    await prefs.setBool(_relatedRatesUnlockedKey, _relatedRatesUnlocked);
    await prefs.setBool(_motionInterpretationUnlockedKey, _motionInterpretationUnlocked);
    await prefs.setBool(_tangentAndNormalLinesUnlockedKey, _tangentAndNormalLinesUnlocked);
  }

  int _currentQuestionIndex = 0;
  int? _selectedChoiceIndex;
  bool _answered = false;
  String? _feedbackText;

  late CategoryHard _category;
  int _streak = 0;

  static const int _unlockTarget = 6;
  bool _logarithmicDifferentiationUnlocked = false;
  bool _derivativeFromDefinitionUnlocked = false;
  bool _relatedRatesUnlocked = false;
  bool _motionInterpretationUnlocked = false;
  bool _tangentAndNormalLinesUnlocked = false;

  final List<Question> _implicitDifferentiation = [
  Question(
    'Find dy/dx for x² + y² = 25',
    const [
      AnswerChoice('dy/dx = −x/y', true), // A
      AnswerChoice('dy/dx = x/y', false),
      AnswerChoice('dy/dx = −2x/2y', false),
      AnswerChoice('dy/dx = 1', false),
    ],
  ),

  Question(
    'Find dy/dx for xy + y = x³ at a point',
    const [
      AnswerChoice('dy/dx = (3x² − y) / (x + 1)', true), // A
      AnswerChoice('dy/dx = (y − 3x²) / (x + 1)', false),
      AnswerChoice('dy/dx = 3x² / x', false),
      AnswerChoice('dy/dx = y / x', false),
    ],
  ),

  Question(
    'Find dy/dx for x²y − sin y = 0',
    const [
      AnswerChoice('dy/dx = 2xy / (x² − cos y)', true), // A
      AnswerChoice('dy/dx = −2xy / (x² − cos y)', false),
      AnswerChoice('dy/dx = 2y / (x − cos y)', false),
      AnswerChoice('dy/dx = −x² / cos y', false),
    ],
  ),

  Question(
    'For eʸ = xy, find dy/dx',
    const [
      AnswerChoice('dy/dx = y / (eʸ − x)', true), // A
      AnswerChoice('dy/dx = x / eʸ', false),
      AnswerChoice('dy/dx = (eʸ − y) / x', false),
      AnswerChoice('dy/dx = −y / x', false),
    ],
  ),

  Question(
    'Find d²y/dx² for x² + y² = 4',
    const [
      AnswerChoice('d²y/dx² = −4 / y³', true), // A
      AnswerChoice('d²y/dx² = −2 / y', false),
      AnswerChoice('d²y/dx² = 2x / y²', false),
      AnswerChoice('d²y/dx² = −1 / y', false),
    ],
  ),

  Question(
    'Find dy/dx for x³ + x²y + y² = 0',
    const [
      AnswerChoice('dy/dx = −(3x² + 2xy) / (x² + 2y)', true), // A
      AnswerChoice('dy/dx = (3x² + 2xy) / (x² + 2y)', false),
      AnswerChoice('dy/dx = −3x² / 2y', false),
      AnswerChoice('dy/dx = −x / y', false),
    ],
  ),

  Question(
    'Find dy/dx for tan(xy) = x',
    const [
      AnswerChoice('dy/dx = (cos²(xy) − y) / x', true), // A
      AnswerChoice('dy/dx = 1 / (sec²(xy) · x)', false),
      AnswerChoice('dy/dx = (1 − y cos²(xy)) / x cos²(xy)', true), // Also A (equivalent)
      AnswerChoice('dy/dx = tan(xy) / x', false),
    ],
  ),

  Question(
    'For implicit differentiation, we differentiate:',
    const [
      AnswerChoice('both sides with respect to x', true), // A
      AnswerChoice('only the y terms', false),
      AnswerChoice('only the x terms', false),
      AnswerChoice('using the quotient rule exclusively', false),
    ],
  ),
];

// 2) Logarithmic Differentiation
final List<Question> _logarithmicDifferentiation = [
  Question(
    'Find dy/dx for y = xˣ using logarithmic differentiation',
    const [
      AnswerChoice('dy/dx = xˣ(ln x + 1)', true), 
      AnswerChoice('dy/dx = x ˣ⁻¹', false),
      AnswerChoice('dy/dx = xˣ ln x', false),
      AnswerChoice('dy/dx = x ln(x)', false),
    ],
  ),

  Question(
    'Find dy/dx for y = (x + 1)^x using ln differentiation',
    const [
      AnswerChoice('dy/dx = (x + 1)^x (ln(x + 1) + x/(x + 1))', true), 
      AnswerChoice('dy/dx = x(x + 1)^(x−1)', false),
      AnswerChoice('dy/dx = (x + 1)^x / x', false),
      AnswerChoice('dy/dx = (x + 1)^x ln(x)', false),
    ],
  ),

  Question(
    'Find dy/dx for y = (sin x)^(cos x)',
    const [
      AnswerChoice('dy/dx = (sin x)^(cos x) (−sin x ln(sin x) + cos x · cot x)', true), 
      AnswerChoice('dy/dx = cos x (sin x)^(cos x − 1)', false),
      AnswerChoice('dy/dx = (sin x)^(cos x) · cos x', false),
      AnswerChoice('dy/dx = cos x · cot x', false),
    ],
  ),

  Question(
    'For y = x^(x²), find dy/dx using logarithmic differentiation',
    const [
      AnswerChoice('dy/dx = x^(x²) (2x ln x + x)', true), 
      AnswerChoice('dy/dx = x² · x^(x² − 1)', false),
      AnswerChoice('dy/dx = 2x x^(x²)', false),
      AnswerChoice('dy/dx = x^(x²) · x', false),
    ],
  ),

  Question(
    'Find dy/dx for y = (x² + 1)^(x)',
    const [
      AnswerChoice('dy/dx = (x² + 1)^x (ln(x² + 1) + 2x²/(x² + 1))', true), 
      AnswerChoice('dy/dx = x(x² + 1)^(x − 1)', false),
      AnswerChoice('dy/dx = (x² + 1)^x ln(x² + 1)', false),
      AnswerChoice('dy/dx = (x² + 1)^x · x', false),
    ],
  ),

  Question(
    'Find dy/dx for y = (x³)^(sin x)',
    const [
      AnswerChoice('dy/dx = (x³)^(sin x) (cos x ln(x³) + sin x · 3/x)', true), 
      AnswerChoice('dy/dx = sin x (x³)^(sin x − 1)', false),
      AnswerChoice('dy/dx = (x³)^(sin x) · 3/x', false),
      AnswerChoice('dy/dx = cos x · (x³)^(sin x)', false),
    ],
  ),

  Question(
    'Find dy/dx for y = (2x)^(√x)',
    const [
      AnswerChoice('dy/dx = (2x)^(√x) (ln(2x)/(2√x) + √x/x)', true), 
      AnswerChoice('dy/dx = √x · (2x)^(√x − 1)', false),
      AnswerChoice('dy/dx = (2x)^(√x) / (2√x)', false),
      AnswerChoice('dy/dx = (2x)^(√x) · √x', false),
    ],
  ),

  Question(
    'When using logarithmic differentiation, we take ln of:',
    const [
      AnswerChoice('both sides of the equation', true), 
      AnswerChoice('only the right side', false),
      AnswerChoice('only the left side', false),
      AnswerChoice('the exponent only', false),
    ],
  ),
];

// 3) Derivative From Definition
final List<Question> _derivativeFromDefinition = [
  Question(
    'Using f\'(x) = lim(h→0) [f(x+h)−f(x)]/h, find f\'(2) for f(x) = x²',
    const [
      AnswerChoice('f\'(2) = 4', true), 
      AnswerChoice('f\'(2) = 2', false),
      AnswerChoice('f\'(2) = 8', false),
      AnswerChoice('f\'(2) = 1', false),
    ],
  ),

  Question(
    'Find f\'(1) from the definition for f(x) = 3x + 1',
    const [
      AnswerChoice('f\'(1) = 3', true), 
      AnswerChoice('f\'(1) = 1', false),
      AnswerChoice('f\'(1) = 4', false),
      AnswerChoice('f\'(1) = 0', false),
    ],
  ),

  Question(
    'Using the limit definition, find f\'(x) for f(x) = 1/x',
    const [
      AnswerChoice('f\'(x) = −1/x²', true), 
      AnswerChoice('f\'(x) = 1/x²', false),
      AnswerChoice('f\'(x) = −1/x', false),
      AnswerChoice('f\'(x) = 1/x', false),
    ],
  ),

  Question(
    'From the definition, f\'(3) for f(x) = √x is:',
    const [
      AnswerChoice('f\'(3) = 1/(2√3)', true), 
      AnswerChoice('f\'(3) = √3', false),
      AnswerChoice('f\'(3) = 1/3', false),
      AnswerChoice('f\'(3) = 2/3', false),
    ],
  ),

  Question(
    'What does the limit definition f\'(x) = lim(h→0) [f(x+h)−f(x)]/h represent?',
    const [
      AnswerChoice('The slope of the tangent line at x', true), 
      AnswerChoice('The average rate of change', false),
      AnswerChoice('The value of the function', false),
      AnswerChoice('The second derivative', false),
    ],
  ),

  Question(
    'Using the definition, find f\'(0) for f(x) = x³',
    const [
      AnswerChoice('f\'(0) = 0', true), 
      AnswerChoice('f\'(0) = 1', false),
      AnswerChoice('f\'(0) = 3', false),
      AnswerChoice('f\'(0) = undefined', false),
    ],
  ),

  Question(
    'For f(x) = |x|, does the derivative from the definition exist at x = 0?',
    const [
      AnswerChoice('No, the left and right derivatives differ', true), 
      AnswerChoice('Yes, f\'(0) = 0', false),
      AnswerChoice('Yes, f\'(0) = 1', false),
      AnswerChoice('The function is not defined at 0', false),
    ],
  ),

  Question(
    'The derivative can be interpreted as:',
    const [
      AnswerChoice('Both the instantaneous rate of change and slope of tangent', true), 
      AnswerChoice('Only the average rate of change', false),
      AnswerChoice('Only the slope of a secant line', false),
      AnswerChoice('The area under the curve', false),
    ],
  ),
];

// 4) Related Rates
final List<Question> _relatedRates = [
  Question(
    'A ladder leans against a wall. The bottom slides away at 2 ft/s. At what rate is the top sliding down when the ladder is 6 ft from wall (ladder = 10 ft)?',
    const [
      AnswerChoice('3/4 ft/s', false),
      AnswerChoice('1.5 ft/s', true), 
      AnswerChoice('2 ft/s', false),
      AnswerChoice('4 ft/s', false),
    ],
  ),

  Question(
    'Water fills a cone at 3 cm³/s. If the cone has height 10 cm and radius 5 cm, at what rate is the height changing when h = 4 cm?',
    const [
      AnswerChoice('3π / 4 cm/s', true), 
      AnswerChoice('3/4 cm/s', false),
      AnswerChoice('3π / 16 cm/s', false),
      AnswerChoice('π cm/s', false),
    ],
  ),

  Question(
    'Two cars approach an intersection. Car A travels north at 40 mph, Car B travels east at 50 mph. At what rate is the distance between them changing when A is 3 mi north and B is 4 mi east of the intersection?',
    const [
      AnswerChoice('34 mph', true), 
      AnswerChoice('40 mph', false),
      AnswerChoice('50 mph', false),
      AnswerChoice('90 mph', false),
    ],
  ),

  Question(
    'A spherical balloon is inflated. The radius increases at 2 cm/s. At what rate is the surface area changing when r = 5 cm?',
    const [
      AnswerChoice('80π cm²/s', true), 
      AnswerChoice('40π cm²/s', false),
      AnswerChoice('100π cm²/s', false),
      AnswerChoice('10π cm²/s', false),
    ],
  ),

  Question(
    'Shadow problem: A 6 ft person walks away from a 20 ft light at 4 ft/s. At what rate is the shadow tip moving along the ground when the person is 8 ft from the light?',
    const [
      AnswerChoice('5 ft/s', true), 
      AnswerChoice('4 ft/s', false),
      AnswerChoice('6 ft/s', false),
      AnswerChoice('10 ft/s', false),
    ],
  ),

  Question(
    'A spherical snowball melts losing volume at 10 cm³/s. At what rate is the radius decreasing when r = 5 cm?',
    const [
      AnswerChoice('−1/(10π) cm/s', true), 
      AnswerChoice('−10/π cm/s', false),
      AnswerChoice('−π/10 cm/s', false),
      AnswerChoice('−1 cm/s', false),
    ],
  ),

  Question(
    'A boat is pulled toward a dock by a rope. The rope shortens at 2 ft/s. At what rate is the boat approaching the dock when 20 ft of rope remains and the pulley is 12 ft above the boat?',
    const [
      AnswerChoice('2.5 ft/s', true), 
      AnswerChoice('2 ft/s', false),
      AnswerChoice('1.5 ft/s', false),
      AnswerChoice('3 ft/s', false),
    ],
  ),

  Question(
    'In related rates problems, the key step is to:',
    const [
      AnswerChoice('Differentiate the relationship equation with respect to time', true), 
      AnswerChoice('Solve for all variables first', false),
      AnswerChoice('Use the chain rule only', false),
      AnswerChoice('Find the derivative of each variable separately', false),
    ],
  ),
];

// 5) Motion Interpretation
final List<Question> _motionInterpretation = [
  Question(
    'An object\'s position is s(t) = t³ − 6t² + 9t. Find the velocity at t = 2',
    const [
      AnswerChoice('v(2) = −3 m/s', true), 
      AnswerChoice('v(2) = 3 m/s', false),
      AnswerChoice('v(2) = 0 m/s', false),
      AnswerChoice('v(2) = 6 m/s', false),
    ],
  ),

  Question(
    'For s(t) = t³ − 6t² + 9t, when is the object momentarily at rest?',
    const [
      AnswerChoice('t = 1 and t = 3', true), 
      AnswerChoice('t = 0 and t = 3', false),
      AnswerChoice('t = 1 only', false),
      AnswerChoice('never', false),
    ],
  ),

  Question(
    'Velocity v(t) = t² − 4t + 3. When is the object moving backward (negative direction)?',
    const [
      AnswerChoice('1 < t < 3', true), 
      AnswerChoice('0 < t < 1', false),
      AnswerChoice('t > 3', false),
      AnswerChoice('t > 1', false),
    ],
  ),

  Question(
    'For s(t) = t² − 8t + 15, the acceleration at t = 4 is:',
    const [
      AnswerChoice('a(4) = 2 m/s²', true), 
      AnswerChoice('a(4) = 0 m/s²', false),
      AnswerChoice('a(4) = −1 m/s²', false),
      AnswerChoice('a(4) = 8 m/s²', false),
    ],
  ),

  Question(
    'An object has s(t) = −4.9t² + 20t. Its maximum height is reached when:',
    const [
      AnswerChoice('t = 20/9.8 ≈ 2.04 s', true), 
      AnswerChoice('t = 0 s', false),
      AnswerChoice('t = 20 s', false),
      AnswerChoice('t = 4.9 s', false),
    ],
  ),

  Question(
    'If v(t) = 6t² − 12t and the object starts at s(0) = 0, find s(2)',
    const [
      AnswerChoice('s(2) = 4 m', true), 
      AnswerChoice('s(2) = 0 m', false),
      AnswerChoice('s(2) = 8 m', false),
      AnswerChoice('s(2) = 12 m', false),
    ],
  ),

  Question(
    'An object moving along a line has s(t) = cos(t). Its acceleration is:',
    const [
      AnswerChoice('a(t) = −cos(t)', true), 
      AnswerChoice('a(t) = −sin(t)', false),
      AnswerChoice('a(t) = sin(t)', false),
      AnswerChoice('a(t) = cos(t)', false),
    ],
  ),

  Question(
    'Velocity equals zero when:',
    const [
      AnswerChoice('The object is momentarily stopped', true), 
      AnswerChoice('The object is accelerating', false),
      AnswerChoice('The object has traveled 0 distance', false),
      AnswerChoice('The second derivative is zero', false),
    ],
  ),
];

// 6) Tangent and Normal Lines
final List<Question> _tangentAndNormalLines = [
  Question(
    'Find the equation of the tangent line to y = x² at the point (3, 9)',
    const [
      AnswerChoice('y = 6x − 9', true), 
      AnswerChoice('y = 3x − 9', false),
      AnswerChoice('y = 6x + 9', false),
      AnswerChoice('y = x + 6', false),
    ],
  ),

  Question(
    'The normal line to y = √x at x = 4 is:',
    const [
      AnswerChoice('y = −4x + 18', true), 
      AnswerChoice('y = 4x − 18', false),
      AnswerChoice('y = −x + 4', false),
      AnswerChoice('y = x − 2', false),
    ],
  ),

  Question(
    'Find the tangent line to y = 1/x at (2, 1/2)',
    const [
      AnswerChoice('y = −(1/4)x + 1', true), 
      AnswerChoice('y = (1/4)x − 1', false),
      AnswerChoice('y = −2x + 4.5', false),
      AnswerChoice('y = 2x − 3.5', false),
    ],
  ),

  Question(
    'The tangent line to y = eˣ at x = 0 is:',
    const [
      AnswerChoice('y = x + 1', true), 
      AnswerChoice('y = eˣ', false),
      AnswerChoice('y = x', false),
      AnswerChoice('y = e', false),
    ],
  ),

  Question(
    'For y = sin x, find the equation of the tangent at (π/2, 1)',
    const [
      AnswerChoice('y = 1', true), 
      AnswerChoice('y = x − π/2 + 1', false),
      AnswerChoice('y = −x + π/2 + 1', false),
      AnswerChoice('y = cos x', false),
    ],
  ),

  Question(
    'The tangent line to y = x³ at x = 1 has slope:',
    const [
      AnswerChoice('3', true), 
      AnswerChoice('1', false),
      AnswerChoice('0', false),
      AnswerChoice('9', false),
    ],
  ),

  Question(
    'Find where the tangent to y = x² − 3x is horizontal',
    const [
      AnswerChoice('x = 3/2', true), 
      AnswerChoice('x = 0', false),
      AnswerChoice('x = 3', false),
      AnswerChoice('never', false),
    ],
  ),

  Question(
    'The slope of the normal line is:',
    const [
      AnswerChoice('negative reciprocal of the tangent slope', true), 
      AnswerChoice('same as the tangent slope', false),
      AnswerChoice('always −1', false),
      AnswerChoice('always 1', false),
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

    if (_category == CategoryHard.ImplicitDifferentiation && !_logarithmicDifferentiationUnlocked) {
      _logarithmicDifferentiationUnlocked = true;
      _feedbackText = 'next level unlocked!';
      _streak = 0;
    } else if (_category == CategoryHard.LogarithmicDifferentiation && !_derivativeFromDefinitionUnlocked) {
      _derivativeFromDefinitionUnlocked = true;
      _feedbackText = 'next level unlocked!';
      _streak = 0;
    } else if (_category == CategoryHard.DerivativeFromDefinition && !_relatedRatesUnlocked) {
      _relatedRatesUnlocked = true;
      _feedbackText = 'next level unlocked!';
      _streak = 0;
    } else if (_category == CategoryHard.RelatedRates && !_motionInterpretationUnlocked) {
      _motionInterpretationUnlocked = true;
      _feedbackText = 'next level unlocked!';
      _streak = 0;
    } else if (_category == CategoryHard.MotionInterpretation && !_tangentAndNormalLinesUnlocked) {
      _tangentAndNormalLinesUnlocked = true;
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
            SizedBox(
              width: 335,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                constraints: const BoxConstraints(
                  minHeight: 120,
                  maxHeight: 240, // you can tweak this (240-320 works nice)
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 45, 56, 85),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    currentQuestion.text,
                    softWrap: true,
                    style: const TextStyle(
                      color: CupertinoColors.secondarySystemGroupedBackground,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.25,
                    ),
                  ),
                ),
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
