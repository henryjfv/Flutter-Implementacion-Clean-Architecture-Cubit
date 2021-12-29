import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50.0,
        width: 50.0,
        child: LoadingIndicator(
          indicatorType: Indicator.ballRotateChase,
          colors: const [Colors.green],
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}
