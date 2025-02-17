import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_screen.dart';
import 'profile_screen.dart';
import '../widgets/shop_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  final AudioPlayer _audioPlayer =
      AudioPlayer(); // Audio player for background music
  bool _isPlaying = false; // To track whether audio is playing

  int _balance = 300; // Initial balance
  int _totalAmountSpent = 0; // Total amount spent
  List<Product> _cart = []; // List to store selected products

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addObserver(this); // Add observer for app lifecycle events
    _playAudio(); // Start playing audio when the app opens
  }

  Future<void> _playAudio() async {
    try {
      await _audioPlayer.setSourceAsset(
          'FINANCE/audio/main_music.mp3'); // Set the source for the local file
      await _audioPlayer
          .setReleaseMode(ReleaseMode.loop); // Set the audio to loop
      await _audioPlayer.resume(); // Resume playing
      setState(() {
        _isPlaying = true;
      });
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  Future<void> _stopAudio() async {
    try {
      await _audioPlayer.stop(); // Stop the audio
      setState(() {
        _isPlaying = false;
      });
    } catch (e) {
      print("Error stopping audio: $e");
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      // Stop audio when app is minimized or closed
      _stopAudio();
    } else if (state == AppLifecycleState.resumed) {
      // Resume audio when app is reopened
      _playAudio();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_isPlaying) {
            await _stopAudio(); // Stop audio
          } else {
            await _playAudio(); // Play audio
          }
        },
        backgroundColor: Colors.blue, // Toggle background music
        child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
      ),
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.yellowAccent,
            ),
            SizedBox(width: 8),
            Text(
              'जत्रा',
              style: TextStyle(
                fontFamily: 'Cursive',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
        elevation: 6,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    initialBalance: _balance,
                    cart: _cart, // Pass the cart items
                    updateCartAndBalance: _updateCartAndBalance,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/FINANCE/images/fair_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Displaying the balance at the top
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.monetization_on,
                        color: Colors.amber, size: 24),
                    const SizedBox(width: 5),
                    Text(
                      'Rs. $_balance',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Title for the fair
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Welcome to the Fun Fair!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ),
            // Grid of shop items
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
                padding: const EdgeInsets.all(8.0),
                children: [
                  ShopItem(
                    shopName: 'खेळणी',
                    imageAsset: 'assets/FINANCE/images/main_toy.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(
                            shopName: 'Toy Shop',
                            cart: _cart,
                            updateCart: _updateCartAndBalance,
                            balance: _balance,
                          ),
                        ),
                      );
                    },
                  ),
                  ShopItem(
                    shopName: 'खाण्याचे दुकान',
                    imageAsset: 'assets/FINANCE/images/main_food.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(
                            shopName: 'Food Shop',
                            cart: _cart,
                            updateCart: _updateCartAndBalance,
                            balance: _balance,
                          ),
                        ),
                      );
                    },
                  ),
                  ShopItem(
                    shopName: 'कपड्यांचे दुकान',
                    imageAsset: 'assets/FINANCE/images/main_clothes.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(
                            shopName: 'Clothes Shop',
                            cart: _cart,
                            updateCart: _updateCartAndBalance,
                            balance: _balance,
                          ),
                        ),
                      );
                    },
                  ),
                  ShopItem(
                    shopName: 'Books दुकान',
                    imageAsset: 'assets/FINANCE/images/main_books.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(
                            shopName: 'Books Shop',
                            cart: _cart,
                            updateCart: _updateCartAndBalance,
                            balance: _balance,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Update cart and balance when a product is added or removed
  void _updateCartAndBalance(List<Product> updatedCart, int newBalance) {
    setState(() {
      _totalAmountSpent += _balance - newBalance; // Calculate total spent
      _balance =
          newBalance < 0 ? 0 : newBalance; // Ensure balance is not negative
      _cart = updatedCart; // Update cart
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance
        .removeObserver(this); // Remove observer to prevent memory leaks
    _audioPlayer.dispose(); // Dispose audio player to free resources
    super.dispose();
  }
}
