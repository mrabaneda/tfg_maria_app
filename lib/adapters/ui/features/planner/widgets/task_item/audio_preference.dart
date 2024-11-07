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
          color: CommonTheme.thirdColorLight,
          borderRadius: CommonTheme.defaultCardRadius,
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: CommonTheme.thirdColor,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(3), // Ajusta el tamaño del fondo alrededor del icono
              child: IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  size: hJM(4), // Tamaño del icono
                  color: Colors.white, // Cambia el color del icono si es necesario
                ),
                onPressed: _togglePlayPause,
              ),
            ),
            SizedBox(width: wJM(3)),
            SizedBox(
              width: wJM(45),
              child: Text(
                widget.text,
                style: CommonTheme.bodySmallStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: CommonTheme.darkButtonTextColor,
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
