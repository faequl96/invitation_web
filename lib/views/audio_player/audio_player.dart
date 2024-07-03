import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/view_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';

class AudioPlayerWidget extends StatelessWidget with GetItMixin {
  AudioPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();
    watchOnly((ViewModel x) => x.swipeUpViewState);
    watchOnly((ViewModel x) => x.isCompleted);

    if (vM.isCompleted) {
      if (vM.sV < 1) {
        return StreamBuilder<PlayerState>(
          stream: vM.player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;

            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering ||
                processingState == null) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  width: s(vM.w, 24, 26, 28, 30),
                  height: s(vM.w, 24, 26, 28, 30),
                  child: const CircularProgressIndicator(
                    color: Color.fromARGB(240, 255, 204, 192),
                  ),
                ),
              );
            } else if (playing != true) {
              return GestureDetector(
                onTap: vM.player.play,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 230, 211, 164),
                    border: Border.all(
                      width: 4,
                      color: const Color.fromARGB(240, 255, 204, 192),
                    ),
                  ),
                  child: Icon(Icons.play_arrow, size: s(vM.w, 24, 26, 28, 30)),
                ),
              );
            } else if (processingState != ProcessingState.completed) {
              return GestureDetector(
                onTap: vM.player.pause,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 230, 211, 164),
                    border: Border.all(
                      width: 4,
                      color: const Color.fromARGB(240, 255, 204, 192),
                    ),
                  ),
                  child: Icon(Icons.pause, size: s(vM.w, 24, 26, 28, 30)),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  vM.player.seek(Duration.zero);
                  print("tes");
                  vM.player.play();
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 230, 211, 164),
                    border: Border.all(
                      width: 4,
                      color: const Color.fromARGB(240, 255, 204, 192),
                    ),
                  ),
                  child: Icon(Icons.replay, size: s(vM.w, 24, 26, 28, 30)),
                ),
              );
            }
          },
        );
      } else {
        return const SizedBox.shrink();
      }
    } else {
      return const SizedBox.shrink();
    }
  }
}

class PlayWidget extends StatelessWidget {
  const PlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = locator<ViewModel>();

    return GestureDetector(
      onTap: vM.player.play,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(255, 230, 211, 164),
          border: Border.all(
            width: 4,
            color: const Color.fromARGB(240, 255, 204, 192),
          ),
        ),
        child: Icon(Icons.play_arrow, size: s(vM.w, 24, 26, 28, 30)),
      ),
    );
  }
}
