import 'package:flutter/material.dart';
import 'package:platform_converter_app/provider/platform_change_controller.dart';
import 'package:provider/provider.dart';

import '../../android_ios_pages/add_screen.dart';
import '../../android_ios_pages/call_screen.dart';
import '../../android_ios_pages/chat_screen.dart';
import '../../android_ios_pages/setting_screen.dart';

class AndroidUi extends StatelessWidget {
  const AndroidUi({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Platform Converter'),
          actions: [
            Consumer<PlatformChangeProvider>(builder: (context, value, child) {
              return Switch(
                value: value.isIos,
                onChanged: (value) {
                  Provider.of<PlatformChangeProvider>(context, listen: false)
                      .toggleBetweenPlatforms();
                },
              );
            }),
          ],
          bottom: const TabBar(
            tabAlignment: TabAlignment.fill,
            indicatorPadding: EdgeInsets.zero,
            tabs: [
              Tab(
                child: Icon(Icons.account_circle),
              ),
              Tab(text: 'CHATS'),
              Tab(text: 'CALLS'),
              Tab(text: 'SETTINGS'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AddUsers(),
            ChatScreen(),
            CallScreen(),
            SettingScreen(),
          ],
        ),
      ),
    );
  }
}
