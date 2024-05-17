import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('ホーム画面'),
                backgroundColor: Colors.black12,
            ),
            body: const Center(
                child: Text('ホーム画面'),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                    // Add your action here
                },
                child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
    }
}