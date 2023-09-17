import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool IsMale = true;
  double height = 170;
  int weight = 95;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Body Mass Index"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      m1expanded(context, 'male'),
                      SizedBox(width: 15),
                      m1expanded(context, 'female'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('height',style: Theme.of(context).textTheme.headline2,),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic ,
                            children: [
                          Text(height.toStringAsFixed(1),style: Theme.of(context).textTheme.headline1),
                          Text('cm',style: Theme.of(context).textTheme.bodyText1),
                        ]),
                        Slider(
                            min: 90,
                            max: 220,
                            value: height,
                            onChanged: (newvalue) {
                              setState(() {
                                height = newvalue ;
                              });
                            })
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      m2expanded(context, 'weight'),
                      SizedBox(width: 15),
                      m2expanded(context, 'age'),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height/15,
                width: double.infinity,
                color: Colors.teal,
                  child: TextButton(
                        onPressed: () {
                            var resultval = weight/ pow(height/100,2);
                          Navigator.push(context,MaterialPageRoute(
                              builder: (context) =>
                              result(Result: resultval,ismale: IsMale,age: age,weight: weight,height: height)
                             ),
                          );
                        },
                        child: Text('Calculate',
                        style: Theme.of(context).textTheme.headline2,
                      )
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded m1expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            IsMale = (type == 'male') ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (IsMale && type == 'male') || (!IsMale && type == 'female')
                  ? Colors.teal
                  : Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(type == 'male' ? Icons.male : Icons.female),
              SizedBox(height: 15),
              Text(
                  type == 'male' ? 'Male' : 'Female',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline2
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                type == 'age' ? 'age' : 'weight',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline2
            ),
            SizedBox(height: 15),
            Text(
                type == 'age' ? '$age' : '$weight',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline1
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age++ : weight++;
                    });
                  },
                  child: Icon(Icons.add),
                  mini: true,
                  heroTag: type == 'age' ? 'age++' : 'weight++',
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age-- : weight--;
                    });
                  },
                  child: Icon(Icons.remove),
                  mini: true,
                  heroTag: type == 'age' ? 'age--' : 'weight--',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
