import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>(
  (ref) => 0,
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

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    ref.listen(counterProvider, ((previous, next) {
      if (next == 5) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('The value is $next')));
      }
    }));
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
        actions: [
          IconButton(
              onPressed: () {
                ref.refresh(counterProvider);
                // ref.invalidate(counterProvider);
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Text(
          count.toString(),
          style: const TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).update((state) => state + 1);
          // ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
