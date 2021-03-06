import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/source/source.dart';
import 'core/repositories/paninda_repository.dart';
import 'feature/main_page/main_model.dart';
import 'feature/main_page/main_page.dart';
import 'package:flutter/services.dart';

//mikagura12 test
void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => MainModel(sariSariStoreRepository),
        child: MainPage(),
      ),
    );
  }
}
