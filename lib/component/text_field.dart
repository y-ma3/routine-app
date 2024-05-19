import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({super.key});

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: const InputDecoration(
        labelText: 'Enter new task name',
        border: OutlineInputBorder(),
      ),
    );
  }
}
