import 'dart:io';

import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {

  TextEditingController heightcontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();
  double result = 0; //call value
// BMI=weight/height*height,
  void calculator() {
    double height = double.parse(heightcontroller.text) / 100; //convert to cm
    double weight = double.parse(weightcontroller.text);
    double _result = weight / (height * height);
    result = _result;
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black38,
          title: Center(
            child: Text(
              "BMI CALCULATOR",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                child: TextField(
                  keyboardType:TextInputType.number ,
                  controller: heightcontroller,
                  decoration: InputDecoration(
                    labelText: "Height",
                    icon: Icon(
                      Icons.arrow_upward_outlined,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                padding: const EdgeInsets.all(8.0),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType:TextInputType.number,
                  controller: weightcontroller,
                  decoration: InputDecoration(
                    labelText: "weight",
                    icon: Icon(
                        Icons.insert_comment),
                    border: OutlineInputBorder(),


                  ),
                ),
              ),
              ElevatedButton(onPressed: () {
                calculator();
              }, child: Text("calculate")),
              Text(result==null?"enter value":result.toStringAsFixed(2)),
            ]
        ),

      ),

    );
  }
}