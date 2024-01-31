class Response {
  int statusCode;
  String? image;
  String? message;
  int? count;
  String? errorMessage;

  Response({
    required this.statusCode,
    required this.image,
    required this.message,
    required this.count,
    required this.errorMessage,
  });

  factory Response.fromMap(Map<String, dynamic> map) {
    return Response(
        statusCode: map['status_code'],
        image: map['image'],
        message: map['message'],
        count: map['count'],
        errorMessage: map['error_message']);
  }
}
