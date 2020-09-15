import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class GradientButton extends StatelessWidget {
  final RoundedLoadingButtonController _btnController;
  final String title;
  final int c1, c2;
  final Function f;
  final double width, height;

  const GradientButton(this.title, this.f, this.c1, this.c2, this.width,
      this.height, this._btnController);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Center(
        child: RoundedLoadingButton(
          color: Color(c1),
          onPressed: f,
          controller: _btnController,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              gradient: LinearGradient(
                colors: [Color(c1), Color(c1)],
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
