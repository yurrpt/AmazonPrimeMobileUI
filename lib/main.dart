import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'feature/home/view/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return const MaterialApp(
      title: 'Material App',
      home: MovieHomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
