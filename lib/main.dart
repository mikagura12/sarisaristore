import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/localsource/localsource.dart';
import 'core/model/paninda.dart';
import 'core/repositories/paninda_repository.dart';
import 'feature/main_page/main_model.dart';
import 'feature/main_page/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ISariStoreLocalDataSource sariStoreLocalDataSource;
  ISariSariStoreRepository sariSariStoreRepository;
  MainModel mainModel;
  @override
  void initState() {
    print('------------- Initializing -------------');
    sariStoreLocalDataSource = SariStoreLocalDataSource();
    sariSariStoreRepository = SariSariStoreRepository(sariStoreLocalDataSource);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (_) => MainModel(sariSariStoreRepository),
        child: MainPage(),
      ),
    );
  }
}
