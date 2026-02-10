import 'package:flutter/material.dart';

import 'package:hive_ce_flutter/hive_flutter.dart';

import '/constants.dart';
import '/hive_model/chat_item_model.dart';
import '/hive_model/message_item_model.dart';
import '/hive_model/message_role_model.dart';
import '/page/chat_list_page/chat_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ChatItemModelAdapter());
  Hive.registerAdapter(MessageItemModelAdapter());
  Hive.registerAdapter(MessageRoleModelAdapter());
  await Hive.openBox<ChatItemModel>(kChatBox);
  await Hive.openBox<MessageItemModel>(kMessageBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ChatListPage(),
    );
  }
}
