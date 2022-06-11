import 'package:flutter/material.dart';
import 'package:machine_test/provider/homepageprovider.dart';
import 'package:machine_test/view/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ateam Machine Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:ChangeNotifierProvider<HomePageProvider>(
        create: (context) => HomePageProvider(),
    child: const HomePage(),
    ),
    );
  }
}
