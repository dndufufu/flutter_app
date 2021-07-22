class Patient {
  late String _id;
  late String _name;
  late String _department;
  late String _bedNum;
  late String _diagnosis;
  late String _attendingPhysician;

  String get id => _id;

  String get name => _name;

  String get department => _department;

  String get bedNum => _bedNum;

  String get diagnosis => _diagnosis;

  String get attendingPhysician => _attendingPhysician;

  Patient();

  Patient.build(this._id, this._name, this._department, this._bedNum,
      this._diagnosis, this._attendingPhysician);

  factory Patient.fromJson(Map<String, dynamic> json) {
    var patient = Patient();
    patient._id = json['id'];
    patient._name = json['name'];
    patient._department = json['department'];
    patient._bedNum = json['bed-num'];
    patient._diagnosis = json['diagnosis'];
    patient._attendingPhysician = json['attending-physician'];
    return patient;
  }
}

