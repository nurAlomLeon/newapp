import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}


class Myapp extends StatelessWidget{
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
        home:const HomeActivity(),
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(primarySwatch: Colors.blue),

    );
  }


}

class HomeActivity extends StatelessWidget{
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      body: const Text("Hello world"),
      appBar: AppBar(title: const Text("hello"),backgroundColor: Colors.teal,),
    );

  }

}