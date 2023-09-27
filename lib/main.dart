import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/googleshome.dart';
// impor?t 'package:news_app/home.dart';
// impo?rt 'package:news_app/realnewsapp.dart';

void main() => runApp(const HomeMain());

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Google(),
    );
  }
  }