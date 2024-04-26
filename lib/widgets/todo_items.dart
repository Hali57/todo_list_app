import 'package:flutter/material.dart';
import 'package:todo_list/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo; // The ToDo object associated with this item
  final Function(ToDo) onToDoChanged; // Callback function for task completion status change
  final Function(String) onDeleteItem; // Callback function for task deletion

  // Constructor for ToDoItem, taking required parameters
  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onToDoChanged(todo);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Add symmetric margin for better spacing
        decoration: BoxDecoration(
          color: todo.isDone ? Color.fromARGB(255, 176, 250, 221).withOpacity(0.5) : Colors.white, // Change background color if task is done
          borderRadius: BorderRadius.circular(15), // Apply rounded corners to the container
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Add a subtle shadow for depth
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Adjust content padding
          leading: Checkbox(
            value: todo.isDone,
            onChanged: (_) {
              onToDoChanged(todo);
            },
            activeColor: Color.fromARGB(255, 112, 190, 254), // Use blue for active color
          ),
          title: Text(
            todo.todoText,
            style: TextStyle(
              fontSize: 16,
              color: todo.isDone ? Colors.grey : Colors.black, // Change text color if task is done
              decoration: todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
          trailing: GestureDetector(
            onTap: () {
              onDeleteItem(todo.id);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(111, 233, 198, 1),
                shape: BoxShape.circle, // Use circular shape for the delete button container
              ),
              child: Icon(
                Icons.delete,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}