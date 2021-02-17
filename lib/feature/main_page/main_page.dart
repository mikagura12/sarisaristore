import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarisaristore/core/model/paninda.dart';
import 'package:sarisaristore/core/widget/appbar/sliverappbar_widget.dart';
import 'package:sarisaristore/core/widget/component/responsive_container/responsive_widget.dart';
import 'package:sarisaristore/core/widget/content/content_container.dart';

import 'main_model.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainModel model;

  @override
  void didChangeDependencies() {
    model = Provider.of<MainModel>(
      context,
      listen: false,
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CustomResponsive(
      builder: (context, constraints) {
        return FutureProvider<List<Paninda>>(
          create: (_) => model.getItems(),
          initialData: [],
          child: Consumer<List<Paninda>>(
            builder: (_, data, __) {
              return Container(
                child: Column(
                  children: [
                    CustomSliverAppBar(constraints),
                    CustomContent(
                      constraints,
                      items: data,
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
