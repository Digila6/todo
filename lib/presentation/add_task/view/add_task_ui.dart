import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/utils/color_constants.dart';

class AddTaskUi extends StatelessWidget {
  AddTaskUi({super.key});

  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 10,
          children: [
            TextFormField(
              controller: taskController,
              decoration: const InputDecoration(
                labelText: 'Enter the task',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                addTodo(context);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(ColorConstants.blue),
              ),
              child: Text(
                "Submit",
                style: TextStyle(color: ColorConstants.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addTodo(BuildContext context) async {
    CollectionReference todos = FirebaseFirestore.instance.collection('todos');

    try {
      await FirebaseFirestore.instance.collection('todos').add({
        'title': taskController.text.trim(),
        'status': false,
        'created_at': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("✅ Task added")));
      taskController.clear();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("❌ Error: $e")));
    }
  }
}
