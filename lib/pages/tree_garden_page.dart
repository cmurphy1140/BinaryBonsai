import 'package:flutter/material.dart';

class TreeGardenPage extends StatefulWidget {
  const TreeGardenPage({super.key});

  @override
  State<TreeGardenPage> createState() => _TreeGardenPageState();
}

class _TreeGardenPageState extends State<TreeGardenPage> {
  final List<Map<String, dynamic>> _trees = [
    {
      'name': 'Cherry Blossom',
      'type': 'Cherry',
      'age': '2 years',
      'health': 85,
      'icon': Icons.local_florist,
      'color': Colors.pink,
    },
    {
      'name': 'Ancient Pine',
      'type': 'Pine',
      'age': '5 years',
      'health': 92,
      'icon': Icons.park,
      'color': Colors.green,
    },
    {
      'name': 'Autumn Maple',
      'type': 'Maple',
      'age': '3 years',
      'health': 78,
      'icon': Icons.nature,
      'color': Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bonsai Trees'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Digital Forest',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'You have ${_trees.length} bonsai trees in your collection',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: _trees.length,
                itemBuilder: (context, index) {
                  final tree = _trees[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: tree['color'].withOpacity(0.2),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(
                              tree['icon'],
                              size: 30,
                              color: tree['color'],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tree['name'],
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${tree['type']} • ${tree['age']}',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      'Health: ',
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                    Expanded(
                                      child: LinearProgressIndicator(
                                        value: tree['health'] / 100,
                                        backgroundColor: Colors.grey[300],
                                        valueColor: AlwaysStoppedAnimation<Color>(
                                          tree['health'] > 80 ? Colors.green : 
                                          tree['health'] > 60 ? Colors.orange : Colors.red,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text('${tree['health']}%'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () => _careForTree(tree['name']),
                            icon: const Icon(Icons.favorite_outline),
                            tooltip: 'Care for tree',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _plantNewTree,
        tooltip: 'Plant new tree',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _careForTree(String treeName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('💚 You cared for $treeName! Health increased.'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _plantNewTree() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🌱 Plant New Bonsai'),
        content: const Text('Choose your bonsai type:'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _trees.add({
                  'name': 'Young Cherry',
                  'type': 'Cherry',
                  'age': '1 month',
                  'health': 100,
                  'icon': Icons.local_florist,
                  'color': Colors.pink,
                });
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('🌸 Cherry Bonsai planted!')),
              );
            },
            child: const Text('Cherry'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _trees.add({
                  'name': 'Young Pine',
                  'type': 'Pine',
                  'age': '1 month',
                  'health': 100,
                  'icon': Icons.park,
                  'color': Colors.green,
                });
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('🌲 Pine Bonsai planted!')),
              );
            },
            child: const Text('Pine'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _trees.add({
                  'name': 'Young Maple',
                  'type': 'Maple',
                  'age': '1 month',
                  'health': 100,
                  'icon': Icons.nature,
                  'color': Colors.orange,
                });
              });
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
