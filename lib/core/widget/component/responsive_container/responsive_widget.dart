import 'package:flutter/material.dart';
import 'package:sarisaristore/core/widget/component/responsive_container/sizeinformation_model.dart';

class CustomResponsive extends StatelessWidget {
  final Widget Function(BuildContext context, SizeInformation constraints)
      builder;
  final AppBar appBar;
  CustomResponsive({@required this.builder, this.appBar});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.of(context).orientation;

    SizeInformation information = SizeInformation(width, height, orientation);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: builder(context, information),
    );
  }
}
