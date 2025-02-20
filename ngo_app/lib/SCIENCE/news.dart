import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  List<dynamic> news = [];
  List<String> likedPosts = [];

  @override
  void initState() {
    super.initState();
    loadNews();
    loadLikedPosts();
  }

  Future<void> loadNews() async {
    final String response =
        await rootBundle.loadString('assets/json/marathi-news.json');
    final data = json.decode(response);
    setState(() {
      news = data['articles'];
    });
  }

  Future<void> loadLikedPosts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      likedPosts = prefs.getStringList('likedPosts') ?? [];
    });
  }

  Future<void> toggleLike(String title) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (likedPosts.contains(title)) {
        likedPosts.remove(title);
      } else {
        likedPosts.add(title);
      }
      prefs.setStringList('likedPosts', likedPosts);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Science & Tech News'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      LikedPostsScreen(likedPosts: likedPosts, news: news),
                ),
              );
            },
          ),
        ],
      ),
      body: news.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                final article = news[index];
                final isLiked = likedPosts.contains(article['title']);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailScreen(
                          article: article,
                          isLiked: isLiked,
                          toggleLike: () => toggleLike(article['title']),
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.asset(
                            // Changed from Image.network to Image.asset
                            article['imageUrl'],
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 200,
                                color: Colors.grey,
                                child: Center(child: Text('Image not found')),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article['title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 8),
                              Text(
                                article['shortDescription'],
                                style: TextStyle(color: Colors.grey[600]),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    article['category'],
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      isLiked
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isLiked ? Colors.red : null,
                                    ),
                                    onPressed: () =>
                                        toggleLike(article['title']),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class NewsDetailScreen extends StatelessWidget {
  final dynamic article;
  final bool isLiked;
  final VoidCallback toggleLike;

  const NewsDetailScreen({
    super.key,
    required this.article,
    required this.isLiked,
    required this.toggleLike,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article['title']),
      ),
      body: SingleChildScrollView(
        // Added to handle long content
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                // Changed from Image.network to Image.asset
                article['imageUrl'],
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey,
                    child: Center(child: Text('Image not found')),
                  );
                },
              ),
              SizedBox(height: 16),
              Text(
                'Category: ${article['category']}',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 16),
              Text(
                article['content'],
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : null,
                    ),
                    onPressed: toggleLike,
                  ),
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      // Handle share functionality
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LikedPostsScreen extends StatelessWidget {
  final List<String> likedPosts;
  final List<dynamic> news;

  const LikedPostsScreen(
      {super.key, required this.likedPosts, required this.news});

  @override
  Widget build(BuildContext context) {
    final likedArticles =
        news.where((article) => likedPosts.contains(article['title'])).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Posts'),
      ),
      body: likedArticles.isEmpty
          ? Center(child: Text('No liked posts yet!'))
          : ListView.builder(
              itemCount: likedArticles.length,
              itemBuilder: (context, index) {
                final article = likedArticles[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailScreen(
                          article: article,
                          isLiked: true,
                          toggleLike: () {},
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: Image.asset(
                        // Changed from Image.network to Image.asset
                        article['imageUrl'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 50,
                            height: 50,
                            color: Colors.grey,
                            child: Center(child: Text('Image not found')),
                          );
                        },
                      ),
                      title: Text(article['title'],
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(article['shortDescription']),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
