import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BMIChart extends StatelessWidget {
  const BMIChart({
    super.key,
    required this.bmi,
  });

  final double bmi;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: 180.0,
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.black.withOpacity(0.8),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 4.0,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: SfRadialGauge(
        title: GaugeTitle(
          text: (bmi / 10000).toDouble().toStringAsFixed(1),
          textStyle: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 10,
            maximum: 40,
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: 10,
                endValue: 18.5,
                color: Colors.blue,
                label: 'Underweight',
                sizeUnit: GaugeSizeUnit.factor,
                labelStyle: const GaugeTextStyle(
                  fontSize: 10,
                ),
              ),
              GaugeRange(
                startValue: 18.5,
                endValue: 24.9,
                color: Colors.green,
                label: 'Normal',
                sizeUnit: GaugeSizeUnit.factor,
                labelStyle: const GaugeTextStyle(
                  fontSize: 10,
                ),
              ),
              GaugeRange(
                startValue: 25,
                endValue: 29.9,
                color: Colors.yellow,
                label: 'Overweight',
                sizeUnit: GaugeSizeUnit.factor,
                labelStyle: const GaugeTextStyle(
                  fontSize: 10,
                ),
              ),
              GaugeRange(
                startValue: 30,
                endValue: 34.9,
                color: Colors.orange,
                label: 'Obese',
                sizeUnit: GaugeSizeUnit.factor,
                labelStyle: const GaugeTextStyle(
                  fontSize: 10,
                ),
              ),
              GaugeRange(
                startValue: 35,
                endValue: 40,
                color: Colors.red,
                label: 'Extremely Obese',
                sizeUnit: GaugeSizeUnit.factor,
                labelStyle: const GaugeTextStyle(
                  fontSize: 10,
                ),
              ),
            ],
            pointers: <GaugePointer>[
              NeedlePointer(
                value: (bmi / 10000).toDouble(),
                needleColor: Colors.black,
                knobStyle: const KnobStyle(
                  color: Colors.grey,
                  knobRadius: 0.06,
                  sizeUnit: GaugeSizeUnit.factor,
                ),
                needleEndWidth: 4.0,
                needleStartWidth: 1.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
