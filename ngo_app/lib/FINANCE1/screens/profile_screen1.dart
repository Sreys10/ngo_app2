import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import Fluttertoast package
import 'package:lottie/lottie.dart'; // Import Lottie package
import '../models/product1.dart';

class ProfileScreen1 extends StatefulWidget {
  final List<Product1> cart;
  final int initialBalance;
  final Function(List<Product1>, int) updateCartAndBalance;

  const ProfileScreen1({
    super.key,
    required this.cart,
    required this.initialBalance,
    required this.updateCartAndBalance,
  });

  @override
  _ProfileScreenState1 createState() => _ProfileScreenState1();
}

class _ProfileScreenState1 extends State<ProfileScreen1> {
  late List<Product1> _cart;
  late int _balance;
  late int _totalSpent;
  FToast? _fToast;

  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _cart = List.from(widget.cart); // Clone the cart
    _balance = widget.initialBalance;
    _totalSpent = _calculateInitialSpent(); // Calculate total spent initially
    _fToast = FToast();
    _fToast?.init(context);
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  int _calculateInitialSpent() {
    return _cart.fold(0, (sum, item) => sum + item.price);
  }

  Future<void> _removeFromCart(int index) async {
    await _audioPlayer.setSourceAsset(
        'FINANCE/audio/pop.mp3'); // Set the source for the local file
    await _audioPlayer
        .setReleaseMode(ReleaseMode.release); // Set the audio to loop
    await _audioPlayer.resume(); // Resume playing

    setState(() {
      int removedPrice = _cart[index].price;
      _balance += removedPrice; // Refund the product price to balance
      _totalSpent -= removedPrice; // Deduct from total spent
      _cart.removeAt(index); // Remove the product from the cart
      widget.updateCartAndBalance(_cart, _balance); // Notify parent

      // Optimized Toast message
      _fToast?.removeQueuedCustomToasts();
      _showToast('🗑️ Product removed: Rs. $removedPrice', Colors.redAccent);
    });
  }

  void _showToast(String message, Color bgColor) {
    _fToast?.showToast(
      child: _buildToastWidget(message, bgColor),
      toastDuration: const Duration(seconds: 1), // Quick display duration
      gravity: ToastGravity.BOTTOM,
    );
  }

  Widget _buildToastWidget(String message, Color bgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: bgColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.info, color: Colors.white),
          const SizedBox(width: 12.0),
          Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  void _evaluatePurchases() {
    Map<String, int> productCounts = {};

    // Count occurrences of each product in the cart
    for (var product in _cart) {
      productCounts[product.name] = (productCounts[product.name] ?? 0) + 1;
    }

    List<String> badChoices = productCounts.entries
        .where((entry) => entry.value > 2)
        .map((entry) => "${entry.key} (${entry.value})")
        .toList();

    String message;
    bool isGoodChoice;
    if (badChoices.isEmpty) {
      message =
          "🎉 Wow! Great choices! All your purchases are within limits. ✅";
      isGoodChoice = true;
    } else {
      message =
          "🚨 Uh-oh! You've exceeded the limit for: ${badChoices.join(', ')}.";
      isGoodChoice = false;
    }

    // Show Dialog Box with a creative design
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: isGoodChoice
                    ? [
                        Colors.lightGreen.shade100,
                        Colors.green.shade300,
                      ]
                    : [
                        Colors.red.shade100,
                        Colors.redAccent.shade200,
                      ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Emoji and Title
                Text(
                  isGoodChoice ? "🎉 Hurray! 🥳" : "⚠️ Oops! 😬",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: isGoodChoice
                        ? Colors.green.shade900
                        : Colors.red.shade900,
                    fontFamily: 'Comic Sans MS',
                  ),
                ),
                const SizedBox(height: 10),
                // Fun Image or Icon
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isGoodChoice
                        ? Colors.green.shade200
                        : Colors.red.shade200,
                  ),
                  child: Center(
                    child: Icon(
                      isGoodChoice ? Icons.check_circle : Icons.error,
                      size: 50,
                      color: isGoodChoice
                          ? Colors.green.shade900
                          : Colors.red.shade900,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Message
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Comic Sans MS',
                  ),
                ),
                const SizedBox(height: 20),
                // Fun and Bright Button
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.yellow.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "OK! ",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("😊", style: TextStyle(fontSize: 22)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Your Profile 1',
          style: TextStyle(fontFamily: 'Comic Sans MS', fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Add settings functionality
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/FINANCE/images/pro_bg.jpg'),
            fit: BoxFit.cover, // Ensures the image covers the entire container
          ),
        ),
        child: Column(
          children: [
            // Balance display
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.monetization_on,
                      color: Colors.amber, size: 30),
                  const SizedBox(width: 8),
                  Text(
                    'शिल्लक: रु. $_balance',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontFamily: 'Comic Sans MS',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _cart.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart,
                              size: 100, color: Colors.grey),
                          SizedBox(height: 10),
                          Text(
                            'Your cart is empty!',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Comic Sans MS',
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'पुढे जा, काही उत्कृष्ट आयटम जोडा!',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                              fontFamily: 'Comic Sans MS',
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _cart.length,
                      itemBuilder: (context, index) {
                        final product = _cart[index];
                        return Card(
                          color: Colors.pink.shade50,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                                color: Colors.greenAccent, width: 2),
                          ),
                          child: ListTile(
                            leading: product.imageAsset.endsWith('.json')
                                ? Lottie.asset(
                                    product.imageAsset,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.contain,
                                  )
                                : Image.asset(
                                    product.imageAsset,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                            title: Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: 'Comic Sans MS',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                const Icon(Icons.monetization_on,
                                    color: Colors.amber, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  '${product.price}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontFamily: 'Comic Sans MS',
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _removeFromCart(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            // Total Spent display
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_bag, color: Colors.blue, size: 30),
                  const SizedBox(width: 8),
                  Text(
                    'Total Spent: Rs. $_totalSpent',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      fontFamily: 'Comic Sans MS',
                    ),
                  ),
                ],
              ),
            ),
            // Submit Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ElevatedButton(
                onPressed: _evaluatePurchases,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Comic Sans MS',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
