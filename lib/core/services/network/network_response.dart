class DataResponse<T> {
  NetworkStatus? status;
  T? data;
  String? message;

  DataResponse.loading(this.message) : status = NetworkStatus.loading;
  DataResponse.completed(this.data) : status = NetworkStatus.sucess;
  DataResponse.error(this.message) : status = NetworkStatus.error;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum NetworkStatus { loading, sucess, error }
