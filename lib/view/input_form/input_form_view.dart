import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:routine_app/component/text_field.dart';

class InputForm extends StatelessWidget {
  const InputForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.inputFormTitle),
        backgroundColor: Colors.black12,
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(
              width: 250,
              child: MyTextField(),
            ),
          ],
        ),
      ),
    );
  }
}
