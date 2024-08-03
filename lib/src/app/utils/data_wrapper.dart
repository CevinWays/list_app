class DataWrapper<T> {
  T? data;
  Status? status;
  String? title;
  String? message;
  ErrorType? errorType;

  DataWrapper.init() : status = Status.init;
  DataWrapper.loading() : status = Status.loading;
  DataWrapper.success(this.data) : status = Status.success;
  DataWrapper.error(
      {this.errorType = ErrorType.undefined, this.title, this.message})
      : status = Status.error;
}

enum Status { loading, success, error, init }

enum ErrorType {
  noInternet,
  badRequest,
  serverError,
  forbidden,
  notFound,
  unauthorized,
  emptyCart,
  emptyPromo,
  emptyTransaction,
  emptyNotification,
  noSearchResults,
  undefined
}