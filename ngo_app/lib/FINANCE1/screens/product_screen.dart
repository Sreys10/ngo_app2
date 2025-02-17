import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import the Fluttertoast package
import 'package:lottie/lottie.dart'; // Import the Lottie package
import '../models/product.dart';

class ProductScreen extends StatefulWidget {
  final String shopName;
  final List<Product> cart;
  final Function(List<Product>, int) updateCart;
  final int balance;

  const ProductScreen({
    super.key,
    required this.shopName,
    required this.cart,
    required this.updateCart,
    required this.balance,
  });

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with TickerProviderStateMixin {
  late int _balance;
  late List<Product> _cart;

  late AnimationController _productAnimationController;
  late Animation<double> _productScaleAnimation;

  late AnimationController _coinAnimationController;
  late Animation<double> _coinScaleAnimation;

  int? _purchasingProductIndex;

  final AudioPlayer _player = AudioPlayer();

  final Map<String, List<Product>> shopProducts = {
    'Toy Shop': [
      Product(
        name: 'कार',
        price: 30,
        imageAsset: 'assets/FINANCE/animations/car.json',
        url: '', // No URL for Toy Shop products
      ),
      Product(
        name: 'बाहुली',
        price: 50,
        imageAsset: 'assets/FINANCE/gifs/barbie1.gif',
        url: '',
      ),
      Product(
        name: 'बिल्डिंग ब्लॉक्स',
        price: 20,
        imageAsset: 'assets/FINANCE/gifs/bblock1.gif',
        url: '',
      ),
    ],
    'Books Shop': [
      Product(
        name: 'अग्निपंख',
        price: 30,
        imageAsset: 'assets/FINANCE/images/book1.jpg',
        url: 'https://www.flipkart.com/agnipankh',
      ),
      Product(
        name: 'चाणक्य नीती',
        price: 50,
        imageAsset: 'assets/FINANCE/images/book2.jpg',
        url: 'https://www.flipkart.com/chanakya-niti',
      ),
      Product(
        name: 'महाभारत',
        price: 20,
        imageAsset: 'assets/FINANCE/images/book3.png',
        url: 'https://www.flipkart.com/mahabharat',
      ),
    ],
    'Food Shop': [
      Product(
        name: 'केळी',
        price: 20,
        imageAsset: 'assets/FINANCE/images/p7_banana.png',
        url: '',
      ),
      Product(
        name: 'पिझ्झा',
        price: 40,
        imageAsset: 'assets/FINANCE/images/p8_pizza.png',
        url: '',
      ),
      Product(
        name: 'रस',
        price: 15,
        imageAsset: 'assets/FINANCE/images/p9_juice.png',
        url: '',
      ),
    ],
    'Clothes Shop': [
      Product(
        name: 'शर्ट',
        price: 50,
        imageAsset: 'assets/FINANCE/images/p10_shirt.png',
        url: '',
      ),
      Product(
        name: 'पँट',
        price: 60,
        imageAsset: 'assets/FINANCE/images/p11_cap.png',
        url: '',
      ),
      Product(
        name: 'जाकीट',
        price: 80,
        imageAsset: 'assets/FINANCE/images/p12_kurta.png',
        url: '',
      ),
    ],
  };

  @override
  void initState() {
    super.initState();
    _balance = widget.balance;
    _cart = List.from(widget.cart);

    // Initialize the product animation controller with bounce effect
    _productAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _productScaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(
        parent: _productAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    // Initialize the coin animation controller with pulsing effect
    _coinAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _coinScaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
        parent: _coinAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _productAnimationController.dispose();
    _coinAnimationController.dispose();
    super.dispose();
    _player.dispose();
  }

  void _showToast(String message, Color backgroundColor) {
    Fluttertoast.cancel(); // Cancel any existing toast immediately
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT, // Short duration for quick feedback
      gravity: ToastGravity.BOTTOM,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Future<void> _addToCart(Product product, int index) async {
    if (_balance >= product.price) {
      _showToast(
          '🎉 Woohoo! ${product.name} added to your cart! 🛒', Colors.green);

      await _player.setSourceAsset(
          'FINANCE/audio/pop.mp3'); // Set the source for the local file
      await _player
          .setReleaseMode(ReleaseMode.release); // Set the audio to loop
      await _player.resume(); // Resume playing

      setState(() {
        _purchasingProductIndex = index;
      });

      _productAnimationController.forward();
      await Future.delayed(const Duration(milliseconds: 300));
      _productAnimationController.reverse();

      setState(() {
        _cart.add(product);
        _balance -= product.price;
        _purchasingProductIndex = null;
      });

      _coinAnimationController.forward();
      await Future.delayed(const Duration(milliseconds: 300));
      _coinAnimationController.reverse();

      widget.updateCart(_cart, _balance);
    } else {
      _showToast(
          '🚫 Oops! Not enough coins for ${product.name} 💰', Colors.red);
    }
  }

  Widget _buildImage(String asset, int index) {
    final isAnimating = index == _purchasingProductIndex;

    if (asset.endsWith('.json')) {
      return AnimatedBuilder(
        animation: _productScaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: isAnimating ? _productScaleAnimation.value : 1.0,
            child: Lottie.asset(
              asset,
              fit: BoxFit.contain,
              width: double.infinity,
              height: 150,
            ),
          );
        },
      );
    } else {
      return AnimatedBuilder(
        animation: _productScaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: isAnimating ? _productScaleAnimation.value : 1.0,
            child: Image.asset(
              asset,
              fit: BoxFit.contain,
              width: double.infinity,
              height: 150,
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final products = shopProducts[widget.shopName] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.shopName),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/FINANCE/images/wooden_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.pinkAccent, Colors.orangeAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(2, 4),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _coinScaleAnimation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _coinScaleAnimation.value,
                          child: const Icon(
                            Icons.monetization_on,
                            color: Colors.amber,
                            size: 30,
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '$_balance',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                padding: const EdgeInsets.all(10.0),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  final isAffordable = _balance >= product.price;

                  return Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const RadialGradient(
                          center: Alignment.topLeft,
                          radius: 2.0,
                          colors: [Colors.white10, Colors.black12, Colors.grey],
                        ),
                        border: Border.all(
                          width: 5,
                          color: Colors.transparent,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              colors: [Colors.yellow, Colors.orange],
                              stops: [0.0, 1.0],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            border: Border.all(
                              width: 5,
                              color: Colors.transparent,
                            ),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                  child: _buildImage(
                                    product.imageAsset,
                                    index,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.blueAccent,
                                    fontFamily: 'Comic Sans MS',
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: isAffordable
                                    ? () => _addToCart(product, index)
                                    : null,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: isAffordable
                                        ? Colors.blue
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.monetization_on,
                                          color: Colors.yellow, size: 22),
                                      const SizedBox(width: 6),
                                      Text(
                                        'Rs. ${product.price}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
