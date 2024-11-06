class UserProfile {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final DateTime birthDate;
  final int age;
  final String gender;

  UserProfile({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.birthDate,
    required this.age,
    required this.gender,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      birthDate: json['birthDate'] != null
          ? DateTime.parse(json['birthDate'])
          : DateTime(1990, 1, 1),
      age: json['age'] ?? 0,
      gender: json['gender'] ?? 'Otro',
    );
  }

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'phone': phone,
        'email': email,
        'birthDate': birthDate.toIso8601String(),
        'age': age,
        'gender': gender,
      };
}
