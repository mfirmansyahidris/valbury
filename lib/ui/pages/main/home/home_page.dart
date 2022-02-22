import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_klink_sehat/ui/ui.dart';

class HomePage extends StatefulWidget {
  final Function(int)? switchToPage;
  const HomePage({Key? key, this.switchToPage}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Strings.get.appName,
            style: TextStyles.h6.copyWith(
              color: Palette.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.notifications)
            )
          ],
          leading: IconButton(
            onPressed: (){
              SystemChannels.platform
                  .invokeMethod('SystemNavigator.pop');
            },
            icon: const Icon(Icons.close)
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: Strings.get.home,),
              Tab(text: Strings.get.history,),
            ],
          ),
        ),
        backgroundColor: Palette.background,
        body: TabBarView(
          children: [
            HomePageComponent(switchToPage: widget.switchToPage,),
            const HistoryPageComponent(),
          ],
        ),
      ),
    );
  }
}
