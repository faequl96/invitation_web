import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/view_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class AudioPlayerWidget extends WatchingWidget {
  const AudioPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = di<ViewModel>();
    watchPropertyValue((ViewModel x) => x.swipeUpViewState);
    watchPropertyValue((ViewModel x) => x.isCompleted);

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
                    color: const Color.fromARGB(255, 255, 250, 230),
                    border: const GradientBoxBorder(
                      width: 4,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 230, 211, 164),
                          Color.fromARGB(255, 255, 198, 192),
                          Color.fromARGB(255, 230, 211, 164),
                          Color.fromARGB(255, 255, 198, 192),
                          Color.fromARGB(255, 230, 211, 164),
                        ],
                        stops: [0.1, 0.3, 0.5, 0.7, 0.9],
                      ),
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
                    color: const Color.fromARGB(255, 255, 250, 230),
                    border: const GradientBoxBorder(
                      width: 4,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 230, 211, 164),
                          Color.fromARGB(255, 255, 198, 192),
                          Color.fromARGB(255, 230, 211, 164),
                          Color.fromARGB(255, 255, 198, 192),
                          Color.fromARGB(255, 230, 211, 164),
                        ],
                        stops: [0.1, 0.3, 0.5, 0.7, 0.9],
                      ),
                    ),
                  ),
                  child: Icon(Icons.pause, size: s(vM.w, 24, 26, 28, 30)),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () async {
                  vM.player.seek(Duration.zero);
                  vM.player.pause();
                  vM.player.play();
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 255, 250, 230),
                    border: const GradientBoxBorder(
                      width: 4,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 230, 211, 164),
                          Color.fromARGB(255, 255, 198, 192),
                          Color.fromARGB(255, 230, 211, 164),
                          Color.fromARGB(255, 255, 198, 192),
                          Color.fromARGB(255, 230, 211, 164),
                        ],
                        stops: [0.1, 0.3, 0.5, 0.7, 0.9],
                      ),
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
    final ViewModel vM = di<ViewModel>();

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
