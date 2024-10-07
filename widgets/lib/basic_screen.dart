import 'package:flutter/material.dart';
import 'immutable_widget.dart';
class BasicScreen extends StatelessWidget{
  const BasicScreen({super.key});
  @override
  Widget build(BuildContext context) {
  return Scaffold(  
     appBar: AppBar(
        backgroundColor: Colors.indigo,
       title: const Center(
         child: Text(
           'Welcome to Flutter',
           style: TextStyle(color: Colors.white),
         ),
       ),
        iconTheme: const IconThemeData(color: Colors.white,),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.edit, color: Colors.white,),
          ),
        ], ),
    body: const Center(
      child: AspectRatio(
        aspectRatio: 1.0,
        child:ImmutableWidget(),
      ),
    ),
    drawer: Drawer(
      child: Container(
        color: Colors.lightBlue,
          child: const Center(
          child: Text("I'm a Drawer!"),
          ),
        ),
      ),

  ); }
}
