import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:template_package/locale/translations.dart';

class LoaderDefault extends StatelessWidget {
  final double? size;
  final Color? baseColor;
  final Color? highlightColor;
  final Duration? period;

  const LoaderDefault({Key? key, this.size, this.baseColor, this.highlightColor, this.period})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
        period: period ?? Duration(milliseconds: 2300),
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.centerRight, colors: <Color>[
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.background,
          Theme.of(context).colorScheme.primary
        ], stops: const <double>[
          0.50,
          0.55,
          0.58
        ]),
        child: Text(Translations.of(context)!.text('app_name')));
  }
}
