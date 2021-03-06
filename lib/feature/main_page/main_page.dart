import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarisaristore/core/constant/font.dart';
import 'package:sarisaristore/core/widget/appbar/sliverappbar_widget.dart';
import 'package:sarisaristore/core/widget/content/content_container.dart';
import 'package:sarisaristore/core/widget/responsive_container/responsive_widget.dart';

import 'main_model.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainModel provide;

  @override
  void didChangeDependencies() {
    provide = Provider.of<MainModel>(
      context,
      listen: false,
    );
    provide.getItems();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CustomResponsive(
      builder: (context, constraints) {
        return Consumer<MainModel>(
          builder: (_, data, __) {
            for (var item in data.tempSearch) {
              provide.categoryFilter(item);
            }
            return Container(
              child: Column(
                children: [
                  CustomSliverAppBar(constraints),
                  (data.tempSearch.isEmpty)
                      ? Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                strokeWidth: 3,
                              ),
                              /* SizedBox(
                                height: 10,
                              ),
                              RaisedButton(
                                onPressed: () => data.getItems(),
                                color: Colors.blueAccent,
                                child: Text(
                                  'Try Again',
                                  style: kBigFont(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ), */
                            ],
                          ),
                        )
                      : CustomContent(
                          constraints,
                          provide: data,
                        )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
