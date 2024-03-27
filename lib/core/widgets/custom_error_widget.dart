import 'package:daily_weather/core/widgets/spacers.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String error;
  final VoidCallback onRefresh;

  const CustomErrorWidget({
    super.key,
    required this.error,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onRefresh,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(error),
              hSpace(),
              const Icon(Icons.refresh),
            ],
          ),
        ),
      ),
    );
  }
}
