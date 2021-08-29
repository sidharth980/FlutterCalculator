import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
      home: HomeCalc(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomeCalc extends StatefulWidget {
  @override
  _HomeCalcState createState() => _HomeCalcState();
}

class _HomeCalcState extends State<HomeCalc> {
  String equation = "";
  String inputString = "";
  int fun = 0;
  var equationOne;
  var equationTwo;
  var answers;
  bool dot = true;

  Widget numCard(String num){
    return Container(
      child: FlatButton(
        onPressed: () {
          setState(() {
            inputString = inputString + num;
          });
        },
        child: Text(num,style: TextStyle(fontSize: 25),),
      ),
      height: 80,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                color: Colors.grey[200],
                padding: EdgeInsets.fromLTRB(20,0,0,0),
                  child: Text(
                      equation,
                  style: TextStyle(
                    fontSize: 50,
                  )),
                  height: 100,
              ),
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.fromLTRB(0,0,30,0),
                alignment: Alignment.centerRight,
                child: Text(
                  inputString,
                  style: TextStyle(
                      fontSize: 40
                  ),
                ),
                height: 100,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      equation = "";
                      inputString = "";
                      fun = 0;
                      dot = true;
                    });
                  },
                  child: Text("C",style: TextStyle(fontSize: 25),),
                ),
                height: 80,
              ),
              Container(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      equationOne = double.parse(inputString);
                      inputString = inputString + " %";
                      equation = inputString;
                      inputString = "";
                      dot = true;
                      fun = 5;
                    });
                  },
                  child: Text("%",style: TextStyle(fontSize: 25),),
                ),
                height: 80,
              ),
              Container(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      if(inputString == ""){
                        inputString = equation.substring(0,equation.length-2);
                        equation = "";
                      }
                      else{
                        inputString = inputString.substring(0,inputString.length-1);
                      }
                    });
                  },
                  child: Icon(Icons.backspace),
                ),
                height: 80,
              ),
              Container(
                child: FlatButton(
                    onPressed: () {
                      setState(() {
                        equationOne = double.parse(inputString);
                        inputString = inputString + " +";
                        equation = inputString;
                        inputString = "";
                        dot = true;
                        fun = 1;
                      });
                    },
                    child: Icon(Icons.add,color: Colors.white,)
                ),
                height: 55,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orangeAccent,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              numCard("9"),
              numCard("8"),
              numCard("7"),
              Container(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      equationOne = double.parse(inputString);
                      inputString = inputString + " -";
                      equation = inputString;
                      inputString = "";
                      fun = 2;
                      dot = true;
                    });
                  },
                  child: Icon(Icons.remove,color: Colors.white,)
                ),
                height: 55,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              numCard("6"),
              numCard("5"),
              numCard("4"),
              Container(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      equationOne = double.parse(inputString);
                      inputString = inputString + " x";
                      equation = inputString;
                      inputString = "";
                      dot = true;
                      fun = 3;
                    });
                  },
                  child: Text("X",style: TextStyle(fontSize: 25,color: Colors.white,),),
                ),
                height: 55,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.lightBlueAccent,
                ),
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              numCard("3"),
              numCard("2"),
              numCard("1"),
              Container(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      equationOne = double.parse(inputString);
                      inputString = inputString + " /";
                      equation = inputString;
                      inputString = "";
                      dot = true;
                      fun = 4;
                    });
                  },
                  child: Text("/",style: TextStyle(fontSize: 25,color: Colors.white,),),
                ),
                height: 55,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purpleAccent,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(width: 90,),
              numCard("0"),
              Container(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      if(dot){
                        inputString = inputString + ".";
                      dot = false;}
                    });
                  },
                  child: Text(".",style: TextStyle(fontSize: 25),),
                ),
              ),
              Container(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      equationTwo = double.parse(inputString);
                      if(fun==1){
                        answers = equationOne + equationTwo;}
                      else if(fun == 2){
                        answers = equationOne - equationTwo;}
                      else if(fun == 3){
                        answers = equationOne * equationTwo;}
                      else if(fun == 4){
                        answers = equationOne / equationTwo;}
                      else if(fun == 5){
                        answers = equationOne / equationTwo;
                        answers = answers*100;
                      }
                      equation = equation + " " +inputString;
                      inputString = answers.toString();
                      dot = true;
                      fun = 0;
                    });
                  },
                  child: Icon(Icons.arrow_forward,color: Colors.white,),
                ),
                height: 55,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.greenAccent,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}