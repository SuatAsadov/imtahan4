import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:imtahan_modul/model/todo_list_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white70),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<TodolistModel>todos;
   
  @override
  void initState() {
    
  todos =[model1];

  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
appBar: AppBar(
        title: const Text('ToDo List Exam', style: TextStyle(color: Colors.purple),),
        centerTitle: true,
      
      ),
      body:todos.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount:todos.length,
              itemBuilder: (BuildContext context, int index) {
                final todo =todos[index];
                return FutureBuilder(
                  future: gettodoList(),
                  initialData: model1,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return  Card(
                  child: Row(
                    children: [
                      CircleAvatar( child: Text(todo.id.toString()),
                      ),
                       SizedBox(width: 20,),
                      
            
                    Text(todo.title.toString()),

                    SizedBox(width: 20,),

                  
                    
                ],
                  )
                  
                  );
                
                  },
                );
              },
            ),
    );
  }
}

Future<List<TodolistModel>> gettodoList() async {
  var url = 'https://jsonplaceholder.typicode.com/todos';

  try {
    var res = await Dio().get(url);

    if (res.statusCode == 200) {
      var data = (res.data as List);
      return data.map((e) => TodolistModel.fromJson(e)).toList();
    }
  } on DioException catch (e) {
    Fluttertoast.showToast(
      msg: e.message ?? "Null Error",
    );
  }
  return [];
}



//  Card(
//                   child: Row(
//                     children: [
//                       CircleAvatar( child: Text(todo.id.toString()),
//                       ),
//                        SizedBox(width: 20,),
                      
            
//                     Text(todo.title.toString()),

//                     SizedBox(width: 20,),

                  
                    
//                 ],
//                   ),
//                 );