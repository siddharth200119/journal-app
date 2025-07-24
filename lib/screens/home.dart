import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';
import 'search_page.dart';
import 'settings_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final systemOverlayStyle = isDarkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(systemOverlayStyle),
      body: _buildBody(systemOverlayStyle),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget _buildAppBar(SystemUiOverlayStyle systemOverlayStyle) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text('Journal'),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {
            // TODO: Implement add functionality
          },
          icon: const Icon(Icons.add),
        ),
      ],
      systemOverlayStyle: systemOverlayStyle,
    );
  }

  Widget _buildBody(SystemUiOverlayStyle systemOverlayStyle) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemOverlayStyle,
      child: _pages[_currentIndex],
    );
  }

  Widget _buildBottomNavigationBar() {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      selectedItemColor: theme.colorScheme.primary,
      unselectedItemColor: isDarkMode ? Colors.white70 : Colors.black54,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
