import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
// import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Provider.of<TaskData>(context).tasks.length,
        itemBuilder: (context, index) {
          // final task = Provider.of<TaskData>(context).tasks[index];

          return TaskTile(
              isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
              taskTitle: Provider.of<TaskData>(context).tasks[index].name,
              checkBoxCallBack: (checkBoxState) {
                Provider.of<TaskData>(context, listen: false).updateTask(
                    Provider.of<TaskData>(context, listen: false).tasks[index]);
                print('Box clicked');
              });
        });
  }
}
