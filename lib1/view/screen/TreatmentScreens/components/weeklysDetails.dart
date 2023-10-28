import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class WeekLyDetailsScreenActivity extends StatelessWidget {
  const WeekLyDetailsScreenActivity({super.key});

  @override
  Widget build(BuildContext context) {
    double progressValue = 50;
    return Container(
      height: 50.w,
      // width: 100.w,
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
                markerWidth: 22,
                markerHeight: 22,
              )
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                positionFactor: 0,
                widget: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(" 1:15:00",
                          style: AppStyles.onboardsubtitle.copyWith(
                              fontSize: 18.sp, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 1.h,
                      ),
                      // Text(
                      //   progressValue.toStringAsFixed(0) + ' Kg',
                      // ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      SizedBox(
                        width: 15.w,
                        child: Center(
                          child: Text("Left of 3 hours",
                              maxLines: 2,
                              style: AppStyles.onboardsubtitle
                                  .copyWith(fontSize: 16.sp)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ]),
    );
  }
}
