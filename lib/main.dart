import 'package:flutter/material.dart';

import 'task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Задачи',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Задачи'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 8; i++) {
      addToList(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(widget.title),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                onPressed: addTask,
                tooltip: 'Add task',
                icon: const Icon(Icons.add))
          ],
        ),
        body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(
                Icons.task,
              ),
              title: Text(
                tasks[index].title,
              ),
              subtitle: Text(
                tasks[index].description,
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
              ),
              enabled: tasks[index].isEnabled,
            );
          },
        ));
  }

  void addToList(int index) {
    tasks.add(Task(
        title: 'Задача: $index',
        description: 'Описание: $index',
        isEnabled: index % 2 == 0));
  }

  void addTask() {
    setState(() {
      int index = tasks.length;
      addToList(index);
    });
  }
}
