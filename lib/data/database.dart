import 'package:hive_local_storage/hive_local_storage.dart';

class ToDoDataBase {
  List toDoList = [];
  final _myBox = Hive.box('mybox');

//first time opening this app
  void createInitialData() {
    toDoList = [
      ['Make tutorial', false],
      ['Do Exercise', false],
    ];
  }

//load data from dataBase
  void loadData() {
    final storedList = _myBox.get('TODOLIST');
    if (storedList != null) {
      toDoList = List.from(storedList);
    } else {
      // Handle null scenario: set default data or take appropriate action
    }
  }

//update the data base
  void updateData() {
    _myBox.put('TODOLIST', toDoList);
  }
}
