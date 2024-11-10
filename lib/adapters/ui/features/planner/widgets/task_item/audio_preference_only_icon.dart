import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';

class AudioPreferenceOnlyIcon extends StatefulWidget {
  final String text;

  const AudioPreferenceOnlyIcon({
    super.key,
    required this.text,
  });

  @override
  State<AudioPreferenceOnlyIcon> createState() => _AudioPreferenceOnlyIconState();
}

class _AudioPreferenceOnlyIconState extends State<AudioPreferenceOnlyIcon> {
  final FlutterTts flutterTts = FlutterTts();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    flutterTts.setLanguage("es-ES");
    flutterTts.setSpeechRate(0.4);
    flutterTts.setCompletionHandler(() => setState(() => isPlaying = false));
  }

  Future<void> _togglePlayPause() async {
    isPlaying ? await flutterTts.stop() : await flutterTts.speak(widget.text);
    setState(() => isPlaying = !isPlaying);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CommonTheme.thirdColor,
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(3),
      child: IconButton(
        icon: Icon(
          isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
          size: hJM(4),
          color: Colors.black,
        ),
        onPressed: _togglePlayPause,
      ),
    );
  }
}
