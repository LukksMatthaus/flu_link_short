import 'package:flutter/material.dart';

/// Appbar without fixed leading icon.
/// If this widget is placed in a page that has previous, an arrow_back is shown on leading position.
class ModalAppBar extends PreferredSize {
  final List<Widget> actions;
  final String title;
  final bool leading;

  ModalAppBar({@required this.title, this.actions, @required this.leading});

  @override
  Size get preferredSize => Size.fromHeight(54);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      actions: actions,
      automaticallyImplyLeading: leading,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xfffbb448), Color(0xfff7892b)],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
