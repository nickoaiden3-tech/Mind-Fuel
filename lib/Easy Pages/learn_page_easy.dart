import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_fuel_application/Hard Pages/derivatives_hard_navigator.dart';
import 'package:mind_fuel_application/Medium%20Pages/derivatives_medium_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:mind_fuel_application/Easy Pages/easy_derivative_definiton.dart';
import 'package:mind_fuel_application/Easy Pages/easy_power_rule.dart';
import 'package:mind_fuel_application/Easy Pages/easy_constants.dart';
import 'package:mind_fuel_application/Easy Pages/easy_trig_exp_log.dart';


import 'package:mind_fuel_application/Medium Pages/learn_page_medium.dart';

// Class definitions

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

enum Category { basicDefinition, powerRule, constants, trigExpLog } /*
using enum allws us to define Difficulty 
as having three possible values.*/


// Class definitions for Questions and Answers

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



class PracticePageEasy extends StatefulWidget{
  final Category category;

  const PracticePageEasy({super.key, required this.category});
  @override
  State<PracticePageEasy> createState() => _PracticePageEasyState();
}

class _PracticePageEasyState extends State<PracticePageEasy> {

// STATE VARIABLES
  @override
void initState() {
  super.initState();
  _category = widget.category;
  _loadProgress();
}
// This initState function is used to establish anything that is needed before building 
// the widget. Here, we are setting the difficulty variable to be equal to the difficulty
// since in our code we say later that the variable WILL have a value before its used.

List <Question> get _activeQuestions {
  switch (_category) {
    case Category.basicDefinition:
      return _easyCat1_basicDefinition;
    case Category.powerRule:
      return _easyCat2_powerRule;
    case Category.constants:
      return _easyCat3_constants;
    case Category.trigExpLog:
      return _easyCat4_trigExpLog;
  }
}
// Above is a getter that returns the list of questions based on the selected difficulty
// that was set in initState.

Widget? _buildNextLevelButton() {
  if (_category == Category.basicDefinition && _powerRuleUnlocked) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DerivativePowerRule(category: Category.powerRule)),
        );
      },
      child: const Text('Learn Power Rule'),
    );
  } else if (_category == Category.powerRule && _constantsUnlocked) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DerivativeConstant(category: Category.constants)),
        );
      },
      child: const Text('Learn about constants'),
    );
  }
    else if (_category == Category.constants && _trigExpLogUnlocked) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DerivativeTrigExpLog(category: Category.trigExpLog)),
        );
      },
      child: const Text('learn about trigonometric, exponential, and logarithmic functions'),
    );
  }
      else if (_category == Category.trigExpLog && _mediumUnlocked) {
          return ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DerivativeMediumNavigator(category:  CategoryMedium.RecognizingStructure)),
              );
            },
            child: const Text('Advance to Medium Difficulty'),
          );
        }
    
  return null; // No button to show
}

// SAVING PROGRESS

// keys (names) used to store stuff on the phone
String get _streakKey => 'streak_${_category.name}';
static const String _powerRuleUnlockedKey = 'PowerRule_unlocked';
static const String _constantsUnlockedKey = 'Constants_unlocked';
static const String _trigExpLogUnlockedKey = 'TrigExpLog_unlocked';
static const String _mediumUnlockedKey = 'Medium_unlocked';

Future<void> _loadProgress() async {
  final prefs = await SharedPreferences.getInstance();

  setState(() {
    // load streak for the current difficulty (easy/medium/hard)
    _streak = prefs.getInt(_streakKey) ?? 0;

    // load unlocks (global)
    _powerRuleUnlocked = prefs.getBool(_powerRuleUnlockedKey) ?? false;
    _constantsUnlocked = prefs.getBool(_constantsUnlockedKey) ?? false;
    _trigExpLogUnlocked = prefs.getBool(_trigExpLogUnlockedKey) ?? false;
    _mediumUnlocked = prefs.getBool(_mediumUnlockedKey) ??false;
  });
}

Future<void> _saveProgress() async {
  final prefs = await SharedPreferences.getInstance();

  // save streak for the current difficulty
  await prefs.setInt(_streakKey, _streak);

  // save unlocks
  await prefs.setBool(_powerRuleUnlockedKey, _powerRuleUnlocked);
  await prefs.setBool(_constantsUnlockedKey, _constantsUnlocked);
  await prefs.setBool(_trigExpLogUnlockedKey, _trigExpLogUnlocked);
  await prefs.setBool(_mediumUnlockedKey, _mediumUnlocked);

}







  int _currentQuestionIndex = 0;
  int? _selectedChoiceIndex;
  bool _answered = false;
  String? _feedbackText;
  
  late Category _category;  /* Late tells teh system that the variable WILL have
                                 a value before its used.*/
  int _streak = 0;


  static const int _unlockTarget = 6; // Number of correct answers needed to unlock next level
  bool _powerRuleUnlocked = false;
  bool _constantsUnlocked = false;
  bool _trigExpLogUnlocked = false;
  bool _mediumUnlocked = false;




