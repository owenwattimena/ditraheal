class ApiReturnValue<T>{
  T? data;
  String? message;
  bool success;
  int statusCode;
  ApiReturnValue({this.data, required this.message, required this.statusCode, required this.success});
}