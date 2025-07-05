import 'package:flutter/material.dart';
import 'package:todo/presentation/add_task/view/add_task_ui.dart';

class HomeUi extends StatelessWidget {
  const HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo")),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskUi()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder:
            (context, index) => CheckboxListTile(
              title: Text("Read book"),
              value: false,
              onChanged: null,
            ),
      ),
    );
  }
}
