import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingView extends StatelessWidget {
  final bool isVisible;
  const LoadingView({Key? key, required this.isVisible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Visibility(visible: isVisible, child: CircularProgressIndicator()),
    );
  }
}
