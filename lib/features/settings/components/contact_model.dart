

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FeedbackDataModel {
  String name;
  String email;
  String subject;
  String message;
  FeedbackDataModel({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["email"] = email;
    data["subject"] = subject;
    data["message"] = message;
    return data;
  }
}
