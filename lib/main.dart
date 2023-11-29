import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Color> Coulor = [
    Colors.black,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.pink,
    Colors.blue,
    Colors.indigo,
    Colors.teal,
    Colors.lightGreen,
    Colors.yellow,
    Colors.redAccent,
    Colors.greenAccent

  ];

  Color? SelectColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 200),
              DragTarget<Color>(
                builder: (context, accepted, rejected) {
                  return Container(
                    height: 200,
                    width: 200,
                      color: Colors.grey,
                    child: SelectColor != null ? Container(
                      decoration: BoxDecoration(
                          color: SelectColor),) : Container(),
                  );
                },
                onAccept: (color) {
                  SelectColor = color;
                },
              ),
              SizedBox(height: 100),
              Container(
                height:100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: Coulor.length,
                    itemBuilder: (context, index) {
                      return Draggable(
                        data: Coulor[index],
                        child: Container(
                          height: 100,
                          width: 100,
                            color: Coulor[index],
                          margin: EdgeInsets.all(5),
                        ),
                        feedback: Container(
                          height: 60,
                          width: 60,
                            color: Coulor[index],
                          margin: EdgeInsets.all(4.0),
                        ),
                      );
                    },
                  ),
              ),
            ]
         )
       ]
      )
    );
  }
}
