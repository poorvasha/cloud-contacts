class ContactModel {
  String name;
  String phoneNumber;
  ContactModel({required this.name, required this.phoneNumber});

  factory ContactModel.fromJson(Map<dynamic, dynamic> json) {
    return ContactModel(
      name: json['name'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "phoneNumber": phoneNumber,
      };
}

class ContactWithIdModel extends ContactModel {
  String id;
  String userId;
  String date;

  ContactWithIdModel({
    required this.id,
    required this.userId,
    required this.date,
    required super.name,
    required super.phoneNumber,
  });

  factory ContactWithIdModel.fromJson(Map<dynamic, dynamic> json) {
    return ContactWithIdModel(
      id: json['id'],
      userId: json['userId'],
      date: json['date'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "date": userId,
        "name": name,
        "phoneNumber": phoneNumber,
      };
}
