import 'package:flaury_business/services/connectivity_check_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final connectionProvider =
    StateNotifierProvider<InternetConnectivityNotifier, ConnectivityStatus>(
        (ref) {
  final internetService = ref.watch(internetConnectivityCheckerServiceProvider);
  return InternetConnectivityNotifier(internetService);
});

enum ConnectivityStatus {
  disconnected,
  connected,
}

class InternetConnectivityNotifier extends StateNotifier<ConnectivityStatus> {
  final ConnectivityCheckService _connectivityCheckService;
  InternetConnectivityNotifier(this._connectivityCheckService)
      : super(ConnectivityStatus.connected) {
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
