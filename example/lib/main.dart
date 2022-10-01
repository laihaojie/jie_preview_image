import 'package:flutter/material.dart';
import 'package:jie_preview_image/jie_preview_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                previewImage(
                  context,
                  currentUrl:
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                  urls: [
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                  ],
                );
              },
              child: Hero(
                tag:
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                child: Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                  width: 100,
                  height: 100,
                ),
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
