import 'dart:ffi';

import 'package:flutter/material.dart';

class result extends StatelessWidget {
  const result(
      {Key? key,
      required this.Result,
      required this.ismale,
      required this.age,
      required this.height,
      required this.weight})
      : super(key: key);

  final double Result;
  final bool ismale;
  final int age;
  final double height;
  final int weight;
  String get resultphase{
    String resulttext = "";
    if(Result >=30) {
      resulttext = "obesse";
    } else if(Result >25 && Result<30) {
      resulttext = "overweight";
    } else if(Result >= 18.5 && Result<24.9) {
      resulttext = "normal";
    } else {
      resulttext = "thin";
    }
    return resulttext;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("result"),centerTitle: true,),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Gender : ${ismale ? 'Male' : 'Female'}",
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            Text(
              "Healthiness : $resultphase",
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,            ),
            Text(
              "Age : ${age}",
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,            ),
            Text(
              "Result : ${Result.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,            ),
          ],
        ),
      )),
    );
  }
}
