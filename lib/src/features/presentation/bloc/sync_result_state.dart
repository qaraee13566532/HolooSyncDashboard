import 'package:flutter/material.dart';
import 'package:holoo_dashboard/src/features/domain/models/base_response.dart';

import '../../domain/models/sync.dart';

abstract class SyncResultState {
  ApiResponse<SyncResponses>? response = ApiResponse<SyncResponses>();
  SyncResultState();
}

class InitSyncResultState extends SyncResultState {
  InitSyncResultState();
}

class LoadingSyncResultState extends SyncResultState {
  LoadingSyncResultState();
}

class SuccessSyncResultState extends SyncResultState {
  SuccessSyncResultState();
}

class ErrorSyncResultState extends SyncResultState {
  final String errorMsg;
  final String errorCode;

  ErrorSyncResultState({required this.errorMsg, required this.errorCode});
}
