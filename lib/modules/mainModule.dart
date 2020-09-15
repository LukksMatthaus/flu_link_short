import 'package:flu_link_short/pages/all/login.dart';
import 'package:flu_link_short/pages/all/singup.dart';
import 'package:flu_link_short/pages/all/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../main.dart';

class InitialModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router('/', child: (_, __) => WelcomePage()),
        Router('/signup', child: (_, __) => SignUpPage()),
        Router('/login', child: (_, __) => Loginpage())
      ];

  @override
  Widget get bootstrap => AppWidget();
}
