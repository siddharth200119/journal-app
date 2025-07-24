import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:journal_app/screens/home.dart';
import 'package:journal_app/theme/color_schemes.dart';
import 'package:journal_app/theme/theme_provider.dart';

class ThemeSelectionScreen extends StatefulWidget {
  const ThemeSelectionScreen({super.key});

  @override
  State<ThemeSelectionScreen> createState() => _ThemeSelectionScreenState();
}

class _ThemeSelectionScreenState extends State<ThemeSelectionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  int _selectedColorSchemeIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _saveThemeAndNavigate() async {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    themeProvider.setColorScheme(_selectedColorSchemeIndex);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first_launch', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Choose Your Theme',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                _buildColorSchemeSelector(),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: _saveThemeAndNavigate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: lightColorSchemes[_selectedColorSchemeIndex].primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColorSchemeSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(lightColorSchemes.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedColorSchemeIndex = index;
            });
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: lightColorSchemes[index].primary,
              shape: BoxShape.circle,
              border: _selectedColorSchemeIndex == index
                  ? Border.all(color: Colors.blue, width: 4)
                  : null,
            ),
          ),
        );
      }),
    );
  }
}
