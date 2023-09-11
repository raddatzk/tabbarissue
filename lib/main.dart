import 'package:flutter/material.dart';
import 'package:tabbarissue/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), bottom: const HomeTabBar()),
      body: child,
    );
  }
}

class HomeTabBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeTabBar({super.key});

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();

  @override
  Size get preferredSize => const Size.fromHeight(48.0);
}

class _HomeTabBarState extends State<HomeTabBar> with TickerProviderStateMixin<HomeTabBar> {
  late TabController _controller;
  final List<String> _tabs = ["Tab1", "Tab2"];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this)..addListener(() {
      if (_controller.index == _controller.length - 1 ||_controller.index == 0) {
        const NewTabRoute().go(context);
      } else {
        var tabName = _tabs[_controller.index - 1];
        TabRoute(tabName: tabName).go(context);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      controller: _controller,
      tabs: _tabs.map((tab) => Tab(child: Text(tab))).toList()..add(const Tab(child: Icon(Icons.add)))..insert(0, const Tab(child: Icon(Icons.add))),
    );
  }
}

class TabView extends StatelessWidget {
  const TabView({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}

class NewTabView extends StatelessWidget {
  const NewTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text("add"),
      onPressed: () {},
    );
  }
}
