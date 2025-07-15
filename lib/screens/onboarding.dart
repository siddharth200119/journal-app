import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/images/onboarding.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      // Responsive title
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Welcome to Your Journal",
                          style: const TextStyle(
                            fontFamily: "Epilogue",
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Responsive subtitle
                      AutoSizeText(
                        "Start capturing your thoughts, experiences, and reflections with ease.",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: const TextStyle(
                          fontFamily: "Epilogue",
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(vertical: 10),
                          ),
                          backgroundColor:
                              WidgetStateProperty.all<Color>(Colors.blue),
                        ),
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
