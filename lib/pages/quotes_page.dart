import 'package:flutter/material.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  final List<Map<String, String>> _quotes = [
    {
      'quote': 'The best time to plant a tree was 20 years ago. The second best time is now.',
      'author': 'Chinese Proverb',
    },
    {
      'quote': 'In every walk with nature, one receives far more than they seek.',
      'author': 'John Muir',
    },
    {
      'quote': 'The clearest way into the Universe is through a forest wilderness.',
      'author': 'John Muir',
    },
    {
      'quote': 'A tree is known by its fruit; a man by his deeds.',
      'author': 'Saint Basil',
    },
    {
      'quote': 'The creation of a thousand forests is in one acorn.',
      'author': 'Ralph Waldo Emerson',
    },
    {
      'quote': 'He who plants a tree, plants hope.',
      'author': 'Lucy Larcom',
    },
    {
      'quote': 'The tree that would grow to heaven must send its roots to hell.',
      'author': 'Carl Jung',
    },
    {
      'quote': 'A society grows great when old men plant trees whose shade they know they shall never sit in.',
      'author': 'Greek Proverb',
    },
  ];

  int _currentQuoteIndex = 0;

  @override
  Widget build(BuildContext context) {
    final currentQuote = _quotes[_currentQuoteIndex];
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zen Quotes'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.format_quote,
              size: 64,
              color: Color(0xFF4CAF50),
            ),
            const SizedBox(height: 32),
            Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text(
                      '"${currentQuote['quote']}"',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontStyle: FontStyle.italic,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '— ${currentQuote['author']}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _previousQuote,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Previous'),
                ),
                ElevatedButton.icon(
                  onPressed: _nextQuote,
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Next'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Quote ${_currentQuoteIndex + 1} of ${_quotes.length}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _randomQuote,
        tooltip: 'Random quote',
        child: const Icon(Icons.shuffle),
      ),
    );
  }

  void _nextQuote() {
    setState(() {
      _currentQuoteIndex = (_currentQuoteIndex + 1) % _quotes.length;
    });
  }

  void _previousQuote() {
    setState(() {
      _currentQuoteIndex = (_currentQuoteIndex - 1 + _quotes.length) % _quotes.length;
    });
  }

  void _randomQuote() {
    setState(() {
      _currentQuoteIndex = DateTime.now().millisecondsSinceEpoch % _quotes.length;
    });
  }
}
