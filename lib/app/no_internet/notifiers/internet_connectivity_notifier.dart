import 'package:flaury_business/services/concetivity_check_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum ConnectivityStatus {
  disconnected,
  connected,
}

class InternetConnectivityNotifier extends StateNotifier<ConnectivityStatus> {
  final ConnectivityCheckService _connectivityCheckService;
  InternetConnectivityNotifier(this._connectivityCheckService)
      : super(ConnectivityStatus.disconnected) {
    initalize();
  }

  void initalize() {
    _connectivityCheckService.connectionChange.listen((isconnected) {
      state = isconnected
          ? ConnectivityStatus.connected
          : ConnectivityStatus.disconnected;
    });
  }
}
