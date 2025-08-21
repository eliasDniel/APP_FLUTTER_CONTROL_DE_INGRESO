import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../config/const/constantes.dart';

class Chart extends StatefulWidget {
  final List<double> values;
  final List<Color>? colors;
  final List<String>? labels;
  final String? centerLabel;
  const Chart({
    super.key,
    required this.values,
    this.colors,
    this.labels,
    this.centerLabel,
  });

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  static const List<Color> defaultColors = [
    Colors.purple, // primaryColor
    Colors.blue,
    Colors.orange,
    Colors.grey,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant Chart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.values != widget.values) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<PieChartSectionData> buildSections(double percent) {
    final colors = widget.colors ?? defaultColors;
    final int n = widget.values.length;
    double maxRadius = 25;
    double minRadius = 13;
    double radiusStep = n > 1 ? (maxRadius - minRadius) / (n - 1) : 0;

    return List.generate(n, (i) {
      final value = widget.values[i] * percent;
      return PieChartSectionData(
        color: colors[i % colors.length],
        value: value,
        showTitle: false,
        radius: maxRadius - i * radiusStep,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.values.fold<double>(0, (a, b) => a + b);
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return PieChart(
                PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: 70,
                  startDegreeOffset: -90,
                  sections: buildSections(_animation.value),
                ),
              );
            },
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: defaultPadding),
                Text(
                  total.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 0.5,
                  ),
                ),
                const SizedBox(height: 10),
                Text(widget.centerLabel ?? "de actividades"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
