import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo_model.dart';

// ignore: must_be_immutable
class Todocard extends StatefulWidget {
  // create variables that a todocad will receive data for
  final int id;
  final String title;
  bool isChecked;
  final Function insertFunction;
  final Function deleteFunction;
  Todocard(
      {required this.id,
      required this.title,
      required this.isChecked,
      required this.insertFunction,
      required this.deleteFunction,
      Key? key})
      : super(key: key);

  @override
  State<Todocard> createState() => _TodocardState();
}

class _TodocardState extends State<Todocard> {
  @override
  Widget build(BuildContext context) {
    // create a local todo
    var anotherTodo =
        Todo(id: widget.id, title: widget.title, isChecked: widget.isChecked);
    //
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 1),
      child: Row(
        children: [
          // the checkbox
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Checkbox(
              shape: const CircleBorder(),
              value: widget.isChecked,
              onChanged: (bool? value) {
                setState(() {
                  widget.isChecked = value!;
                });
                anotherTodo.isChecked = value!;
                // the insert function
                widget.insertFunction(anotherTodo);
              },
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
          // the delete button
          IconButton(
            onPressed: () {
              // the delete function
              widget.deleteFunction(anotherTodo);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
