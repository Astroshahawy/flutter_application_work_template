class ApiErrorModel {
  final String? message;
  final int? code;

  ApiErrorModel({
    required this.message,
    this.code,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'message': message,
      'code': code,
    };
  }

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      message: json['message'] != null ? json['message'] as String : null,
      code: json['code'] != null ? json['code'] as int : null,
    );
  }
}
