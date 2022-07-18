import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temporizador_app/bloc/timer_bloc.dart';

class ActionsApp extends StatelessWidget {
  const ActionsApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (state is TimerInitial) ...[
              FloatingActionButton(
                backgroundColor: const Color(0xFF0876DD),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
                onPressed: () =>
                    context.read<TimerBloc>().add(TimerStarted(state.duration)),
              ),
            ],
            if (state is TimerRunInProgress) ...[
              FloatingActionButton(
                backgroundColor: const Color(0xFF0876DD),
                child: const Icon(
                  Icons.pause,
                  color: Colors.white,
                ),
                onPressed: () =>
                    context.read<TimerBloc>().add(const TimerPaused()),
              ),
              FloatingActionButton(
                backgroundColor: const Color(0xFF0876DD),
                child: const Icon(
                  Icons.replay,
                  color: Colors.white,
                ),
                onPressed: () =>
                    context.read<TimerBloc>().add(const TimerReset()),
              ),
            ],
            if (state is TimerRunPause) ...[
              FloatingActionButton(
                backgroundColor: const Color(0xFF0876DD),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
                onPressed: () =>
                    context.read<TimerBloc>().add(const TimerResumed()),
              ),
              FloatingActionButton(
                backgroundColor: const Color(0xFF0876DD),
                child: const Icon(Icons.replay),
                onPressed: () =>
                    context.read<TimerBloc>().add(const TimerReset()),
              ),
            ],
            if (state is TimerRunComplete) ...[
              FloatingActionButton(
                backgroundColor: const Color(0xFF0876DD),
                child: const Icon(
                  Icons.replay,
                  color: Colors.white,
                ),
                onPressed: () =>
                    context.read<TimerBloc>().add(const TimerReset()),
              ),
            ]
          ],
        );
      },
    );
  }
}
