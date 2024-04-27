import 'package:flutter/material.dart'; // Import core Flutter widgets
import 'package:todo_list/screens/tasks_screen.dart';
void main() {
  runApp(const MyApp()); // Run the app with MyApp widget
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner in top left
      title: 'Flutter Todo List', // Set app title
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF883007), // Set primary color (orange)
        ),
        useMaterial3: true, // Enable Material 3 design elements
      ),
      home:const TasksScreen(), // Set TasksScreen as the home screen
    );
  }
}
