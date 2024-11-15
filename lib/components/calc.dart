import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:romannumeralcalc/components/buttontemplate.dart';

class Calc extends StatefulWidget {
  const Calc({super.key});

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  static String inp = '0';
  static String out = '';

  void concat(String num) {
    if (inp == '0') {
      inp = '';
    }
    inp += num;
    convert();
  }

  void convert() {
    out = '';
    int number = int.parse(inp);
    if (number >= 4000) {
      out = 'Number is too large';
    } else {
      int a = (number / 1000).floor();
      for (int j = 0; j < a; j++) {
        out += 'M';
      }
      number %= 1000;
      a = (number / 900).floor();
      for (int j = 0; j < a; j++) {
        out += 'CM';
      }
      number %= 900;
      a = (number / 500).floor();
      for (int j = 0; j < a; j++) {
        out += 'D';
      }
      number %= 500;
      a = (number / 400).floor();
      for (int j = 0; j < a; j++) {
        out += 'CD';
      }
      number %= 400;
      a = (number / 100).floor();
      for (int j = 0; j < a; j++) {
        out += 'C';
      }
      number %= 100;
      a = (number / 90).floor();
      for (int j = 0; j < a; j++) {
        out += 'XC';
      }
      number %= 90;
      a = (number / 50).floor();
      for (int j = 0; j < a; j++) {
        out += 'L';
      }
      number %= 50;
      a = (number / 40).floor();
      for (int j = 0; j < a; j++) {
        out += 'XL';
      }
      number %= 40;
      a = (number / 10).floor();
      for (int j = 0; j < a; j++) {
        out += 'X';
      }
      number %= 10;
      a = (number / 9).floor();
      for (int j = 0; j < a; j++) {
        out += 'IX';
      }
      number %= 9;
      a = (number / 5).floor();
      for (int j = 0; j < a; j++) {
        out += 'V';
      }
      number %= 5;
      a = (number / 4).floor();
      for (int j = 0; j < a; j++) {
        out += 'IV';
      }
      number %= 4;
      a = (number / 1).floor();
      for (int j = 0; j < a; j++) {
        out += 'I';
      }
      number %= 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width;
    double c_height = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        width: c_height * 3 / 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(0),
                height: 66,
                margin: const EdgeInsets.all(8.0),
                alignment: Alignment.bottomRight,
                child: FittedBox(
                  child: Text(
                    out,
                    style: TextStyle(
                      color: Colors.amber[900],
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                alignment: Alignment.centerRight,
                child: Text(
                  inp,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 50,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icontemplate(
                    name: Icons.swap_horiz_rounded,
                    onpress: () {
                      Navigator.pushNamed(context, '/2');
                    },
                    context: context)
              ],
            )),
            Expanded(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Buttontemplate(
                    context: context,
                    name: '7',
                    onpress: () {
                      setState(() {
                        concat('7');
                      });
                    }),
                Buttontemplate(
                    name: '8',
                    context: context,
                    onpress: () {
                      setState(() {
                        concat('8');
                      });
                    }),
                Buttontemplate(
                    name: '9',
                    context: context,
                    onpress: () {
                      setState(() {
                        concat('9');
                      });
                    }),
              ]),
            ),
            Expanded(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Buttontemplate(
                    name: '4',
                    context: context,
                    onpress: () {
                      setState(() {
                        concat('4');
                      });
                    }),
                Buttontemplate(
                    name: '5',
                    context: context,
                    onpress: () {
                      setState(() {
                        concat('5');
                      });
                    }),
                Buttontemplate(
                    name: '6',
                    context: context,
                    onpress: () {
                      setState(() {
                        concat('6');
                      });
                    }),
              ]),
            ),
            Expanded(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Buttontemplate(
                    name: '1',
                    context: context,
                    onpress: () {
                      setState(() {
                        concat('1');
                      });
                    }),
                Buttontemplate(
                    name: '2',
                    context: context,
                    onpress: () {
                      setState(() {
                        concat('2');
                      });
                    }),
                Buttontemplate(
                    name: '3',
                    context: context,
                    onpress: () {
                      setState(() {
                        concat('3');
                      });
                    }),
              ]),
            ),
            Expanded(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Buttontemplate(
                    name: 'C',
                    context: context,
                    onpress: () {
                      setState(() {
                        inp = '0';
                        out = '';
                      });
                    }),
                Buttontemplate(
                    name: '0',
                    context: context,
                    onpress: () {
                      setState(() {
                        concat('0');
                      });
                    }),
                Icontemplate(
                    name: CupertinoIcons.delete_left,
                    onpress: () {
                      setState(() {
                        inp = inp.substring(0, inp.length - 1);
                        if (inp.isEmpty) inp = '0';
                        convert();
                      });
                    },
                    context: context)
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
