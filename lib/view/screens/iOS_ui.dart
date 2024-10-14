import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/utils/tab_view_list.dart';
import 'package:provider/provider.dart';
import '../../provider/platform_change_controller.dart';
import '../../provider/platform_provider.dart';

class IosUi extends StatelessWidget {
  const IosUi({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Platform Converter'),
        trailing:
            Consumer<PlatformChangeProvider>(builder: (context, value, child) {
          return CupertinoSwitch(
            value: value.isIos,
            onChanged: (value) {
              Provider.of<PlatformChangeProvider>(context, listen: false)
                  .toggleBetweenPlatforms();
            },
          );
        }),
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_add),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone),
              label: 'Calls',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'Settings',
            ),
          ],
        ),
        tabBuilder: (context, index) => SafeArea(
          child: CupertinoPageScaffold(
            child: tabViewList[index],
          ),
        ),
      ),
    );
  }
}
