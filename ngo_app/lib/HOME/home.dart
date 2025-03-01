import 'package:flutter/material.dart';
import 'package:ngo_app/P&D/personal_home_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../ENVIRONMENT/environment_page.dart';
import '../FINANCE1/screens/comp.dart';
import '../SCIENCE/main.dart';
import '../HEALTH/screens/front_page.dart';
// Import includes SocialHomePage
import '../SOCIAL/social_home.dart'; // Import the SocialHomePage class
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool _animate = false;
  bool _showHome = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  final List<Color> _gradientColors = [
    const Color(0xFF2196F3), // Blue
    const Color(0xFF673AB7), // Deep Purple
    const Color(0xFF3F51B5), // Indigo
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
    ));

    _startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _animate = true;
      });

      Future.delayed(const Duration(milliseconds: 1500), () {
        setState(() {
          _showHome = true;
        });
        _controller.forward();
      });
    });
  }

  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://www.arisevishwasociety.org/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _showHome
          ? AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: _launchURL,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/ENVIRONMENT/Arise_Logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              centerTitle: true,
              title: const Text(
                "अवली ॲप",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  fontSize: 24,
                  shadows: [
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(100, 0, 0, 0),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          : null,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: _gradientColors,
              ),
            ),
          ),
          if (_showHome)
            Positioned.fill(
              child: CustomPaint(
                painter: BackgroundPatternPainter(),
              ),
            ),
          if (_showHome)
            FadeTransition(
              opacity: _fadeAnimation,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    children: [
                      _buildEnhancedButton(context, "वैयक्तिक विकास",
                          Icons.person_outline, const Color(0xFF4CAF50),
                          goToPersonalDevelopment: true),
                      _buildEnhancedButton(context, "सामाजिक",
                          Icons.people_outline, const Color(0xFF2196F3),
                          goToSocial: true),
                      _buildEnhancedButton(context, "आरोग्य आणि स्वच्छता",
                          Icons.favorite_border, const Color(0xFFE91E63),
                          goToHealth: true),
                      _buildEnhancedButton(context, "विज्ञान आणि तंत्रज्ञान",
                          Icons.lightbulb_outline, const Color(0xFF9C27B0),
                          goToScience: true),
                      _buildEnhancedButton(context, "पर्यावरण",
                          Icons.nature_outlined, const Color(0xFF009688),
                          goToEnvironment: true),
                      _buildEnhancedButton(context, "वित्त", Icons.attach_money,
                          const Color(0xFFFF9800),
                          goToFinance: true),
                    ],
                  ),
                ),
              ),
            ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1500),
            curve: Curves.easeInOutBack,
            top: _animate ? 10 : MediaQuery.of(context).size.height / 2 - 80,
            left: _animate ? 10 : MediaQuery.of(context).size.width / 2 - 80,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              opacity: _showHome ? 0.0 : 1.0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeInOutBack,
                width: _animate ? 80 : 160,
                height: _animate ? 80 : 160,
                child: GestureDetector(
                  onTap: _launchURL,
                  child: Image.asset(
                    'assets/ENVIRONMENT/Arise_Logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnhancedButton(
      BuildContext context, String title, IconData icon, Color color,
      {bool goToEnvironment = false,
      bool goToFinance = false,
      bool goToPersonalDevelopment = false,
      bool goToScience = false,
      bool goToHealth = false,
      bool goToSocial = false}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withOpacity(0.7),
            color,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: () {
            if (goToEnvironment) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EnvironmentPage()),
              );
            } else if (goToFinance) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CompPage()),
              );
            } else if (goToPersonalDevelopment) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage1()),
              );
            } else if (goToScience) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AvaliScienceApp()),
              );
            } else if (goToHealth) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FrontPage()),
              );
            } else if (goToSocial) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SocialHomePage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("$title बटण दाबले"),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 48,
                  color: Colors.white,
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 2.0,
                        color: Color.fromARGB(100, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BackgroundPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..style = PaintingStyle.fill;

    final path = Path();

    for (var i = 0; i < 5; i++) {
      final random = math.Random();
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = 20.0 + random.nextDouble() * 80;

      path.addOval(Rect.fromCircle(center: Offset(x, y), radius: radius));
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
