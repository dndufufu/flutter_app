import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/page/patient/patient_list.dart';

import '../../responsive.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        // Let's work on our mobile part
        mobile: PatientList(),
        tablet: Row(
          children: [
            Expanded(
              flex: 6,
              child: PatientList(),
            ),
          ],
        ),
        desktop: Row(
          children: [
            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              child: PatientList(),
            )
          ],
        ),
      ),
    );
  }
}
