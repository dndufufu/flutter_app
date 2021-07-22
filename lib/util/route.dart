import 'package:flutter/material.dart';

void pushNamed(BuildContext context, String route) {
  if(MediaQuery.of(context).size.width < 650) {
    Navigator.pushNamed(context, route);
  }
}

void pushNamedOrPop(BuildContext context, String route) {
  if(MediaQuery.of(context).size.width < 650) {
    Navigator.pushNamed(context, route);
  }else{
    Navigator.pop(context);
  }
}