import 'package:flutter/material.dart';
import 'tree_garden_page.dart';
import 'meditation_page.dart';
import 'quotes_page.dart';

class GardenPage extends StatefulWidget {
  const GardenPage({super.key});

  @override
  State<GardenPage> createState() => _GardenPageState();
}

class _GardenPageState extends State<GardenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Binary Bonsai Garden'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.park,
              size: 80,
              color: Color(0xFF4CAF50),
            ),
            const SizedBox(height: 16),
            const Text(
              'Welcome to your Binary Bonsai Garden',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your digital zen space awaits',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40),
            // Navigation buttons
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _navigateToTreeGarden(context),
                  icon: const Icon(Icons.local_florist),
                  label: const Text('My Trees'),
                ),
                ElevatedButton.icon(
                  onPressed: () => _navigateToMeditation(context),
                  icon: const Icon(Icons.self_improvement),
                  label: const Text('Meditate'),
                ),
                ElevatedButton.icon(
                  onPressed: () => _navigateToQuotes(context),
                  icon: const Icon(Icons.format_quote),
                  label: const Text('Zen Quotes'),
                ),
                ElevatedButton.icon(
                  onPressed: () => _navigateToSettings(context),
                  icon: const Icon(Icons.settings),
                  label: const Text('Settings'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _plantNewTree(context),
        tooltip: 'Plant a new bonsai',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _navigateToTreeGarden(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TreeGardenPage()),
    );
  }

  void _navigateToMeditation(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MeditationPage()),
    );
  }

  void _navigateToQuotes(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QuotesPage()),
    );
  }

  void _navigateToSettings(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('⚙️ Settings coming soon!')),
    );
  }

  void _plantNewTree(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🌱 Plant New Bonsai'),
        content: const Text('Choose your bonsai type:'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('🌸 Cherry Bonsai planted!')),
              );
            },
            child: const Text('Cherry'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('🌲 Pine Bonsai planted!')),
              );
            },
            child: const Text('Pine'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('🍁 Maple Bonsai planted!')),
              );
            },
            child: const Text('Maple'),
          ),
        ],
      ),
    );
  }
}
