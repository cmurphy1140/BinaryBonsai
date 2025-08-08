import 'package:flutter/material.dart';
import 'dart:async';

class MeditationPage extends StatefulWidget {
  const MeditationPage({super.key});

  @override
  State<MeditationPage> createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> with TickerProviderStateMixin {
  Timer? _timer;
  int _seconds = 0;
  bool _isRunning = false;
  int _selectedMinutes = 5;
  late AnimationController _breathingController;
  late Animation<double> _breathingAnimation;

  final List<int> _durations = [1, 3, 5, 10, 15, 20];

  @override
  void initState() {
    super.initState();
    _breathingController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _breathingAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _breathingController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _timer?.cancel();
    _breathingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meditation'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_isRunning) ...[
              const Icon(
                Icons.self_improvement,
                size: 80,
                color: Color(0xFF4CAF50),
              ),
              const SizedBox(height: 32),
              Text(
                'Choose Meditation Duration',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: _durations.map((minutes) {
                  return ChoiceChip(
                    label: Text('$minutes min'),
                    selected: _selectedMinutes == minutes,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          _selectedMinutes = minutes;
                        });
                      }
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 48),
              ElevatedButton.icon(
                onPressed: _startMeditation,
                icon: const Icon(Icons.play_arrow),
                label: const Text('Start Meditation'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
              ),
            ] else ...[
              AnimatedBuilder(
                animation: _breathingAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _breathingAnimation.value,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            const Color(0xFF4CAF50).withOpacity(0.3),
                            const Color(0xFF4CAF50).withOpacity(0.1),
                          ],
                        ),
                      ),
                      child: const Icon(
                        Icons.circle,
                        size: 100,
                        color: Color(0xFF4CAF50),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              Text(
                'Breathe with the circle',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                _formatTime(_seconds),
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: _pauseMeditation,
                    icon: const Icon(Icons.pause),
                    label: const Text('Pause'),
                  ),
                  ElevatedButton.icon(
                    onPressed: _stopMeditation,
                    icon: const Icon(Icons.stop),
                    label: const Text('Stop'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _startMeditation() {
    setState(() {
      _isRunning = true;
      _seconds = _selectedMinutes * 60;
    });
    
    _breathingController.repeat(reverse: true);
    
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _stopMeditation();
          _showCompletionDialog();
        }
      });
    });
  }

  void _pauseMeditation() {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
      _breathingController.stop();
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_seconds > 0) {
            _seconds--;
          } else {
            _stopMeditation();
            _showCompletionDialog();
          }
        });
      });
      _breathingController.repeat(reverse: true);
    }
  }

  void _stopMeditation() {
    _timer?.cancel();
    _breathingController.stop();
    setState(() {
      _isRunning = false;
      _seconds = 0;
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🧘 Meditation Complete'),
        content: Text('Well done! You meditated for $_selectedMinutes minutes.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Great!'),
          ),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
