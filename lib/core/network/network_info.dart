import 'dart:async';
import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  Future<bool> execute() async {
    final InternetConnection customInstance =
    InternetConnection.createInstance(
      checkInterval: const Duration(seconds: 1),
    );
    // Simple check to see if we have Internet
    // ignore: avoid_log
    log('''The statement 'this machine is connected to the Internet' is: ''');
    bool isConnected = await customInstance.hasInternetAccess;
    // ignore: avoid_log
    log(
      isConnected.toString(),
    );
    // returns a bool
    // We can also get an enum instead of a bool
    // ignore: avoid_log
    log(
      'Current status: ${await customInstance.internetStatus}',
    );
    // logs either InternetConnectionStatus.connected
    // or InternetConnectionStatus.disconnected

    // actively listen for status updates
    final StreamSubscription<InternetStatus> listener =
        customInstance.onStatusChange.listen(
      (InternetStatus status) {
        switch (status) {
          case InternetStatus.connected:
            // ignore: avoid_log
            log('Data connection is available.');
            isConnected = true;
            break;
          case InternetStatus.disconnected:
            // ignore: avoid_log
            log('You are disconnected from the internet.');
            isConnected = false;
            break;
        }
      },
    );

    // close listener after 30 seconds, so the program doesn't run forever
    await Future<void>.delayed(const Duration(seconds: 1));
    await listener.cancel();
    return isConnected;
  }

  @override
  Future<bool> get isConnected => execute();
}
