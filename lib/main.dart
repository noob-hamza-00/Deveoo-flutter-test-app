// Author : Mohammad Hamza Ijaz
// Email :  mijaz.bee22seecs@seecs.edu.pk
// Flutter Intern Test

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        //here i added the splash to Show the Deveoo App text to make it more attractive
        //even the splash screen was not required
        '/main': (context) => const MainScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/main');
    });
    //here i added the splash text in the scaffold widget
    //here i can also add the icon but its not required
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              //just to show the Deveoo App text i added this whole splash
              'Deveoo Flutter Intern Test App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ); //the scaffold
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int currentIndex = 0; // i can say 0 for home and 1 for about

  final List<Widget> screens = const [HomeScreen(), AboutScreen()];

  void onTabTapped(int index) {
    setState(() {
      //here it updates the index fro switching screens
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Intern Test')),
      // i added the following drawer to make it look like a proper app
      // which is also not required but it looks good
      // even when the bottom navigation bar is also present as a bonus one
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Flutter App',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  currentIndex = 0;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  currentIndex = 1;
                });
              },
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
      // here comes the bonus bottom nav bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // for the posts which propogates from 1 to 10
    final List<int> postIds = List.generate(10, (index) => index + 1);

    return ListView.builder(
      itemCount: postIds.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text('Post ${postIds[index]}'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(postId: postIds[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

//here comes the detail screen which was also required as per the API provided
class DetailScreen extends StatefulWidget {
  final int postId;

  const DetailScreen({super.key, required this.postId});

  @override
  State<DetailScreen> createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post ${widget.postId} Details')),
      body: FutureBuilder<List<dynamic>>(
        future: fetchComments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No comments found'));
          }

          // displaying comments using ListView.builder
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final comment = snapshot.data![index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment['name'].toUpperCase(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        comment['body'],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // fetching comments from the API given
  Future<List<dynamic>> fetchComments() async {
    final response = await http.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/comments?postId=${widget.postId}',
      ),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load comments');
    }
  }
}

// about screen context section
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Name: Mohammad Hamza Ijaz'),
          Text('Email: mijaz.bee22seecs@seecs.edu.pk'),
          Text('Flutter Intern Test'),
        ],
      ),
    );
  }
}
