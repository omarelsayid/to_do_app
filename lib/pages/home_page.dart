import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/utilities/dailog_box.dart';
import 'package:to_do_app/utilities/todo_tile.dart';
import 'package:hive_local_storage/hive_local_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key); // Fixed the typo in super key

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');
  final _controller = TextEditingController();
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
      db.updateData();
      db.loadData();
    });
  }

  void saveNewTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        db.toDoList.add([_controller.text, false]);
        db.updateData();
        db.loadData();
      });

      _controller.clear();
      Navigator.pop(context);
    }
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('New Task'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'Enter task'),
          ),
          actions: [
            TextButton(
              onPressed: saveNewTask,
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                _controller.clear();
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
      db.updateData();
      db.loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context, designSize: Size(360, 690));

    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow[200],
        title: const Center(child: Text('To Do')),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            deletFunction: (context) => deleteTask(index),
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChange: (value) {
              checkBoxChange(value, index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
