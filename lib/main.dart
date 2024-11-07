import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:holoo_dashboard/src/core/router/router.dart';
import 'package:holoo_dashboard/src/features/presentation/Pages/home_page.dart';
import 'package:holoo_dashboard/src/features/presentation/Pages/sync_result.dart';

import 'src/features/domain/models/base_response.dart';
import 'src/features/domain/models/user_token.dart';
import 'src/features/domain/models/sync.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
