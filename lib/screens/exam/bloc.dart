export 'package:provider/provider.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/bloc.dart' as base;
import 'package:mobile_exam/core/model/response.dart';
import 'package:mobile_exam/core/services/server.dart';

import 'views/main.dart' as main_view;
import 'views/loading.dart' as loading_view;
import 'views/error.dart' as error_view;

extension Extension on BuildContext {
  Bloc get bloc => read<Bloc>();
}

class Bloc extends base.Bloc {
  Bloc(BuildContext context)
      : super(loading_view.ViewState(), context: context);

  late final Server service;
  late Response response;

  @override
  void init() async {
    service = context.server;

    response = Response.fromMap(await service.data);
    if (response.statusCode == HttpStatus.ok) {
      emit(main_view.ViewState());
    } else {
      emit(error_view.ViewState());
    }
  }
}
