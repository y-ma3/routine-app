import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:emoji_selector/emoji_selector.dart';

class InputForm extends StatefulWidget {
  const InputForm({Key? key}) : super(key: key);

  @override
  InputFormState createState() => InputFormState();
}

class InputFormState extends State<InputForm> {
  String selectedEmoji = "✅";
  final TextEditingController _taskNameController = TextEditingController();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  bool _value = true;
  final TextEditingController _noteController = TextEditingController();

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
                // 絵文字選択ボタン
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
                // タスク名を入力するフィールド
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: _taskNameController,
                    decoration: const InputDecoration(
                      labelText: 'New Task Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // タスクの開始時間を設定する
                ElevatedButton(
                  onPressed: () async {
                    TimeOfDay? selectedTime;
                    do {
                      selectedTime = await showTimePicker(
                        context: context,
                        initialTime: startTime,
                      );
                      if (selectedTime == null) {
                        // ユーザーがキャンセルボタンを押した場合
                        return;
                      } else if (selectedTime.hour > endTime.hour ||
                          (selectedTime.hour == endTime.hour &&
                              selectedTime.minute > endTime.minute)) {
                        // 選択された時間が終了時間より後である場合
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('開始時間は終了時間より前に設定してください。')),
                        );
                      }
                    } while (selectedTime.hour > endTime.hour ||
                        (selectedTime.hour == endTime.hour &&
                            selectedTime.minute > endTime.minute));
                    setState(() {
                      startTime = selectedTime!;
                    });
                  },
                  child: Text('開始時間: ${startTime.format(context)}'),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                // タスクの終了時間を設定する
                ElevatedButton(
                  onPressed: () async {
                    TimeOfDay? selectedTime;
                    do {
                      selectedTime = await showTimePicker(
                        context: context,
                        initialTime: endTime,
                      );
                      if (selectedTime == null) {
                        // ユーザーがキャンセルボタンを押した場合
                        return;
                      } else if (selectedTime.hour < startTime.hour ||
                          (selectedTime.hour == startTime.hour &&
                              selectedTime.minute < startTime.minute)) {
                        // 選択された時間が開始時間より前である場合
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('終了時間は開始時間より後に設定してください。'),
                          ),
                        );
                      }
                    } while (selectedTime.hour < startTime.hour ||
                        (selectedTime.hour == startTime.hour &&
                            selectedTime.minute < startTime.minute));
                    setState(() {
                      endTime = selectedTime!;
                    });
                  },
                  child: Text('終了時間: ${endTime.format(context)}'),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            // 通知の設定
            SwitchListTile(
              title: const Text('通知'),
              secondary: const Icon(Icons.notifications_none),
              value: _value,
              onChanged: (value) => setState(() => _value = value),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            // メモを入力するフィールド
            SizedBox(
              width: 350,
              child: TextField(
                controller: _noteController,
                decoration: const InputDecoration(
                  labelText: 'Note',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            // 新規タスクを追加するボタン
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('新規タスクを追加'),
            ),
          ],
        ),
      ),
    );
  }
}
