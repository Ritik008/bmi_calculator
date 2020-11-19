import "package:flutter/material.dart";

class Result extends StatelessWidget {


  Result({@required this.interpretation, @required this.bmiResult, @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
   return MaterialApp(    
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("BMI CALCULATOR")),
          backgroundColor: Color(0xFF0A0E16),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Your Result",
                style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                  width: 450,
                  decoration: BoxDecoration(
                        color: Color(0xFF1D1E33),
                        borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        resultText.toUpperCase(), 
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      Text(
                        bmiResult,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 100.0,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(interpretation,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        )),
                      )
                    ],
                  )
                ),
              ),
              SizedBox(height: 30),
              Row( 
              children: <Widget>[
                Expanded(
                  child: ButtonTheme(
                    height: 60.0,
                    child: FlatButton(
                      child: Text(
                        "RECALCULATE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        )
                      ),
                      color: Colors.red,
                      onPressed: (){
                        Navigator.pop(context);
                      },
                  )
                ),
              )
              ])
            ],
          ),
        )
      ),
    );
  }
}