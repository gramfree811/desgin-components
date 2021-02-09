import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // List<TodoModel> _todoList = [];
  List<String> _todoList = [];
  String currentValue = '';
  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // clearTodoList();
    loadTodoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: _todoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text('${_todoList[index]}'),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        tooltip: 'Edit',
                        icon: Icon(
                          Icons.edit_outlined,
                          color: Colors.blue,

                        ),
                        onPressed: () {
                          openEditDialog(index);
                        },
                      ),
                      IconButton(
                        tooltip: 'Remove',
                        icon: Icon(
                          Icons.highlight_remove_rounded,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          removeTask(index);
                        },
                      ),
                    ],
                  ));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void loadTodoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.clear();
    if (prefs.getStringList('todoList') != null) {
      setState(() {
        _todoList = prefs.getStringList('todoList');
      });
    }
    print(_todoList);
  }

  void addTodoList(String task) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = [];
    list = _todoList;
    list.add(task);
    prefs.setStringList('todoList', list);
  }

  void updateTodoList(String newVal, int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = [];
    if (prefs.getStringList('todoList') != null) {
      list = prefs.getStringList('todoList');
      list[index] = newVal;
      prefs.setStringList('todoList', list);
      loadTodoList();
    }
  }

  void removeTask(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = [];
    if (prefs.getStringList('todoList') != null) {
      list = prefs.getStringList('todoList');
      list.removeAt(index);
      prefs.setStringList('todoList', list);
      loadTodoList();
    }
  }

  void openDialog() async {
    setState(() {
      currentValue = '';
    });
    var response = await showDialog(
        context: (context),
        child: AlertDialog(
            title: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text('Enter Task'),
                    TextFormField(
                      onChanged: (val) {
                        currentValue = val;
                      },
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Field cannot be empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.pop(context, true);
                        }
                      },
                      child: Text('Add'),
                    )
                  ],
                ))));
    if (response != null && response) {
      addTodoList(currentValue);
      loadTodoList();
    }
  }

  void openEditDialog(int index) async {
    currentValue = '';
    var response = await showDialog(
        context: (context),
        child: AlertDialog(
            title: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text('Update Task'),
                    TextFormField(
                      initialValue: _todoList[index],
                      onChanged: (val) {
                        currentValue = val;
                      },
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Field cannot be empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.pop(context, true);
                        }
                      },
                      child: Text('Update'),
                    )
                  ],
                ))));
    if (response != null && response) {
      updateTodoList(currentValue, index);
      // loadTodoList();
    }
  }

  void clearTodoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("List ${await prefs.remove('todoList')} cleared");
  }
}
