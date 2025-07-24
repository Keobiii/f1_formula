class F1DriverModel {
  final String id;
  final String firstName;
  final String lastName;
  final String birthDate;
  final String? deathDate;
  final String nationality;
  final int? number;
  final String headshotUrl;
  final String team;

  F1DriverModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    this.deathDate,
    required this.nationality,
    this.number,
    required this.headshotUrl,
    required this.team,
  });

  factory F1DriverModel.fromJson(Map<String, dynamic> json) {
    return F1DriverModel(
      id: json['id'],
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      birthDate: json['birthDate'] ?? '',
      deathDate: json['deathDate'],
      nationality: json['country']?['name'] ?? 'Unknown',
      number: json['number'], 
      headshotUrl: json['headshotUrl'] ?? '', 
      team: json['team']?['name'] ?? 'Unknown',
    );
  }

  String get fullName => '$firstName $lastName';
}
