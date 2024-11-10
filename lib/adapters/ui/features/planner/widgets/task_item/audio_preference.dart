import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';

class AudioPreference extends StatefulWidget {
  final String text;
  final bool isVisible;

  const AudioPreference({
    super.key,
    required this.text,
    required this.isVisible,
  });

  @override
  State<AudioPreference> createState() => _AudioPreferenceState();
}

class _AudioPreferenceState extends State<AudioPreference> {
  final FlutterTts flutterTts = FlutterTts();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    flutterTts.setLanguage("es-ES");
  }

  Future<void> _togglePlayPause() async {
    isPlaying ? await flutterTts.stop() : flutterTts.speak(widget.text);
    setState(() => isPlaying = !isPlaying);
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisible,
      child: Container(
        height: hJM(9),
        width: wJM(60),
        padding: EdgeInsets.symmetric(horizontal: wJM(2)),
        decoration: BoxDecoration(
          borderRadius: CommonTheme.defaultCardRadius,
          border: Border.all(color: CommonTheme.secondaryColorLight, width: 2.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(color: CommonTheme.thirdColor, shape: BoxShape.circle),
              child: IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  size: hJM(4),
                  color: CommonTheme.statusBarColor,
                ),
                onPressed: _togglePlayPause,
              ),
            ),
            SizedBox(
              width: wJM(40),
              child: Text(
                widget.text,
                style: CommonTheme.bodySmallStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: CommonTheme.statusBarColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
