import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>(
  (ref) {
    return "Hello Rahul";
  },
);
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod Provider"),
        toolbarHeight: 40,
      ),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final name = ref.watch(nameProvider);
          return Text(name);
        }),
      ),
    );
  }
}
