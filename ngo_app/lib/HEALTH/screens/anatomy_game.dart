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

  final Map<String, String> _hints = {
    'brain': 'This organ controls thoughts, memory, and emotions.',
    'heart': 'This organ pumps blood throughout the body.',
    'lungs': 'These organs help you breathe.',
    'liver': 'This organ detoxifies chemicals and metabolizes drugs.',
    'stomach': 'This organ digests food.',
    'kidneys': 'These organs filter waste from the blood.',
  };

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
        return const Offset(200, 50);
      case 'heart':
        return const Offset(210, 250);
      case 'lungs':
        return const Offset(200, 250);
      case 'liver':
        return const Offset(200, 380);
      case 'stomach':
        return const Offset(220, 400);
      case 'kidneys':
        return const Offset(190, 440);
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
    final screenSize = MediaQuery.of(context).size;
    final currentPart = _bodyParts[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Anatomy Quiz Game'),
        backgroundColor: Colors.teal,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              BackgroundContainer(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
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
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: screenSize.width,
                            maxHeight: screenSize.height * 0.6,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/HEALTH/anatomy-254129_1280.jpg',
                                width: screenSize.width,
                                height: screenSize.height * 0.6,
                                fit: BoxFit.contain,
                              ),
                              CustomPaint(
                                size: Size(
                                  screenSize.width,
                                  screenSize.height * 0.6,
                                ),
                                painter: LabelLinePainter(
                                  bodyPart: currentPart,
                                ),
                              ),
                              Positioned(
                                top: _getPositionForPart(currentPart).dy - 20,
                                left: _getPositionForPart(currentPart).dx + 50,
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
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Hint: ${_hints[currentPart]}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _checkAnswer,
                          child: const Text('Submit'),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
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
          );
        },
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

    canvas.drawLine(bodyPartPosition, textFieldPosition, paint);
  }

  Offset _getPositionForPart(String bodyPart) {
    switch (bodyPart) {
      case 'brain':
        return const Offset(200, 30);
      case 'heart':
        return const Offset(210, 250);
      case 'lungs':
        return const Offset(160, 250);
      case 'liver':
        return const Offset(150, 350);
      case 'stomach':
        return const Offset(220, 380);
      case 'kidneys':
        return const Offset(150, 410);
      default:
        return const Offset(0, 0);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
