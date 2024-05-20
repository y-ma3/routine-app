import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:routine_app/component/text_field.dart';
import 'package:emoji_selector/emoji_selector.dart';

class InputForm extends StatefulWidget {
  const InputForm({Key? key}) : super(key: key);

  @override
  InputFormState createState() => InputFormState();
}

class InputFormState extends State<InputForm> {
  String selectedEmoji = "✅";
  EmojiData? emojiData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.inputFormTitle),
        backgroundColor: Colors.black12,
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext subcortex) {
                          return SizedBox(
                            child: EmojiSelector(
                              padding: const EdgeInsets.all(20),
                              onSelected: (emoji) {
                                setState(() {
                                  selectedEmoji = emoji.char;
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      side: const BorderSide(color: Colors.black, width: 1),
                    ),
                    child: Text(
                      selectedEmoji,
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    )),
                const Padding(
                  padding: EdgeInsets.all(10),
                ),
                const SizedBox(
                  width: 250,
                  child: MyTextField(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
