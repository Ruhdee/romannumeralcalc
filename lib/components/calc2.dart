import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:romannumeralcalc/components/buttontemplate.dart';

class Calc2 extends StatefulWidget {
  const Calc2({super.key});

  @override
  State<Calc2> createState() => _Calc2State();
}

class _Calc2State extends State<Calc2> {
  static String inp = '';
  static String out = '';

  void concat(String num) {
    inp += num;
    convert();
  }

  void convert() {
    int m = 0;
    int d = 0;
    int c = 0;
    int l = 0;
    int x = 0;
    int v = 0;
    int i = 0;
    int output = 0;
    for (int n = 0; n < inp.length; n++) {
      if (m < 3) {
        if (inp[n] == 'M') {
          output += 1000;
          m++;
          continue;
        }
      }
      if (d < 1) {
        if (inp[n] == 'D') {
          output += 500;
          d++;
          m += 4;
          continue;
        }
      }
      if (c < 3) {
        if (inp[n] == 'C') {
          if (n + 1 < inp.length) {
            if (inp[n + 1] == 'M' && m < 4) {
              output += 900;
              c += 3;
              m += 4;
              d += 1;
              n++;
              continue;
            } else if (inp[n + 1] == 'D' && d == 0) {
              output += 400;
              c += 3;
              m += 4;
              d++;
              n++;
              continue;
            }
          }
          output += 100;
          c++;
          m += 4;
          d++;
          continue;
        }
      }
      if (l < 1) {
        if (inp[n] == 'L') {
          output += 50;
          l++;
          c += 4;
          d++;
          m += 3;
          continue;
        }
      }
      if (x < 3) {
        if (inp[n] == 'X') {
          if (n + 1 < inp.length) {
            if (inp[n + 1] == 'C' && c < 4) {
              output += 90;
              x += 3;
              l++;
              c += 4;
              m += 3;
              d++;
              n++;
              continue;
            } else if (inp[n + 1] == 'L' && l == 0) {
              output += 40;
              x += 3;
              l++;
              c += 4;
              m += 3;
              d++;
              n++;
              continue;
            }
          }
          output += 10;
          x++;
          l++;
          c += 4;
          m += 3;
          d++;
          continue;
        }
      }
      if (v < 1) {
        if (inp[n] == 'V') {
          output += 5;
          v++;
          x += 4;
          l++;
          c += 4;
          d++;
          m += 3;
          continue;
        }
      }
      if (i < 3) {
        if (inp[n] == 'I') {
          if (n + 1 < inp.length) {
            if (inp[n + 1] == 'X' && x < 4) {
              output += 9;
              i += 3;
              v++;
              x += 4;
              l++;
              c += 4;
              m += 3;
              d++;
              n++;
              continue;
            } else if (inp[n + 1] == 'V' && v == 0) {
              output += 4;
              i += 3;
              v++;
              x += 4;
              l++;
              c += 4;
              m += 3;
              d++;
              n++;
              continue;
            }
          }
          output += 1;
          i++;
          v++;
          x += 4;
          l++;
          c += 4;
          m += 3;
          d++;
          continue;
        }
      }
      out = 'Error: Wrong Number';
      return;
    }
    out = '$output';
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
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(0),
                height: 66,
                margin: const EdgeInsets.all(8.0),
                alignment: Alignment.bottomRight,
                child: FittedBox(
                  child: Text(
                    out,
                    style: const TextStyle(
                      color: Colors.amber,
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
                child: FittedBox(
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
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icontemplate(
                    name: Icons.swap_horiz_rounded,
                    onpress: () {
                      Navigator.pushNamed(context, '/');
                    },
                    context: context)
              ],
            )),
            Expanded(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Buttontemplate(
                    name: 'I',
                    context: context,
                    onpress: () {
                      setState(() {
                        concat('I');
                      });
                    }),
                Buttontemplate(
                    name: 'V',
                    context: context,
                    onpress: () {
                      setState(() {
                        concat('V');
                      });
                    }),
                Buttontemplate(
                    name: 'X',
                    context: context,
                    onpress: () {
                      setState(() {
                        concat('X');
                      });
                    }),
              ]),
            ),
            Expanded(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Buttontemplate(
                    name: 'L',
                    context: context,
                    onpress: () {
                      setState(() {
                        concat('L');
                      });
                    }),
                Buttontemplate(
                    name: 'C',
                    context: context,
                    onpress: () {
                      setState(() {
                        concat('C');
                      });
                    }),
                Buttontemplate(
                    name: 'D',
                    context: context,
                    onpress: () {
                      setState(() {
                        concat('D');
                      });
                    }),
              ]),
            ),
            Expanded(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icontemplate(
                    name: CupertinoIcons.clear_circled,
                    onpress: () {
                      setState(() {
                        inp = '';
                        out = '';
                      });
                    },
                    context: context),
                Buttontemplate(
                    name: 'M',
                    context: context,
                    onpress: () {
                      setState(() {
                        concat('M');
                      });
                    }),
                Icontemplate(
                    name: CupertinoIcons.delete_left,
                    onpress: () {
                      setState(() {
                        inp = inp.substring(0, inp.length - 1);
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
