import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final int c1, c2;
  final Function f;
  final double width, height;

  const GradientButton(
      this.title, this.f, this.c1, this.c2, this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Center(
        child: RaisedButton(
          onPressed: f,
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                colors: [Color(c1), Color(c2)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Container(
              constraints: BoxConstraints(maxWidth: width, maxHeight: height),
              alignment: Alignment.center,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
