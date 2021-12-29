// ignore: import_of_legacy_library_into_null_safe
import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImplementation implements NetworkInfo {
  final DataConnectionChecker dataConnectionChecker;

  NetworkInfoImplementation(this.dataConnectionChecker);

  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
