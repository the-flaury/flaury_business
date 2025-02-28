class BusinessSchedule {
  final bool alwaysOpen;
  final List<BusinessHours>? hours;

  BusinessSchedule({required this.alwaysOpen, this.hours});

  // Factory constructor to create an instance from JSON
  factory BusinessSchedule.fromJson(Map<String, dynamic> json) {
    return BusinessSchedule(
      alwaysOpen: json['alwaysOpen'],
      hours: json['hours'] != null
          ? (json['hours'] as List)
              .map((item) => BusinessHours.fromJson(item))
              .toList()
          : null,
    );
  }

  // Convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'alwaysOpen': alwaysOpen,
      'hours': hours?.map((e) => e.toJson()).toList(),
    };
  }
}

class BusinessHours {
  final String day;
  final String openTime;
  final String closeTime;

  BusinessHours(
      {required this.day, required this.openTime, required this.closeTime});

  // Factory constructor to create an instance from JSON
  factory BusinessHours.fromJson(Map<String, dynamic> json) {
    return BusinessHours(
      day: json['day'],
      openTime: json['openTime'],
      closeTime: json['closeTime'],
    );
  }

  // Convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'openTime': openTime,
      'closeTime': closeTime,
    };
  }
}
