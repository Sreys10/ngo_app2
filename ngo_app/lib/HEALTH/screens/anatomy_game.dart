import 'package:flutter/material.dart';
import '../widgets/background_container.dart';

class AnatomyQuizGame extends StatefulWidget {
  const AnatomyQuizGame({super.key});

  @override
  State<AnatomyQuizGame> createState() => _AnatomyQuizGameState();
}

class _AnatomyQuizGameState extends State<AnatomyQuizGame> {
  final Map<String, String> _correctAnswers = {
    'brain': 'Brain',
    'heart': 'Heart',
    'lungs': 'Lungs',
    'liver': 'Liver',
    'stomach': 'Stomach',
    'kidneys': 'Kidneys',
  };

  final List<String> _bodyParts = [
    'brain',
    'heart',
    'lungs',
    'liver',
    'stomach',
    'kidneys'
  ];
  final TextEditingController _controller = TextEditingController();

  int _currentIndex = 0;
  bool? _isCorrect;

  void _checkAnswer() {
    setState(() {
      final currentPart = _bodyParts[_currentIndex];
      if (_controller.text.trim().toLowerCase() ==
          _correctAnswers[currentPart]!.toLowerCase()) {
        _isCorrect = true;
        _showFeedback(true);
      } else {
        _isCorrect = false;
        _showFeedback(false);
      }
    });
  }

  void _showFeedback(bool isCorrect) {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (isCorrect) {
          if (_currentIndex < _bodyParts.length - 1) {
            _currentIndex++;
          } else {
            // Quiz complete
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Congratulations!'),
                content:
                    const Text('You have labeled all body parts correctly!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                    child: const Text('Restart'),
                  ),
                ],
              ),
            );
          }
        }
        _isCorrect = null;
        _controller.clear();
      });
    });
  }

  Offset _getPositionForPart(String bodyPart) {
    switch (bodyPart) {
      case 'brain':
        return const Offset(200, 80);
      case 'heart':
        return const Offset(190, 220);
      case 'lungs':
        return const Offset(180, 180);
      case 'liver':
        return const Offset(200, 300);
      case 'stomach':
        return const Offset(220, 350);
      case 'kidneys':
        return const Offset(210, 420);
      default:
        return const Offset(0, 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentPart = _bodyParts[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Anatomy Quiz Game'),
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          BackgroundContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Identify the Body Part',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/HEALTH/anatomy-254129_1280.jpg',
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.6,
                      fit: BoxFit.contain,
                    ),
                    // Draw the line for the current body part
                    CustomPaint(
                      size: Size(
                        MediaQuery.of(context).size.width * 0.8,
                        MediaQuery.of(context).size.height * 0.6,
                      ),
                      painter: LabelLinePainter(
                        bodyPart: currentPart,
                      ),
                    ),
                    Positioned(
                      top: _getPositionForPart(currentPart).dy,
                      left: _getPositionForPart(currentPart).dx + 100,
                      child: SizedBox(
                        width: 150,
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: 'Enter answer',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.white70,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _checkAnswer,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
          if (_isCorrect != null)
            Container(
              color: Colors.black.withOpacity(0.8),
              child: Center(
                child: Icon(
                  _isCorrect! ? Icons.check_circle : Icons.cancel,
                  color: _isCorrect! ? Colors.green : Colors.red,
                  size: 150,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class LabelLinePainter extends CustomPainter {
  final String bodyPart;

  LabelLinePainter({required this.bodyPart});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4;

    final Offset bodyPartPosition = _getPositionForPart(bodyPart);
    final Offset textFieldPosition =
        Offset(bodyPartPosition.dx + 100, bodyPartPosition.dy + 20);

    // Draw line from body part to text field
    canvas.drawLine(bodyPartPosition, textFieldPosition, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  Offset _getPositionForPart(String bodyPart) {
    switch (bodyPart) {
      case 'brain':
        return const Offset(200, 80);
      case 'heart':
        return const Offset(190, 220);
      case 'lungs':
        return const Offset(180, 180);
      case 'liver':
        return const Offset(200, 300);
      case 'stomach':
        return const Offset(220, 350);
      case 'kidneys':
        return const Offset(210, 420);
      default:
        return const Offset(0, 0);
    }
  }
}
