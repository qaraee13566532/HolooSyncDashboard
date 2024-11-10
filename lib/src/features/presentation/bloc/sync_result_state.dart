import 'package:flutter/material.dart';
import 'package:holoo_dashboard/src/features/domain/models/base_response.dart';

import '../../domain/models/sync.dart';

abstract class SyncResultState {
  const SyncResultState();
}

class InitSyncResultState extends SyncResultState {
  const InitSyncResultState();
}

class LoadingSyncResultState extends SyncResultState {
  const LoadingSyncResultState();
}

class SuccessSyncResultState extends SyncResultState {
  ApiResponse<SyncResponses>? response;

  SuccessSyncResultState();
}

class ErrorSyncResultState extends SyncResultState {
  final String errorMsg;
  final String errorCode;

  ErrorSyncResultState({required this.errorMsg, required this.errorCode});
}
