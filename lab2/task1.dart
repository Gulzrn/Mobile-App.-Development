import 'dart:io';

void main() {
  List<String> tasks = [];
  while (true) {
    print('\nTo-Do List Menu:');
    print('1. Add Task');
    print('2. View Tasks');
    print('3. Remove Task');
    print('4. Exit');
    stdout.write('Choose an option: ');
    String? choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        stdout.write('Enter a new task: ');
        String? task = stdin.readLineSync();
        if (task != null && task.isNotEmpty) {
          tasks.add(task);
          print('Task added successfully!');
        } else {
          print('Task cannot be empty.');
        }
        break;
      case '2':
        if (tasks.isEmpty) {
          print('No tasks available.');
        } else {
          print('\nYour Tasks:');
          for (int i = 0; i < tasks.length; i++) {
            print('${i + 1}. ${tasks[i]}');
          }
        }
        break;
      case '3':
        if (tasks.isEmpty) {
          print('No tasks to remove.');
        } else {
          stdout.write('Enter task number to remove: ');
          String? indexStr = stdin.readLineSync();
          int? index = int.tryParse(indexStr ?? '');
          if (index != null && index > 0 && index <= tasks.length) {
            tasks.removeAt(index - 1);
            print('Task removed successfully!');
          } else {
            print('Invalid task number.');
          }
        }
        break;
      case '4':
        print('Exiting To-Do List...');
        return;
      default:
        print('Invalid option. Please try again.');
    }
  }
}
