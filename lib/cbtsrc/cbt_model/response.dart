class ApiResponse<T> {
  T? resObject;
  bool isSuccess;
  bool updateRequired;
  String errorCause;
  int count;

  ApiResponse(
      {required this.isSuccess,
        this.resObject,
        required this.errorCause,
        this.updateRequired = false,
        this.count = 0
      });
}
