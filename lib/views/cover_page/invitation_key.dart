import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:invitation_web/view_model.dart';
import 'package:just_audio/just_audio.dart';

class InvitationKey extends StatelessWidget {
  const InvitationKey({super.key, required this.onOpened});

  final Function() onOpened;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: locator<ViewModel>().player.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;

        if (processingState == ProcessingState.loading ||
            processingState == ProcessingState.buffering ||
            processingState == null) {
          return const SizedBox.shrink();
        } else if (playing != true) {
          return GestureDetector(
            onTap: () async {
              onOpened();
              await Future.delayed(const Duration(seconds: 2));
              locator<ViewModel>().player.play();
            },
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  width: 160,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(200, 255, 212, 102),
                        Color.fromARGB(240, 255, 198, 192),
                      ],
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Buka Undangan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (processingState != ProcessingState.completed) {
          return const SizedBox.shrink();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
