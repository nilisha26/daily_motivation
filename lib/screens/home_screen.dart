import 'dart:math';

import 'package:flutter/material.dart';
import '/utils/quotes_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void showNextQuote() {
    setState(() {
      currentIndex = Random().nextInt(quotes.length);
    });
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final quote = quotes[currentIndex];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple.shade400.withAlpha(240),
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.auto_awesome, size: 20),
            SizedBox(width: 8),
            Text(
              "Daily Motivation",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [Colors.blue.shade200, Colors.purple.shade200],
          ),
        ),
        child: Center(
          child: SizedBox(
            height: 260,
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: Column(
                  key: ValueKey<String>(quote.text), // im
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: SingleChildScrollView(
                          child: Text(
                            '"${quote.text}"',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '- ${quote.author}',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: showNextQuote,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),

                      child: Text(
                        'New Quote',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
