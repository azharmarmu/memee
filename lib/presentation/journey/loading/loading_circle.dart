import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:memee/presentation/core/constants/assets_constants.dart';

class LoadingCircle extends StatelessWidget {
  final double size;

  const LoadingCircle({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: FlareActor(
        Assets.loadingCircle,
        animation: 'load',
        snapToEnd: true,
      ),
    );
  }
}
