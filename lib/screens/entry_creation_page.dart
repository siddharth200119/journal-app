import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:journal_app/theme/theme_provider.dart';

class EntryCreationPage extends StatefulWidget {
  const EntryCreationPage({super.key});

  @override
  State<EntryCreationPage> createState() => _EntryCreationPageState();
}

class _EntryCreationPageState extends State<EntryCreationPage> {
  final TextEditingController _textController = TextEditingController();
  bool _isRecording = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('New Entry'),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Implement save functionality for text and/or audio
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.save_alt_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
        child: Column(
          children: [
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintText: 'What\'s on your mind?',
                    border: InputBorder.none,
                  ),
                  maxLines: null,
                  expands: true,
                  autofocus: true,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isRecording = !_isRecording;
          });
          // TODO: Implement audio recording functionality
        },
        child: Icon(_isRecording ? Icons.stop : Icons.mic),
      ),
    );
  }
}