/*Below is where we create the questions, and each of these questions have
there own specific answer choices for our user to select.

each answer choice has true or false next to is becacuse we are using boolean values.

after qreating tyour first question and its answer choices, you can copy and 
paste the same formatto create more questions and answer choices as needed. 
just make sure to make each question and its answer choices different.*/

//CLASS QUESTION LISTS
 final List<Question> _easyCat1_basicDefinition = [
  Question('What does the derivative represent?',
    const [
      AnswerChoice('The y-intercept', false),
      AnswerChoice('The area under the curve', false),
      AnswerChoice('The slope / rate of change', true),
      AnswerChoice('The x-intercept', false),
    ],
  ),

  Question('If f\'(x) is positive on an interval, f(x) is:',
    const [
      AnswerChoice('Decreasing', false),
      AnswerChoice('Constant', false),
      AnswerChoice('Undefined', false),
      AnswerChoice('Increasing', true),
    ],
  ),

  Question('If f\'(x) = 0 on an interval, f(x) is:',
    const [
      AnswerChoice('Increasing', false),
      AnswerChoice('Constant', true),
      AnswerChoice('Decreasing', false),
      AnswerChoice('Always negative', false),
    ],
  ),

  Question('The derivative at a point equals the slope of the:',
    const [
      AnswerChoice('Secant line', false),
      AnswerChoice('Horizontal line', false),
      AnswerChoice('Tangent line', true),
      AnswerChoice('Vertical line', false),
    ],
  ),

  Question('Which is a correct statement?',
    const [
      AnswerChoice('Derivative = total area', false),
      AnswerChoice('Derivative = rate of change', true),
      AnswerChoice('Derivative = always a constant', false),
      AnswerChoice('Derivative = same as the function', false),
    ],
  ),

  Question('If a car’s position is s(t), then s\'(t) represents:',
    const [
      AnswerChoice('Acceleration', false),
      AnswerChoice('Distance traveled', false),
      AnswerChoice('Velocity', true),
      AnswerChoice('Time', false),
    ],
  ),

  Question('If velocity is v(t), then v\'(t) represents:',
    const [
      AnswerChoice('Position', false),
      AnswerChoice('Speed', false),
      AnswerChoice('Acceleration', true),
      AnswerChoice('Displacement', false),
    ],
  ),

  Question('A derivative answers: “How fast is ______ changing?”',
    const [
      AnswerChoice('The x-axis', false),
      AnswerChoice('The function value', true),
      AnswerChoice('Only constants', false),
      AnswerChoice('Only lines', false),
    ],
  ),
];


final List<Question> _easyCat2_powerRule = [
  Question('What is the derivative of x^5?',
    const [
      AnswerChoice('x^4', false),
      AnswerChoice('5x^4', true),
      AnswerChoice('5x^5', false),
      AnswerChoice('x^6', false),
    ],
  ),

  Question('What is the derivative of 6x^7 + 9x^5?',
    const [
      AnswerChoice('42x^6 + 9x^5', false),
      AnswerChoice('42x^6 + 45x^4', true),
      AnswerChoice('6x^7 + 45x^4', false),
      AnswerChoice('6x^7 + 9x^5', false),
    ],
  ),

  Question('What is the derivative of x^2 + 12x^2?',
    const [
      AnswerChoice('24x', false),
      AnswerChoice('13x', false),
      AnswerChoice('26x', true),
      AnswerChoice('2x + 24', false),
    ],
  ),

  Question('What is the derivative of 3x^3 + 2x + 1?',
    const [
      AnswerChoice('9x^3 + 2', false),
      AnswerChoice('9x^2 + 2', true),
      AnswerChoice('3x^2 + 2', false),
      AnswerChoice('9x^2 + x', false),
    ],
  ),

  Question('What is the derivative of 4x^5 - x^2 + 7?',
    const [
      AnswerChoice('20x^4 - 2x', true),
      AnswerChoice('8x^4 - x', false),
      AnswerChoice('20x^5 - 2x', false),
      AnswerChoice('4x^5 - x^2', false),
    ],
  ),

  Question('What is the derivative of 0.5x^2 + 2x + 3?',
    const [
      AnswerChoice('x + 2', true),
      AnswerChoice('0.5x + 2', false),
      AnswerChoice('1.5x + 2', false),
      AnswerChoice('x^2 + 2', false),
    ],
  ),

  Question('What is the derivative of 7x^8 - 3x^4 + 2x^2 - x + 5?',
    const [
      AnswerChoice('56x^7 - 12x^3 + 4x - 1', true),
      AnswerChoice('56x^7 - 12x^3 + x', false),
      AnswerChoice('7x^8 - 3x^4 + 2x^2 - x + 5', false),
      AnswerChoice('56x^8 - 12x^4 + 4x^2 - 1', false),
    ],
  ),

  Question('What is the derivative of x^3 + 4x^2 + 6x + 8?',
    const [
      AnswerChoice('3x^2 + 8x + 6', true),
      AnswerChoice('3x^2 + x', false),
      AnswerChoice('x^3 + 8x + 6', false),
      AnswerChoice('3x^2 + 4x + 6', false),
    ],
  ),
];

