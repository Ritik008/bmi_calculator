import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "./result.dart";
import "Calculate.dart";

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(    
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) => Result(),
      },
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  
  int height = 120;
  int weight = 30;
  int age = 10;
  Color maleCardColor = Color(0xFF111328);
  Color femaleCardColor = Color(0xFF111328);

  void updateColor(int gender) {
    if(gender == 1) {
      if(maleCardColor == Color(0xFF111328)) {
          maleCardColor = Color(0xFF1D1E33);
          femaleCardColor = Color(0xFF111328);
      }else {
          maleCardColor = Color(0xFF111328);
          femaleCardColor = Color(0xFF1D1E33);
      }
    }
    if(gender == 2) {
      if(femaleCardColor == Color(0xFF111328)) {
          femaleCardColor = Color(0xFF1D1E33);
          maleCardColor = Color(0xFF111328);
      }else {
          femaleCardColor = Color(0xFF111328);
          maleCardColor = Color(0xFF1D1E33);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded( 
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                     setState(() {
                       updateColor(1);
                    });
                  }, 
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: maleCardColor,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80.0,
                          color: Colors.white
                        ),
                        Text(
                          "MALE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                          )
                        )
                      ],
                    )
                  ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState((){
                        updateColor(2);
                      });
                    },
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: femaleCardColor,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80.0,
                          color: Colors.white,
                        ),
                        Text(
                          "FEMALE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                          )
                        )
                      ],
                  ),
                ),
                ),
                ),
              ],
            )
          ),
          Expanded(
              child: Container(                   
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF1D1E33),
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "HEIGHT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      ),
                    Text(
                      "$height cm",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                        },
                      )
                  ],
                )
            )
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF1D1E33),
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("WEIGHT", 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                          )),
                        Text("$weight", 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          )
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              FloatingActionButton(
                                heroTag: "weightDec",
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onPressed: (){
                                setState((){
                                  weight -= 1;
                                });
                              },
                            ),
                              FloatingActionButton(
                              heroTag: "weightInc",
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: (){
                                setState((){
                                  weight += 1;
                                });
                              },
                            ),
                            ]),
                      ],
                    )
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF1D1E33),
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("AGE", 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                          )),
                        Text("$age", 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          )
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              FloatingActionButton(
                              heroTag: "agedec",
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onPressed: (){
                                setState((){
                                  age -= 1;
                                });
                              },
                            ),
                              FloatingActionButton(
                              heroTag: "ageinc",
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: (){
                                setState((){
                                  age += 1;
                                });
                              },
                            ),
                            ]),
                      ],
                    ) 
                  ),
                ),
              ],
            )
          ),
          Row(
          children: <Widget>[
            Expanded(
                child: ButtonTheme(
                height: 70.0,
                child: FlatButton(
                    child: Text(
                      "CALCULATE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                    color: Colors.red,
                    onPressed: () {
                      Calculate calc = Calculate(height: height, weight: weight);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Result(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )
                        )
                      );
                    },
                  ),
                ),
              ),
          ])
        ],
      ),
    );
  }
}