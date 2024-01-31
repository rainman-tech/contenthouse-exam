import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_exam/core/app/view.dart' as base;
import 'package:mobile_exam/screens/exam/bloc.dart';
import 'package:mobile_exam/screens/exam/cubit.dart';

class ViewState extends base.ViewState {
  @override
  Widget content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Image.network(context.bloc.response.image ?? ""),
          const SizedBox(
            height: 15,
          ),
          Text(context.bloc.response.message ?? ""),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return Center(
                child: Text(
                  state.toString(),
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
            },
            child: const Text("Add count"),
          ),
        ],
      ),
    );
  }
}
