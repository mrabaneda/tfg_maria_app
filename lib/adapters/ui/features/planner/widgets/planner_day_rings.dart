import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';

class _PlannerDayRingsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double outerRadius = size.width / 4;
    double innerRadius = outerRadius / 1.4;

    Paint outerPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    Paint innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width / 4, size.height / 4), outerRadius, outerPaint);

    canvas.drawCircle(Offset(size.width / 4, size.height / 4), innerRadius, innerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class PlannerDayRings extends StatelessWidget {
  const PlannerDayRings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, _) {
        return SizedBox(
          height: hJM(30),
          width: wJM(10),
          child: CustomPaint(
            size: Size(hJM(6), hJM(6)),
            painter: _PlannerDayRingsPainter(),
          ),
        );
      },
    );
  }
}
