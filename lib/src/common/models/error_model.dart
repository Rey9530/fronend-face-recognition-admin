class ErrorResponse {
  final DateTime time;
  final String path;
  final List<String> data;
  final String message;
  final int status;

  ErrorResponse({
    required this.time,
    required this.path,
    required this.data,
    required this.message,
    required this.status,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        time: DateTime.parse(json["time"]),
        path: json["path"],
        data: List<String>.from(json["data"].map((x) => x)),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "time": time.toIso8601String(),
        "path": path,
        "data": List<dynamic>.from(data.map((x) => x)),
        "message": message,
        "status": status,
      };
}
