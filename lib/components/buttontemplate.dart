import 'package:flutter/material.dart';

class Buttontemplate extends StatelessWidget {
  final String name;
  final Function onpress;
  final BuildContext context;
  const Buttontemplate(
      {super.key,
      required this.name,
      required this.onpress,
      required this.context});

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width;
    double c_height = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        padding: const EdgeInsets.all(0.0),
        margin: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 1,
          child: ElevatedButton(
              onPressed: () {
                onpress();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: const Color(0),
              ),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                ),
              )),
        ),
      ),
    );
  }
}

class Icontemplate extends StatelessWidget {
  final IconData name;
  final Function onpress;
  final BuildContext context;
  const Icontemplate(
      {super.key,
      required this.name,
      required this.onpress,
      required this.context});

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width;
    double c_height = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        padding: const EdgeInsets.all(0.0),
        margin: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 1,
          child: IconButton(
            padding: const EdgeInsets.all(0.0),
            onPressed: () {
              onpress();
            },
            icon: Icon(
              name,
              color: Colors.white,
              size: 65,
            ),
            style: IconButton.styleFrom(
                backgroundColor: const Color(0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0))),
          ),
        ),
      ),
    );
  }
}
