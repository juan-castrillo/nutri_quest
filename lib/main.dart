import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: new Inicio(), debugShowCheckedModeBanner: false));

class Inicio extends StatefulWidget {
  String pregunta;
  List<String> opciones;
  @override
  InicioState createState() => new InicioState(opciones, pregunta);
}

class InicioState extends State<Inicio> {

  InicioState(List<String> opciones, String pregunta){
    this.opciones = opciones;
    this.pregunta = pregunta;
  }
  String pregunta;
  List<String> opciones;
  Map<String, bool> values = {
    'sample1': true,
    'sample2': false,
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(backgroundColor: new Color(0xFFFF00FF),title: new Text('NutriQuest')),
      body: new ListView(
        children: values.keys.map((String key) {
          return new CheckboxListTile(
            title: new Text(key),
            value: values[key],
            onChanged: (bool value) {
              setState(() {
                values[key] = value;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