final List<Question> _easyCat3_constants = [
  Question('What is the derivative of 12?',
    const [
      AnswerChoice('12', false),
      AnswerChoice('1', false),
      AnswerChoice('0', true),
      AnswerChoice('Undefined', false),
    ],
  ),

  Question('What is the derivative of -7x?',
    const [
      AnswerChoice('-7', true),
      AnswerChoice('7', false),
      AnswerChoice('-7x', false),
      AnswerChoice('0', false),
    ],
  ),

  Question('What is the derivative of 9x + 4?',
    const [
      AnswerChoice('9x', false),
      AnswerChoice('13', false),
      AnswerChoice('9', true),
      AnswerChoice('4', false),
    ],
  ),

  Question('What is the derivative of 5x^6 - 2x^3 + x - 4?',
    const [
      AnswerChoice('30x^5 - 6x^2 + 1', true),
      AnswerChoice('30x^5 - 6x^2 + x', false),
      AnswerChoice('5x^6 - 2x^3 + x - 4', false),
      AnswerChoice('30x^6 - 6x^3 + 1', false),
    ],
  ),

  Question('What is the derivative of -3(x^4)?',
    const [
      AnswerChoice('-12x^3', true),
      AnswerChoice('-3x^3', false),
      AnswerChoice('12x^3', false),
      AnswerChoice('-4x^3', false),
    ],
  ),

  Question('What is the derivative of (1/4)x^8?',
    const [
      AnswerChoice('2x^7', true),
      AnswerChoice('8x^7', false),
      AnswerChoice('(1/4)x^7', false),
      AnswerChoice('x^8', false),
    ],
  ),

  Question('What is the derivative of 2x^3 - 2x^3?',
    const [
      AnswerChoice('0', true),
      AnswerChoice('1', false),
      AnswerChoice('6x^2', false),
      AnswerChoice('2x^3', false),
    ],
  ),

  Question('What is the derivative of 10x^2 + 0x + 9?',
    const [
      AnswerChoice('20x', true),
      AnswerChoice('10x', false),
      AnswerChoice('20x + 9', false),
      AnswerChoice('10x^2', false),
    ],
  ),
];

final List<Question> _easyCat4_trigExpLog = [
  Question('What is the derivative of sin(x)?',
    const [
      AnswerChoice('-sin(x)', false),
      AnswerChoice('cos(x)', true),
      AnswerChoice('-cos(x)', false),
      AnswerChoice('sin(x)', false),
    ],
  ),

  Question('What is the derivative of cos(x)?',
    const [
      AnswerChoice('cos(x)', false),
      AnswerChoice('sin(x)', false),
      AnswerChoice('-sin(x)', true),
      AnswerChoice('-cos(x)', false),
    ],
  ),

  Question('What is the derivative of tan(x)?',
    const [
      AnswerChoice('sec(x)', false),
      AnswerChoice('sec^2(x)', true),
      AnswerChoice('csc^2(x)', false),
      AnswerChoice('cot(x)', false),
    ],
  ),

  Question('What is the derivative of 4sin(x) + 3cos(x)?',
    const [
      AnswerChoice('4cos(x) - 3sin(x)', true),
      AnswerChoice('-4cos(x) + 3sin(x)', false),
      AnswerChoice('4sin(x) + 3cos(x)', false),
      AnswerChoice('-4sin(x) - 3cos(x)', false),
    ],
  ),

  Question('What is the derivative of -3cos(x) + 2sin(x)?',
    const [
      AnswerChoice('-3sin(x) - 2cos(x)', false),
      AnswerChoice('3sin(x) + 2cos(x)', true),
      AnswerChoice('3cos(x) - 2sin(x)', false),
      AnswerChoice('-3cos(x) + 2sin(x)', false),
    ],
  ),

  Question('What is the derivative of e^x?',
    const [
      AnswerChoice('xe^x', false),
      AnswerChoice('e^x', true),
      AnswerChoice('e^(x-1)', false),
      AnswerChoice('x/e^x', false),
    ],
  ),

  Question('What is the derivative of 7e^x + 3x?',
    const [
      AnswerChoice('7e^x + 3', true),
      AnswerChoice('7e^x + 3x', false),
      AnswerChoice('7e^x', false),
      AnswerChoice('e^x + 3', false),
    ],
  ),

  Question('What is the derivative of ln(x)?',
    const [
      AnswerChoice('ln(x)', false),
      AnswerChoice('1/x', true),
      AnswerChoice('e^x', false),
      AnswerChoice('x', false),
    ],
  ),

  Question('What is the derivative of 5ln(x) + 2x?',
    const [
      AnswerChoice('5ln(x) + 2', false),
      AnswerChoice('5/x + 2', true),
      AnswerChoice('5/x + x', false),
      AnswerChoice('ln(x) + 2x', false),
    ],
  ),
];



