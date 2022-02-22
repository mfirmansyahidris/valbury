import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:valbury/ui/ui.dart';

class Parent extends StatefulWidget {
  final Widget? child;
  final PreferredSize? appBar;
  final bool avoidBottomInset;
  final Widget? floatingButton;
  final Widget? bottomNavigation;
  final Widget? drawer;
  final Widget? endDrawer;
  final Key? scaffoldKey;
  final bool extendBodyBehindAppBar;
  final Color? backgroundColor;

  const Parent({
    Key? key,
    this.child,
    this.appBar,
    this.avoidBottomInset = true,
    this.floatingButton,
    this.bottomNavigation,
    this.drawer,
    this.scaffoldKey,
    this.endDrawer,
    this.extendBodyBehindAppBar = false,
    this.backgroundColor,
  }) : super(key: key);

  @override
  _ParentState createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: widget.scaffoldKey,
        resizeToAvoidBottomInset: widget.avoidBottomInset,
        backgroundColor: widget.backgroundColor ?? Palette.background,
        extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
        appBar: widget.appBar ??
            PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: AppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarBrightness: Brightness.light,
                ),
                elevation: 0,
                toolbarHeight: 0,
              ),),
        body: widget.child,
        drawer: widget.drawer,
        endDrawer: widget.endDrawer,
        floatingActionButton: widget.floatingButton,
        bottomNavigationBar: widget.bottomNavigation,
      ),
    );
  }
}
