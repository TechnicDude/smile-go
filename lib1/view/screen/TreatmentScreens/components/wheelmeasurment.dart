import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class WeekLyDetailsmeasurmentScreenActivity extends StatelessWidget {
  final String title;

  const WeekLyDetailsmeasurmentScreenActivity({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    double progressValue = 40;
    return Center(
      child: Container(
        height: 18.w,
        width: 18.w,
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(3.w),
        ),
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
              minimum: 0,
              maximum: 100,
              showLabels: false,
              showTicks: false,
              startAngle: 270,
              endAngle: 270,
              radiusFactor: 0.8,
              axisLineStyle: AxisLineStyle(
                thickness: 0.2,
                color: AppColors.secondrycolors.withOpacity(.2),
                thicknessUnit: GaugeSizeUnit.factor,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                    value: progressValue,
                    width: 0.2,
                    sizeUnit: GaugeSizeUnit.factor,
                    cornerStyle: CornerStyle.startCurve,
                    gradient: SweepGradient(colors: <Color>[
                      AppColors.secondrycolors,
                      AppColors.secondrycolors
                    ], stops: <double>[
                      0.25,
                      0.75
                    ])),
                MarkerPointer(
                  value: progressValue,
                  markerType: MarkerType.circle,
                  color: AppColors.secondrycolors,
                  markerWidth: 12,
                  markerHeight: 12,
                )
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  positionFactor: 0,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(title,
                          style: AppStyles.onboardsubtitle.copyWith(
                              fontSize: 12.sp, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ]),
        ]),
      ),
    );
  }
}
