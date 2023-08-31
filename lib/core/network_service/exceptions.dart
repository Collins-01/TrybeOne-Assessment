import 'network_service.dart';

///No Internet Connection
class NoInternetConnectionException extends Failure {
  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message => "No internet connection, please try again";

  @override
  String get title => "No Network";
}

class UserDefinedExceptions extends Failure {
  final String _title;
  final String _message;

  UserDefinedExceptions(this._title, this._message);
  @override
  String get message => _message;

  @override
  String get title => _title;
}
