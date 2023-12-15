class DataResponse<T, R> {
  T? success;
  R? failure;

  DataResponse._({this.success, this.failure});

  factory DataResponse.success(T data) {
    return DataResponse._(success: data);
  }

  factory DataResponse.failure(R error) {
    return DataResponse._(failure: error);
  }
}
