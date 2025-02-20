import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExperimentsListScreen extends StatefulWidget {
  const ExperimentsListScreen({super.key});

  @override
  _ExperimentsListScreenState createState() => _ExperimentsListScreenState();
}

class _ExperimentsListScreenState extends State<ExperimentsListScreen> {
  List<dynamic> experiments = [];
  List<String> likedPosts = [];

  @override
  void initState() {
    super.initState();
    loadNews();
    loadLikedPosts();
  }

  Future<void> loadNews() async {
    final String response =
        await rootBundle.loadString('assets/json/marathi-experiments.json');
    final data = json.decode(response);
    setState(() {
      experiments = data['experiments'];
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
        title: Text('Science Experiments'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LikedPostsScreen(
                      likedPosts: likedPosts, experiment: experiments),
                ),
              );
            },
          ),
        ],
      ),
      body: experiments.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: experiments.length,
              itemBuilder: (context, index) {
                final experiment = experiments[index];
                final isLiked = likedPosts.contains(experiment['title']);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExperimentsDetailScreen(
                          experiment: experiment,
                          isLiked: isLiked,
                          toggleLike: () => toggleLike(experiment['title']),
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
                            experiment['imageUrl'],
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
                                experiment['title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 8),
                              Text(
                                experiment[
                                    'title'], // Note: This seems redundant; did you mean description?
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
                                    experiment['difficulty'],
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
                                        toggleLike(experiment['title']),
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

class ExperimentsDetailScreen extends StatelessWidget {
  final dynamic experiment;
  final bool isLiked;
  final VoidCallback toggleLike;

  const ExperimentsDetailScreen(
      {super.key,
      required this.experiment,
      required this.isLiked,
      required this.toggleLike});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(experiment['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Added to handle long content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                // Changed from Image.network to Image.asset
                experiment['imageUrl'],
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
              Text('Difficulty: ${experiment['difficulty']}',
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
              SizedBox(height: 16),
              Text(
                'Materials:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ...List.generate(
                experiment['materials'].length,
                (index) => Text(
                  '${index + 1}. ${experiment['materials'][index]}',
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Steps:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ...List.generate(
                experiment['steps'].length,
                (index) => Text(
                  '${index + 1}. ${experiment['steps'][index]}',
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Safety Tips:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                experiment['safetyTips'],
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              SizedBox(height: 16),
              Text(
                'Did You Know?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                experiment['funFact'],
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : null),
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
  final List<dynamic> experiment;

  const LikedPostsScreen(
      {super.key, required this.likedPosts, required this.experiment});

  @override
  Widget build(BuildContext context) {
    final likedArticles = experiment
        .where((experiment) => likedPosts.contains(experiment['title']))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Posts'),
      ),
      body: likedArticles.isEmpty
          ? Center(child: Text('No liked posts yet!'))
          : ListView.builder(
              itemCount: likedArticles.length,
              itemBuilder: (context, index) {
                final experiment = likedArticles[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExperimentsDetailScreen(
                          experiment: experiment,
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
                        experiment['imageUrl'],
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
                      title: Text(experiment['title'],
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          experiment['title']), // Note: This seems redundant
                    ),
                  ),
                );
              },
            ),
    );
  }
}
