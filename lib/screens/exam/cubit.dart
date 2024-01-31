import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_exam/core/services/server.dart';

class CounterCubit extends Cubit<int> {
  final Server _server;

  CounterCubit(this._server) : super(_server.count);

  void increment() async {
    emit(await _server.addToCount(1));
  }
}
