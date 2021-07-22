import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app/module/patient/patient.dart';
import 'package:flutter_app/module/patient/patient_state.dart';
import 'package:flutter_app/util/route.dart';

import '../home/drawer.dart' as panacea;

class PatientList extends StatefulWidget {
  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  final Set<Patient> _saved = new Set<Patient>();
  final _biggerFont = TextStyle(fontSize: 18.0);

  @override
  void initState() {
    _fetchPatientList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: const Text('患者列表'),
        ),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      drawer: panacea.Drawer(),
      body: Center(
        child: Consumer(
          builder: (context, watch, child) {
            var patientList = watch(patientListProvider);
            return ListView.builder(
                padding: EdgeInsets.all(16.0),
                itemCount: patientList.length * 2,
                itemBuilder: (context, i) {
                  if (i.isOdd) return Divider();
                  final index = i ~/ 2;
                  return _buildRow(patientList[index]);
                });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.ballot),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Future<void> _fetchPatientList() async {
    await context.read(patientListProvider.notifier).list();
  }


  Widget _buildRow(Patient patient) {
    final bool alreadySaved = _saved.contains(patient);
    return ListTile(
      // leading: FlutterLogo(size: 56.0),
      leading: Icon(Icons.account_circle_rounded, size: 56.0),
      title: Text(
        patient.name,
        style: _biggerFont,
      ),
      subtitle: Text(
          '入院时间：床位号：${patient.bedNum} 诊断： ${patient.diagnosis} 主治医师： ${patient.attendingPhysician}'),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
    );
  }
}
