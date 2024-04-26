// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(firstStap());

class firstStap extends StatelessWidget {
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      debugShowCheckedModeBanner: false, 
      theme: ThemeData( 
        primarySwatch: Colors.green, 
      ), 
      title: 'Анкета', 
      home: MyForm(), 
    ); 
  } 
}

class MyForm extends StatefulWidget { 
  @override 
  _MyFormState createState() => _MyFormState(); 
} 
  
class _MyFormState extends State<MyForm> { 
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); 
  String _name = ''; 
  String _age = ''; 
  
  void _submitForm() { 
    if (_formKey.currentState!.validate()) { 
      _formKey.currentState!.save(); 
      print('Имя: $_name'); 
      print('Возраст: $_age'); 
    } 
  } 
  
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: Text('Анкета'), 
      ), 
      body: Form( 
        key: _formKey,  
        child: Padding( 
          padding: EdgeInsets.all(16.0), 
          child: Column( 
            children: <Widget>[ 
              TextFormField( 
                decoration: InputDecoration(labelText: 'Имя'), 
                validator: (value) { 
                  
                  if (value!.isEmpty) { 
                    return 'Введите своё имя'; 
                  } 
                  return null; 
                }, 
                onSaved: (value) { 
                  _name = value!; 
                }, 
              ), 
              TextFormField( 
                decoration: InputDecoration(labelText: 'Возраст'), 
                validator: (value) { 
                  
                  if (value!.isEmpty) { 
                    return 'Введите свой возраст'; 
                  } 
                  
                  return null; 
                }, 
                onSaved: (value) { 
                  _age = value!; 
                }, 
              ), 
              SizedBox(height: 20.0), 
              ElevatedButton( 
                onPressed: _submitForm, 
                child: Text('Отправить'),
              ), 
            ], 
          ), 
        ), 
      ), 
    ); 
  } 
} 