class ResponseHandler {
  Object? _error;
  Object? _data;
  int? _statusCode;

  set setStatusCode(int? code) => _statusCode = code;
  set setError(Object? error) => _error = error;
  set setData(Object? data) => _data = data;

  bool get hasError => _error != null;
  bool get hasData => _data != null;

  Object? get data => _data;
  Object? get error => _error;
  int? get statusCode => _statusCode;
}
