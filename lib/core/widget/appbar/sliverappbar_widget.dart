import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarisaristore/core/widget/component/responsive_container/sizeinformation_model.dart';
import 'package:sarisaristore/feature/main_page/main_model.dart';

import 'component/searchbar_widget.dart';

class CustomSliverAppBar extends StatefulWidget {
  final SizeInformation constraints;

  CustomSliverAppBar(this.constraints);

  @override
  _CustomSliverAppBarState createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  MainModel provide;

  @override
  void didChangeDependencies() {
    provide = context.read<MainModel>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Image.asset(
          'assets/images/sliverappbar.jpg',
          width: widget.constraints.width,
          height: widget.constraints.height * .25,
          fit: BoxFit.cover,
        ),
        Positioned(
          child: CustomSearchBar(
            widget.constraints,
            onChanged: (searchText) {
              provide.searchProduct(searchText);
            },
          ),
          bottom: -15,
          left: (widget.constraints.width * .15),
        ),
      ],
    );
  }
}
