class ApiErrorModel {
  final String? message;
  final int? code;
  final dynamic data;

  ApiErrorModel({
    this.message,
    this.code,
    this.data,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      message: json['message'] != null ? json['message'] as String : null,
      code: json['code'] != null ? json['code'] as int : null,
      data: json['data'] as dynamic,
    );
  }

  String getAllErrorMessages() {
    if (data == null || data is List && (data as List).isEmpty) {
      return message ?? 'Unknown Error occurred';
    }

    if (data is Map<String, dynamic>) {
      final errorMessage =
          (data as Map<String, dynamic>).entries.map((entry) {
        final value = entry.value;
        return '${value.join(',')}';
      }).join('\n');

      return errorMessage;
    } else if (data is List) {
      return (data as List).join('\n');
    }

    return message ?? 'Unknown Error occurred';
  }
}
