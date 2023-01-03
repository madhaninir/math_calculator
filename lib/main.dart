import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MathCalc(),
    ),
  );
}

class MathCalc extends StatefulWidget {
  const MathCalc({Key? key}) : super(key: key);

  @override
  State<MathCalc> createState() => _MathCalcState();
}

class _MathCalcState extends State<MathCalc> {
  int? firstNum;
  int? secondNum;
  String digits = "0";
  String operator = "";
  String history = "0";

  Widget myBox({
    required String number,
    required Color myColor,
  }) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 4,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xff2E2D32),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.grey.shade500, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 5,
            spreadRadius: 1.5,
            offset: const Offset(0.5, 0.5),
          ),
        ],
      ),
      child: InkWell(
        onTap: () => callback(number),
        child: Container(
          height: 25,
          width: 25,
          alignment: Alignment.center,
          color: const Color(0xff2E2D32),
          child: Text(
            number,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w100,
              color: myColor,
            ),
          ),
        ),
      ),
    );
  }

  void callback(String number) {
    setState(() {
      if (number == "+" ||
          number == "-" ||
          number == "*" ||
          number == "/" ||
          number == "%") {
        firstNum = int.parse(digits);
        digits = "";
        operator = number;
      } else if (number == "=") {
        secondNum = int.parse(digits);
        if (operator == "+") {
          digits = (firstNum! + secondNum!).toString();
          history =
              firstNum.toString() + operator.toString() + secondNum.toString();
        } else if (operator == "-") {
          digits = (firstNum! - secondNum!).toString();
          history =
              firstNum.toString() + operator.toString() + secondNum.toString();
        } else if (operator == "*") {
          digits = (firstNum! * secondNum!).toString();
          history =
              firstNum.toString() + operator.toString() + secondNum.toString();
        } else if (operator == "/") {
          digits = (firstNum! / secondNum!).toString();
          history =
              firstNum.toString() + operator.toString() + secondNum.toString();
        } else if (operator == "%") {
          digits = (firstNum! % secondNum!).toString();
          history =
              firstNum.toString() + operator.toString() + secondNum.toString();
        }
      } else {
        digits = int.parse(digits + number).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2E2D32),
      body: Column(
        children: [
          SizedBox(
            height: 195,
          ),
          Container(
            height: 80,
            alignment: Alignment.bottomRight,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 30, right: 20),
            child: Text(
              history,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Color(0xff8D8D8D),
              ),
            ),
          ),
          Container(
            height: 80,
            alignment: Alignment.bottomRight,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 10, bottom: 15, right: 20),
            child: Text(
              digits,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 2,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
            color: const Color(0xff36353a),
          ),
          Container(
            height: 360,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(bottom: 30),
            color: const Color(0xff2D2E32),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 3,
                        color: const Color(0xff2D2E32),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color(0xffFF5A66),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                firstNum = 0;
                                secondNum = 0;
                                digits = "0";
                                history = "0";
                              });
                            },
                            child: const Text(
                              "AC",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      myBox(number: "%", myColor: Colors.white),
                      myBox(number: "/", myColor: Colors.white),
                    ],
                  ),
                ),
                Row(
                  children: [
                    myBox(number: "7", myColor: Colors.white),
                    myBox(number: "8", myColor: Colors.white),
                    myBox(number: "9", myColor: Colors.white),
                    myBox(number: "*", myColor: Colors.white),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    myBox(number: "4", myColor: Colors.white),
                    myBox(number: "5", myColor: Colors.white),
                    myBox(number: "6", myColor: Colors.white),
                    myBox(number: "-", myColor: Colors.white),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    myBox(number: "1", myColor: Colors.white),
                    myBox(number: "2", myColor: Colors.white),
                    myBox(number: "3", myColor: Colors.white),
                    myBox(number: "+", myColor: Colors.white),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    myBox(number: "00", myColor: Colors.white),
                    myBox(number: "0", myColor: Colors.white),
                    myBox(number: ".", myColor: Colors.white),
                    myBox(number: "=", myColor: Colors.white),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
