class ApiReturnValue<T>{
  T? data;
  String message;
  int statusCode;
  ApiReturnValue({this.data, required this.message, required this.statusCode});
}