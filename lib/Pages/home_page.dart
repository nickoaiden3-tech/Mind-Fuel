import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mind_fuel_application/Easy%20Pages/derivative_easy_navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

Future<void> _resetProgress() async {
  final prefs = await SharedPreferences.getInstance();

  // 🔥 FULL RESET — clears ALL saved progress
  await prefs.clear();

  if (!mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('All progress reset')),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 29, 61),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 29, 61),
        leading: const Icon(
          Icons.menu,
          color: Color.fromARGB(255, 207, 207, 192),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              'MindFuel',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 207, 207, 192),
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Fuel your calculus',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 207, 207, 192),
              ),
            ),

            const SizedBox(height: 170),

            // GET STARTED BUTTON
            SizedBox(
              width: 320,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 207, 207, 192),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(color: Color.fromARGB(255, 31, 29, 61)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DerivativeEasyNavigator(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // RESET PROGRESS BUTTON
            SizedBox(
              width: 320,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  'Reset Progress',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Reset Progress?'),
                      content: const Text(
                        'This will reset all streaks and unlocks.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('Reset'),
                        ),
                      ],
                    ),
                  );

                  if (confirm == true) {
                    await _resetProgress();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
