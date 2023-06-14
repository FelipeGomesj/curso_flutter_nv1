import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

List<FocusNode> _focusNode = [FocusNode()];
List<String> _taskList = [];
TextEditingController _textFieldEditingController = TextEditingController();

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                TextField(
                  focusNode: _focusNode[0],
                  controller: _textFieldEditingController,
                  onSubmitted: (text){
                    if (text.isNotEmpty) {
                      _taskList.add(text);
                      _textFieldEditingController.clear();
                      setState(() {});
                    }
                  },
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black87
                      )
                    )
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: _taskList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(_taskList[index]),
                        trailing: GestureDetector(
                          onTap: () {
                            _taskList.removeAt(index);
                            setState(() {});
                          },
                          child: Icon(Icons.delete, color: Colors.red,),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          _taskList.isNotEmpty ? FloatingActionButton(
                onPressed: () {
                    _taskList = [];
                    _textFieldEditingController.clear();
                    setState(() {});
                },
                backgroundColor: Colors.red,
                child: const Icon(Icons.remove),
            ) : SizedBox(),
            const SizedBox(
              width: 18,
            ),
            FloatingActionButton(
                onPressed: () {
                  if (_textFieldEditingController.text.isNotEmpty) {
                    _taskList.add(_textFieldEditingController.text);
                    _textFieldEditingController.clear();
                    setState(() {});
                  }
                },
                backgroundColor: Colors.green,
                child: const Icon(Icons.add))

          ],
        ),
      ),
    );
  }
}
