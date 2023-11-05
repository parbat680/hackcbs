class Address {
  final String street;
  final String city;
  final String state;
  final String postalCode;

  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postalCode'],
    );
  }
}

class WorkSchedule {
  final List<String> daysOfWeek;
  final List<WorkScheduleHour> hours;

  WorkSchedule({
    required this.daysOfWeek,
    required this.hours,
  });

  factory WorkSchedule.fromJson(Map<String, dynamic> json) {
    final List<dynamic> hoursData = json['hours'] ?? [];
    final List<WorkScheduleHour> hours =
        hoursData.map((hour) => WorkScheduleHour.fromJson(hour)).toList();

    return WorkSchedule(
      daysOfWeek: List<String>.from(json['daysOfWeek'] ?? []),
      hours: hours,
    );
  }
}

class WorkScheduleHour {
  final String start;
  final String end;
  final String id;

  WorkScheduleHour({
    required this.start,
    required this.end,
    required this.id,
  });

  factory WorkScheduleHour.fromJson(Map<String, dynamic> json) {
    return WorkScheduleHour(
      start: json['start'],
      end: json['end'],
      id: json['_id'],
    );
  }
}

class Doctor {
  final String id;
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;
  final String gender;
  final String email;
  final String phoneNumber;
  final String medicalDegree;
  final List<String> specialties;
  final String licenseNumber;
  final String npiNumber;
  final List<String> hospitalAffiliations;
  final String about;
  final DateTime createdAt;
  final DateTime updatedAt;

  final int v;
  final Address address;
  final WorkSchedule workSchedule;

  Doctor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.gender,
    required this.email,
    required this.phoneNumber,
    required this.medicalDegree,
    required this.specialties,
    required this.licenseNumber,
    required this.npiNumber,
    required this.hospitalAffiliations,
    required this.about,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.address,
    required this.workSchedule,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['_id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      dateOfBirth:
          DateTime.parse(json['dateOfBirth'] ?? '1970-01-01T00:00:00.000Z'),
      gender: json['gender'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      medicalDegree: json['medicalDegree'] ?? '',
      specialties: List<String>.from(json['specialties'] ?? []),
      licenseNumber: json['licenseNumber'] ?? '',
      npiNumber: json['npiNumber'] ?? '',
      hospitalAffiliations:
          List<String>.from(json['hospitalAffiliations'] ?? []),
      about: json['about'] ?? '',
      createdAt:
          DateTime.parse(json['createdAt'] ?? '1970-01-01T00:00:00.000Z'),
      updatedAt:
          DateTime.parse(json['updatedAt'] ?? '1970-01-01T00:00:00.000Z'),
      v: json['__v'] ?? 0,
      address: Address.fromJson(json['address'] ?? {}),
      workSchedule: WorkSchedule.fromJson(json['workSchedule'] ?? {}),
    );
  }
}
