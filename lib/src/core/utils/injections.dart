

import 'package:get_it/get_it.dart';

import '../../features/sync_result_injections.dart';
import '../network/dio_network.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initDioInjections();
  await initArticlesInjections();
}

Future<void> initDioInjections() async {
  DioNetwork.initDio();
}


