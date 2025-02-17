// import 'dart:async';
// import 'package:bytemind1/compo2/localizations._helpers.dart';
// import 'package:flutter/material.dart';
// import 'package:animate_do/animate_do.dart'; // For animations
// import 'package:confetti/confetti.dart'; // For confetti
// // import 'package:flutter_localizations/flutter_localizations.dart';
// // import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import the generated clas
// // Import intl package
// class FamilyBudgetGameApp extends StatefulWidget {
//   const FamilyBudgetGameApp({super.key});
//
//   @override
//   State<FamilyBudgetGameApp> createState() => _FamilyBudgetGameAppState();
// }
//
// class _FamilyBudgetGameAppState extends State<FamilyBudgetGameApp> {
//   Locale _locale = const Locale('en'); // Default language
//
//   void _setLocale(Locale locale) {
//     setState(() {
//       _locale = locale;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'BudgetWise',
//       theme: ThemeData(
//         // Apply the provided color scheme consistently
//         primaryColor: const Color(0xFF3498DB), // Primary (dark blue)
//         colorScheme: ColorScheme.fromSwatch().copyWith(
//           primary: const Color(0xFF3498DB),
//           secondary: const Color(0xFF5DADE2), // Secondary (light blue)
//           tertiary: const Color(0xFF76D7C4), // Tertiary (green)
//           surface: const Color(0xFFD1F2EB), // Background (light gray)
//         ),
//         textTheme: const TextTheme(
//           // Apply consistent text color based on background color
//           bodyLarge: TextStyle(color: Colors.black), // Black for readability
//         ),
//         appBarTheme: const AppBarTheme(
//           // Apply consistent color scheme to app bar
//           backgroundColor: Color(0xFF3498DB), // Primary (dark blue)
//           foregroundColor: Colors.white, // White text for contrast
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           // Apply consistent color scheme to buttons
//           style: ElevatedButton.styleFrom(
//             foregroundColor: Colors.white,
//             backgroundColor: const Color(0xFF3498DB), // White text for contrast
//           ),
//         ),
//       ),
//       locale: _locale,
//       localizationsDelegates: const [
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: const [
//         Locale('en'), // English
//         Locale('mr'), // Marathi
//         Locale('hi'), // Hindi
//       ],
//       home: MainScreen(setLocale: _setLocale),
//     );
//   }
// }
//
// class MainScreen extends StatelessWidget {
//   final Function(Locale) setLocale;
//
//   const MainScreen({super.key, required this.setLocale});
// //  const MainScreen({super.key, required this.setLocale});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(AppLocalizations.of(context)!.appTitle),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 16.0),
//             child: DropdownButton<Locale>(
//               underline: Container(),
//               icon: const Icon(Icons.language, color: Colors.white),
//               onChanged: (Locale? locale) {
//                 if (locale != null) {
//                   setLocale(locale);
//                 }
//               },
//               items: const [
//                 DropdownMenuItem(
//                   value: Locale('en'),
//                   child: Text('English'),
//                 ),
//                 DropdownMenuItem(
//                   value: Locale('mr'),
//                   child: Text('Marathi'),
//                 ),
//                 DropdownMenuItem(
//                   value: Locale('hi'),
//                   child: Text('Hindi'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 AppLocalizations.of(context)!.welcomeText,
//                 style: const TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 AppLocalizations.of(context)!.descriptionText,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey[600],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 40),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const ScenarioScreen(),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
//                   textStyle: const TextStyle(fontSize: 18),
//                 ),
//                 child: Text(AppLocalizations.of(context)!.startChallenge),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Scenario {
//   final String title;
//   final String description;
//   final String imagePath;
//   final Map<String, double> suggestedBudget;
//   final int level;
//
//   Scenario(this.title, this.description, this.imagePath, this.suggestedBudget,
//       this.level);
//   bool validateBudget(double totalBudget) {
//     double sumOfCategories = suggestedBudget.values.fold(0, (a, b) => a + b);
//     return sumOfCategories == totalBudget;
//   }
//
//   /// Get the total budget from the sum of category budgets
//   double getTotalBudget() {
//     return suggestedBudget.values.fold(0, (a, b) => a + b);
//   }
// }
//
// class SpeechBubblePainter extends CustomPainter {
//   final Color color; // Base color
//   final bool hasShadow; // Option to enable/disable shadow
//   final Gradient? gradient; // Optional gradient for background
//
//   SpeechBubblePainter({
//     required this.color,
//     this.hasShadow = true,
//     this.gradient,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = color
//       ..style = PaintingStyle.fill;
//
//     // Add gradient if provided
//     if (gradient != null) {
//       paint.shader =
//           gradient!.createShader(Rect.fromLTWH(0, 0, size.width, size.height));
//     }
//
//     // Add shadow if enabled
//     if (hasShadow) {
//       final shadowPaint = Paint()
//         ..color = Colors.black.withOpacity(0.2)
//         ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6.0);
//       final shadowPath = _getBubblePath(size, Offset.zero, 20);
//       canvas.drawPath(shadowPath, shadowPaint);
//     }
//
//     // Draw the bubble with the curved tail
//     final path = _getBubblePath(size, Offset(40, 20), 40);
//     canvas.drawPath(path, paint);
//   }
//
//   Path _getBubblePath(Size size, Offset tailOffset, double tailLength) {
//     final path = Path()
//       ..moveTo(20, 0) // Start from the top-left corner
//       ..lineTo(size.width - 20, 0) // Top-right corner
//       ..arcToPoint(Offset(size.width, 20),
//           radius: const Radius.circular(20)) // Top-right curve
//       ..lineTo(size.width, size.height - 20) // Right side
//       ..arcToPoint(Offset(size.width - 20, size.height),
//           radius: const Radius.circular(20)) // Bottom-right curve
//       ..lineTo(
//           tailOffset.dx + tailLength, size.height) // Bottom before tail start
//       ..lineTo(tailOffset.dx + tailLength / 2,
//           size.height + 10) // Tail top (triangle's top point)
//       ..lineTo(tailOffset.dx, size.height) // Tail bottom point
//       ..lineTo(20, size.height) // Bottom-left
//       ..arcToPoint(Offset(0, size.height - 20),
//           radius: const Radius.circular(20)) // Bottom-left curve
//       ..lineTo(0, 20) // Left side
//       ..arcToPoint(Offset(20, 0),
//           radius: const Radius.circular(20)) // Top-left curve
//       ..close();
//     return path;
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
//
// class ScenarioScreen extends StatefulWidget {
//   const ScenarioScreen({super.key});
//
//   @override
//   _ScenarioScreenState createState() => _ScenarioScreenState();
// }
//
// class _ScenarioScreenState extends State<ScenarioScreen> {
//   final double totalBudget = 2000;
//   double allocatedBudget = 0;
//   double remainingBudget = 2000;
//   int score = 0;
//   int currentScenarioIndex = 0;
//   late ConfettiController _controller;
//   int currentLevel = 0;
//   int coins = 0; // Coins for rewards
//   List<String> achievements = [];
//   final int inactivityDuration = 30;
//   Timer? _inactivityTimer;
//   bool isTimerPopupShown = false;
//   bool allScenariosCompleted = false;
//
//   Timer? _scenarioTimer; // Timer for each scenario
//   int _remainingScenarioTime = 50; // Initial time for each scenario
//
//   Map<String, double> categories = {};
//   final Map<String, String> categoryImages = {
//     "Groceries": "assets/images/groccery.gif",
//     "Transportation": "assets/images/transportation.gif",
//     "Entertainment": "assets/images/entertainment.gif",
//     "Savings": "assets/images/savings.gif",
//     "Personal Care": "assets/images/personal_care.gif",
//     "Books": "assets/images/books.gif",
//     "Stationery": "assets/images/stationary.gif",
//     "Gift": "assets/images/gift.gif",
//     "Snacks": "assets/images/snacks.gif",
//     "Food": "assets/images/food.gif",
//     "Backpack": "assets/images/backpack.gif",
//     "Sports": "assets/images/sport.gif",
//     "Headphones": "assets/images/headphone.gif",
//     "Mouse": "assets/images/mouse.gif",
//     "Course Fee": "assets/images/cf.gif",
//     "Study Materials": "assets/images/study_materials.gif",
//     "Party Contribution": "assets/images/party.gif",
//   };
//   Map<int, List<String>> scenarioAchievements = {};
//   final List<Scenario> scenarios = [
//     // Scenarios with levels
//     Scenario(
//         "Summer Job Earnings",
//         "You earned ₹2000 from your summer job. Plan your budget for the month.",
//         "assets/images/summerjob.gif",
//         {
//           "Groceries": 300,
//           "Transportation": 200,
//           "Entertainment": 400,
//           "Savings": 500,
//           "Personal Care": 200
//         },
//         0),
//     Scenario(
//         "Weekend Trip",
//         "You want to go on a weekend trip with friends. Allocate your budget accordingly.",
//         "assets//images/trip.gif",
//         {
//           "Groceries": 200,
//           "Transportation": 500,
//           "Entertainment": 700,
//           "Savings": 100,
//           "Personal Care": 100
//         },
//         1),
//     Scenario(
//         "New Phone Savings",
//         "You're saving up for a new phone worth ₹5000. How much can you save this month?",
//         "assets/images/phone.gif",
//         {
//           "Groceries": 300,
//           "Transportation": 100,
//           "Entertainment": 200,
//           "Savings": 1000,
//           "Personal Care": 100
//         },
//         2),
//     Scenario(
//         "Birthday Gift",
//         "You have ₹2000 to buy a gift for your friend's birthday.",
//         "assets/images/gift.gif",
//         {"Gift": 700, "Snacks": 100},
//         1),
//     Scenario(
//         "School Supplies",
//         "You need to buy school supplies with ₹2500. Plan your purchases.",
//         "assets/images/school.gif",
//         {"Books": 400, "Stationery": 300, "Backpack": 300},
//         2),
//     Scenario(
//         "Concert Tickets",
//         "You want to buy concert tickets worth ₹1800. Plan your savings for this month.",
//         "assets/images/ticket.gif",
//         {"Savings": 1000, "Entertainment": 800},
//         3),
//     // Add more scenarios with increasing levels
//   ];
//   Stopwatch _stopwatch = Stopwatch(); // Create a stopwatch
//   int totalElapsedTime = 0;
//   @override
//   void initState() {
//     super.initState();
//     _controller = ConfettiController(duration: const Duration(seconds: 3));
//     _validateScenarios();
//     _resetCategories();
//     _startScenarioTimer(); // Start timer when screen initializes
//     _stopwatch.start();
//   }
//
//   void _validateScenarios() {
//     for (var i = 0; i < scenarios.length; i++) {
//       double totalBudget = scenarios[i].getTotalBudget(); // Calculate total
//       if (!scenarios[i].validateBudget(totalBudget)) {
//         print(AppLocalizations.of(context)!.scenarioBudgetMismatch(
//             scenarios[i].title, totalBudget.toStringAsFixed(2)));
//         // Handle errors: e.g., log, fix, or throw an exception
//       }
//     }
//   }
//
//   @override
//   void dispose() {
//     _stopwatch.stop();
//     _controller.dispose();
//     _scenarioTimer?.cancel(); // Cancel timer when screen disposes
//     super.dispose();
//   }
//
//   String getFormattedTime() {
//     return _remainingScenarioTime.toString();
//   }
//
//   void resetInactivityTimer() {
//     if (allScenariosCompleted) return;
//     _inactivityTimer?.cancel();
//     _inactivityTimer =
//         Timer(Duration(seconds: inactivityDuration), showInactivityPopup);
//   }
//
//   void updateCategory(String category, double value) {
//     setState(() {
//       double diff = value - (categories[category] ?? 0);
//       if (allocatedBudget + diff <= totalBudget && value >= 0) {
//         allocatedBudget += diff;
//         remainingBudget = totalBudget - allocatedBudget;
//         categories[category] = value;
//         // DO NOT CHECK ACHIEVEMENTS HERE ANYMORE
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(AppLocalizations.of(context)!.invalidAllocation),
//           ),
//         );
//       }
//     });
//   }
//
//   void _navigateToResult() async {
//     if (allocatedBudget > totalBudget) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text(AppLocalizations.of(context)!.budgetExceeded)));
//       return;
//     }
//     _scenarioTimer?.cancel();
//
//     final result = await Navigator.push(
//       context,
//       PageRouteBuilder(
//         pageBuilder: (context, animation, secondaryAnimation) => ResultScreen(
//           scenario: scenarios[currentScenarioIndex],
//           budget: Map.from(categories),
//           totalBudget: totalBudget,
//           allocatedBudget: allocatedBudget,
//           remainingBudget: remainingBudget,
//           suggestedBudget: scenarios[currentScenarioIndex].suggestedBudget,
//           currentScenarioIndex:currentScenarioIndex,
//         ),
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           const begin = Offset(1.0, 0.0);
//           const end = Offset.zero;
//           const curve = Curves.ease;
//           var tween =
//               Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//           return SlideTransition(
//             position: animation.drive(tween),
//             child: child,
//           );
//         },
//       ),
//     );
//
//     if (result != null && result is int) {
//       setState(() {
//         score += result;
//         coins += (result ~/ 10);
//       });
//       _handleScenarioCompletion(result);
//     }
//   }
//
//   void _handleScenarioCompletion(int result) async {
//     _controller.play();
//
//     List<String> currentScenarioAchievements =
//         scenarioAchievements.putIfAbsent(currentScenarioIndex, () => []);
//
//     final localizations = AppLocalizations.of(context)!; // Get Localizations
//
//     if (result <= 20 &&
//         !currentScenarioAchievements.contains(localizations.keepImproving)) {
//       await _showAchievementPopup(context, localizations.keepImproving, result);
//       _addAchievement(localizations.keepImproving, currentScenarioAchievements);
//     } else if (result > 20 &&
//         result < 30 &&
//         !currentScenarioAchievements.contains(localizations.levelUp)) {
//       await _showAchievementPopup(context, localizations.levelUp, result);
//       _addAchievement(localizations.levelUp, currentScenarioAchievements);
//     } else if (result >= 30 &&
//         result < 40 &&
//         !currentScenarioAchievements.contains(localizations.moneyMaster)) {
//       await _showAchievementPopup(context, localizations.moneyMaster, result);
//       _addAchievement(localizations.moneyMaster, currentScenarioAchievements);
//     } else if (result >= 40 &&
//         !currentScenarioAchievements.contains(localizations.budgetingGuru)) {
//       await _showAchievementPopup(context, localizations.budgetingGuru, result);
//       _addAchievement(localizations.budgetingGuru, currentScenarioAchievements);
//     }
//
//     if (currentScenarioIndex == scenarios.length - 1) {
//       _completeGame();
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         backgroundColor: (const Color.fromARGB(255, 4, 203, 10)),
//         content: Text(
//           localizations.wellDone(result ~/ 10), // Use wellDone function
//           style: const TextStyle(color: Color.fromARGB(255, 218, 224, 218)),
//         ),
//       ));
//       _goToNextScenario(false);
//     }
//   }
//
//   void _completeGame() {
//     List<String> allAchievements = [];
//     scenarioAchievements.forEach((key, value) => allAchievements.addAll(value));
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => CompletionScreen(
//             score: score, coins: coins, achievements: allAchievements),
//       ),
//     );
//   }
//
//   Future<void> _showAchievementPopup(
//       BuildContext context, String achievement, int score) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         final localizations = AppLocalizations.of(context)!;
//         return Dialog(
//           insetPadding: const EdgeInsets.all(20),
//           backgroundColor: Colors.transparent,
//           child: LayoutBuilder(
//             // Use LayoutBuilder for responsive sizing
//             builder: (context, BoxConstraints constraints) {
//               return ConstrainedBox(
//                 // Wrap content with ConstrainedBox
//                 constraints: BoxConstraints(
//                   maxWidth: constraints.maxWidth * 0.3, // Limit width to 80%
//                   maxHeight: constraints.maxHeight * 0.3, // Limit height to 50%
//                 ),
//                 child: CustomPaint(
//                   painter: SpeechBubblePainter(color: const Color(0xFFD1F2EB)),
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.all(16), // Adjust padding as needed
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           localizations.achievementUnlocked,
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 20),
//                         ),
//                         const SizedBox(height: 10),
//                         Text(
//                           achievement,
//                           style: const TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 10),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Icon(
//                               Icons.monetization_on,
//                               color: Color(0xFFFFD700),
//                               size: 20,
//                             ),
//                             const SizedBox(width: 5),
//                             Text(
//                               "$score",
//                               style: const TextStyle(fontSize: 16),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20),
//                         TextButton(
//                           onPressed: () => Navigator.of(context).pop(),
//                           child: Text(
//                             localizations.ok,
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
//
//   void _addAchievement(String achievement, List<String> scenarioAchievements) {
//     if (!scenarioAchievements.contains(achievement)) {
//       scenarioAchievements.add(achievement);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Get the current scenario
//     Scenario currentScenario = scenarios[currentScenarioIndex];
//
//     // Fetch localized strings using AppLocalizations
//     final localizations = AppLocalizations.of(context)!;
//
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//         appBar: AppBar(
//           title:
//               Text(localizations.scenarioTitleLabel(currentScenarioIndex + 1)),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text(
//                 localizations.timer(getFormattedTime()),
//                 style:
//                     const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 20),
//               GestureDetector(
//                 behavior: HitTestBehavior.translucent,
//                 onTap: () => _showScenarioDetails(context, currentScenario),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     // Use localized scenario title by mapping the index to the key
//                     localizations.getScenarioTitle(currentScenarioIndex + 1),
//                     style: const TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 // Use localized scenario description by mapping the index to the key
//                 localizations.getScenarioDescription(currentScenarioIndex + 1),
//                 style: const TextStyle(fontSize: 16),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: categories.length,
//                   itemBuilder: (context, index) {
//                     String category = categories.keys.elementAt(index);
//                     String categoryKey = categories.keys.elementAt(index); // Get the key
//                     final localizations = AppLocalizations.of(context)!;
//                     final localizedCategoryName = localizations.getLocalizedCategoryName(categoryKey); // Localize the category name
//
//                     return Card(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             FadeIn(
//                               duration: const Duration(milliseconds: 500),
//                               child: Row(
//                                 children: [
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(
//                                         17), // Circular border radius
//                                     child: Image.asset(
//                                       categoryImages[category]!,
//                                       height: 50,
//                                       width: 50,
//                                       fit: BoxFit.cover, // Fit within rectangle
//                                     ),
//                                   ),
//                                   const SizedBox(width: 8),
//                                   Text(
//                                     localizedCategoryName,
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: Slider(
//                                 value: categories[category]!,
//                                 min: 0,
//                                 max: totalBudget,
//                                 divisions: 20,
//                                 label:
//                                     "₹${categories[category]!.toStringAsFixed(0)}",
//                                 onChanged: (value) =>
//                                     updateCategory(category, value),
//                               ),
//                             ),
//                             Text(
//                                 "₹${categories[category]!.toStringAsFixed(0)}"),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       Text(
//                         localizations.remainingBudgetLabel(
//                           remainingBudget.isFinite
//                               ? remainingBudget.toStringAsFixed(2)
//                               : '0.00',
//                         ),
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color:
//                               remainingBudget >= 0 ? Colors.green : Colors.red,
//                         ),
//                       ),
//                       LinearProgressIndicator(
//                         value: remainingBudget / totalBudget,
//                         backgroundColor: Colors.grey[300],
//                         valueColor: AlwaysStoppedAnimation<Color>(
//                           remainingBudget >= 0 ? Colors.green : Colors.red,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed:
//                     allocatedBudget <= totalBudget ? _navigateToResult : null,
//                 child: Text(localizations.submitBudget),
//               ),
//               ConfettiWidget(
//                 confettiController: _controller,
//                 blastDirectionality: BlastDirectionality.explosive,
//                 emissionFrequency: 0.05,
//                 numberOfParticles: 50,
//                 gravity: 0.4,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showScenarioDetails(BuildContext context, Scenario scenario) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         final screenSize = MediaQuery.of(context).size;
//         final dialogWidth = screenSize.width * 0.9;
//         final dialogHeight = screenSize.height * 0.8;
//         final localizations = AppLocalizations.of(context)!;
//
//         return AlertDialog(
//           title: Text(localizations.scenarioDetails),
//           content: SizedBox(
//             width: dialogWidth,
//             height: dialogHeight,
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: ClipOval(
//                       child: Image.asset(
//                         scenario.imagePath,
//                         width: dialogWidth * 0.2,
//                         height: dialogWidth * 0.2,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     localizations.getScenarioDescription(currentScenarioIndex+1),
//                     textAlign: TextAlign.justify,
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     localizations.suggestedBudget,
//                     style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 8),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: scenario.suggestedBudget.length,
//                     itemBuilder: (context, index) {
//                       final categoryKey = scenario.suggestedBudget.keys.elementAt(index);
//                       final amount = scenario.suggestedBudget.values.elementAt(index);
//
//                       final localizedCategory = localizations.getLocalizedCategoryName(categoryKey);
//
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 4),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               localizedCategory,
//                               style: const TextStyle(fontWeight: FontWeight.w500),
//                             ),
//                             Text("₹${amount.toStringAsFixed(0)}"),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text(localizations.ok),
//             ),
//           ],
//         );
//       },
//     );
//   }
//   void _startScenarioTimer() {
//     _remainingScenarioTime = 50;
//     _scenarioTimer?.cancel(); // Cancel any existing timer
//     _scenarioTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (mounted) {
//         setState(() {
//           if (_remainingScenarioTime > 0) {
//             _remainingScenarioTime--;
//           } else {
//             timer.cancel();
//             showInactivityPopup();
//           }
//         });
//       } else {
//         timer.cancel(); // Very Important to prevent memory leaks
//       }
//     });
//   }
//
//   void showInactivityPopup() {
//     if (!isTimerPopupShown && mounted) {
//       isTimerPopupShown = true;
//       showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (context) => AlertDialog(
//           title: Text(AppLocalizations.of(context)!.timesUp),
//           content: Text(AppLocalizations.of(context)!.timeExceeded),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 _goToNextScenario(true); // Indicate it's from timeout
//                 isTimerPopupShown = false;
//               },
//               child: Text(AppLocalizations.of(context)!.cn),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.popUntil(context, ModalRoute.withName('/'));
//                 isTimerPopupShown = false;
//               },
//               child: Text(AppLocalizations.of(context)!.exit),
//             ),
//           ],
//         ),
//       ).then((_) {
//         if (mounted) {
//           setState(() {
//             isTimerPopupShown = false;
//           });
//         }
//       });
//     }
//   }
//
//   void _resetCategories() {
//     setState(() {
//       categories = Map.from(scenarios[currentScenarioIndex].suggestedBudget);
//       allocatedBudget = 0;
//       remainingBudget = totalBudget;
//       _startScenarioTimer(); //Start the timer here
//     });
//   }
//
//   void _goToNextScenario(bool fromTimeout) {
//     setState(() {
//       if (currentScenarioIndex < scenarios.length - 1) {
//         currentScenarioIndex++;
//         if (scenarios[currentScenarioIndex].level > currentLevel) {
//           currentLevel = scenarios[currentScenarioIndex].level;
//         }
//         _resetCategories(); // Reset categories and importantly START THE TIMER
//       } else {
//         _completeGame();
//       }
//     });
//   }
// }
//
// class ResultScreen extends StatelessWidget {
//   final Scenario scenario; // Assuming you have a Scenario class
//   final Map<String, double> budget;
//   final double totalBudget;
//   final double allocatedBudget;
//   final double remainingBudget;
//   final Map<String, double> suggestedBudget;
//   final currentScenarioIndex;
//
//   const ResultScreen({
//     super.key,
//     required this.scenario,
//     required this.budget,
//     required this.totalBudget,
//     required this.allocatedBudget,
//     required this.remainingBudget,
//     required this.suggestedBudget,
//     required this.currentScenarioIndex,
//   });
//   String lookupFeedbackMessage(BuildContext context, String feedbackType) {
//     switch (feedbackType) {
//       case 'excellent':
//         return AppLocalizations.of(context)!.feedbackExcellent;
//       case 'goodEffort':
//         return AppLocalizations.of(context)!.feedbackGood;
//       case 'tryBetter':
//         return AppLocalizations.of(context)!.feedbackTryBetter;
//       default:
//         return ""; // Or a default message
//     }
//   }
//
//   String lookupAppTitle(BuildContext context) {
//     return AppLocalizations.of(context)!.results;
//   }
//
//   String lookupTotalSpent(BuildContext context, allocatedBudget) {
//     return AppLocalizations.of(context)!.totalSpent(allocatedBudget);
//   }
//
//   String lookupRemainingBudgetLabel(BuildContext context, remainingBudget) {
//     return AppLocalizations.of(context)!.remainingBudgetLabel(remainingBudget);
//   }
//
//   String lookupNextScenario(BuildContext context) {
//     return AppLocalizations.of(context)!.nextScenario;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final localizations = AppLocalizations.of(context)!;
//     int scenarioScore = 0;
//     suggestedBudget.forEach((key, suggested) {
//       double difference = (budget[key]! - suggested).abs();
//       if (difference <= 50) {
//         scenarioScore += 10;
//       }
//     });
//
//     String feedbackMessage = scenarioScore >= 40
//         ? lookupFeedbackMessage(context, 'excellent')
//         : (scenarioScore >= 20
//             ? lookupFeedbackMessage(context, 'goodEffort')
//             : lookupFeedbackMessage(context, 'tryBetter'));
//     final currentLocale = Localizations.localeOf(context);
//
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(lookupAppTitle(context)),
//         backgroundColor: const Color(0xFF3498DB),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               AppLocalizations.of(context)!.scenarioTitleLabel1+AppLocalizations.of(context)!.getScenarioTitle(currentScenarioIndex+1),
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               AppLocalizations.of(context)!
//                   .getScenarioDescription(currentScenarioIndex+1),
//               style: const TextStyle(fontSize: 16, color: Colors.grey),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: budget.length,
//                 itemBuilder: (context, index) {
//                   final categoryKey = budget.keys.elementAt(index);
//                   final amount = budget[categoryKey];
//
//                   final localizedCategoryName = localizations.getLocalizedCategoryName(categoryKey);
//
//                   return Card(
//                     elevation: 5,
//                     margin: const EdgeInsets.symmetric(vertical: 8),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: ListTile(
//                       leading: const Icon(
//                         Icons.monetization_on, // Golden coin-like icon
//                         color: Color(0xFFFFD700), // Golden color
//                       ),
//                       title: Text(
//                         localizedCategoryName,
//                         style: const TextStyle(fontWeight: FontWeight.w600),
//                       ),
//                       trailing: Text(
//                         "₹${amount!.toStringAsFixed(2)}",
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const Divider(thickness: 2),
//             LinearProgressIndicator(
//               value: remainingBudget / totalBudget,
//               backgroundColor: Colors.grey[300],
//               color: remainingBudget >= 0 ? Colors.green : Colors.red,
//             ),
//             Text(
//               lookupTotalSpent(
//                   context, allocatedBudget.toStringAsFixed(2)), // Localized
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(
//               lookupRemainingBudgetLabel(
//                   context, remainingBudget.toStringAsFixed(2)), // Localized
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: remainingBudget >= 0 ? Colors.green : Colors.red,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: Text(
//                 feedbackMessage,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             AnimatedValueDisplay(
//               value: scenarioScore,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context, scenarioScore);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
//                   backgroundColor: Colors.blue,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//                 child: Text(lookupNextScenario(context)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class AnimatedValueDisplay extends StatelessWidget {
//   final int value;
//   final TextStyle style;
//
//   const AnimatedValueDisplay({
//     super.key,
//     required this.value,
//     required this.style,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TweenAnimationBuilder<int>(
//       tween: IntTween(begin: 0, end: value),
//       duration: const Duration(seconds: 2),
//       builder: (context, animatedValue, child) {
//         return Text(
//           animatedValue.toString(),
//           style: style,
//         );
//       },
//     );
//   }
// }
//
// class CompletionScreen extends StatelessWidget {
//   final int score;
//   final int coins;
//   final List<String> achievements;
//
//   const CompletionScreen({
//     super.key,
//     required this.score,
//     required this.coins,
//     required this.achievements,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//             AppLocalizations.of(context)!.congratulations), // Localized title
//         backgroundColor: const Color(0xFF76D7C4),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               FadeInDown(
//                 duration: const Duration(milliseconds: 1000),
//                 child: Text(
//                   AppLocalizations.of(context)!
//                       .completionMessage, // Localized message
//                   style:
//                       const TextStyle(fontSize: 20, color: Color(0xFF3498DB)),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElasticIn(
//                 duration: const Duration(milliseconds: 1500),
//                 child: Text(
//                   AppLocalizations.of(context)!
//                       .totalScore(score), // Localized and formatted score
//                   style: const TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF3498DB),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     AppLocalizations.of(context)!
//                         .totalCoins(coins), // Localized and formatted coins
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green,
//                     ),
//                   ),
//                   const SizedBox(width: 5.0),
//                   const Icon(
//                     Icons.monetization_on,
//                     color: Colors.amber,
//                     size: 18.0,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF5DADE2),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => MainScreen(setLocale: (locale) {
//                     // Find the nearest MaterialApp ancestor to set the locale
//                     final state = context.findAncestorStateOfType<_FamilyBudgetGameAppState>();
//                     if (state != null) {
//                       state._setLocale(locale);
//                     }
//                   }
//                       ),
//                     ),
//                   );
//                 },
//                 child: Text(AppLocalizations.of(context)!
//                     .restartGame), // Localized button text
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void defaultSetLocale(Locale locale) {}
//
// }
