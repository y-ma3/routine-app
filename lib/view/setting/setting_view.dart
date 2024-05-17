import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定画面'),
        backgroundColor: Colors.black12,
      ),
      body: const Center(
        child: Text(
          '設定画面',
        ),
      ),
    );
  }
}