// FUNCTIONS to handle answer selection, try again, and next question

void _tryAgain() {
  setState(() {
    _answered = false;   // Reset answered state
    _selectedChoiceIndex = null;  // Reset selected choice
    _feedbackText = null;  // Reset feedback text "wrong or correct"
  });
}

void _nextQuestion() {
  
  final questions = _activeQuestions;
  
  setState(() {
    if (_currentQuestionIndex < questions.length - 1) { 
      _currentQuestionIndex++;  // Move to next question
    } else {
      _currentQuestionIndex = 0; // restart question 
    }

    _answered = false;      // Reset answered state for the new question
    _selectedChoiceIndex = null;      // Reset selected choice
    _feedbackText = null;        // reset feedback text "wrong or correct"
  });
}

void _checkUnlock() {
  if (_streak < _unlockTarget) return;

  if (_category == Category.basicDefinition && !_powerRuleUnlocked) {
    _powerRuleUnlocked = true;
    _feedbackText = 'next level unlocked!';
    _streak = 0;
  } else if (_category == Category.powerRule && !_constantsUnlocked) {
    _constantsUnlocked = true;
    _feedbackText = 'next level unlocked!';
    _streak = 0;
  } else if (_category == Category.constants && !_trigExpLogUnlocked) {
    _trigExpLogUnlocked = true;
    _feedbackText = 'next level unlocked!';
    _streak = 0;
  }
      else if (_category == Category.trigExpLog && !_mediumUnlocked) {
        _mediumUnlocked = true;
        _feedbackText = "next level unlocked!";
        _streak = 0;
      }

  _saveProgress();
}









  @override
  Widget build(BuildContext context){
    final questions = _activeQuestions;
    final currentQuestion = questions[_currentQuestionIndex];

    return Scaffold(
     backgroundColor: const Color.fromARGB(255, 31, 29, 61),
      
      appBar: AppBar(

        leading: IconButton(
          icon: Icon(Icons.arrow_back,
          color: Color.fromARGB(255, 207, 207, 192),),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromARGB(255, 31, 29, 61),
      ),
      body: 
      Center( 
        child: 
          Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            Container(
              width: 335,
              padding: EdgeInsets.symmetric(horizontal: 39, vertical: 40),
              constraints: BoxConstraints(
                minHeight: 120,
                maxHeight: 200,
              ),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 45, 56, 85),
                borderRadius: BorderRadius.circular(12),
              ),
             child:
              Text(currentQuestion.text,
              
             
              style: const TextStyle(
              color: CupertinoColors.secondarySystemGroupedBackground,
              fontSize: 26,
              fontWeight: FontWeight.bold
              ),),
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
                        backgroundColor: Color.fromARGB(255, 45, 56, 85),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onPressed: _answered
                      ? null
                      : () {
                        // Handle answer selection
                       setState(() {
                        _selectedChoiceIndex =
                            currentQuestion.choices.indexOf(choice);
                        _answered = true;
                        if (choice.isCorrect) {
                          _feedbackText = 'Correct';
                          _streak++; // Increment streak for correct answer
                          _checkUnlock(); // runs the check unlock function to determine if we need to unlock next difficulty
                          
                        } else {
                          _feedbackText = 'Wrong';
                          _streak = 0; // Reset streak for wrong answer
                        }
                      });
                      _saveProgress(); // Save progress after answering
                    },

                      child: Text(
                        choice.text,
                        style: TextStyle(color:Color.fromARGB(255, 207, 207, 192),),
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
            child: ElevatedButton(onPressed: _answered ? _tryAgain : null, 
            child: Text("Try Again")),
          ),
        
        const SizedBox(width: 16),
          SizedBox(
            height: 48,
            width: 140,
            child: ElevatedButton(onPressed: _answered ? _nextQuestion : null, 
            child: Text("Next Question")),
          ),
        ]  
       ),
       const SizedBox(height: 20),
        if (_buildNextLevelButton() != null)
          _buildNextLevelButton()!,

          ],
        ),
      ),
    );
  }
}

