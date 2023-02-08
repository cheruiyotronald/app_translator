

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GoogleTranslator translator = GoogleTranslator();
  String text = 'How are you ?';

  void translate(){
    translator.translate(text, to: 'hi').then ((output){
      setState((){
        text = output as String;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text('Language Translation'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(text),
             ElevatedButton(
              onPressed: () {
               translate();
             },
             child: const Text('Translate the text'),
             ),
          ],
        ),
      ),
    );
  }
}