import 'package:flutter/material.dart';

class StretchableSliverAppBar extends StatefulWidget {
  const StretchableSliverAppBar({super.key});

  @override
  State<StretchableSliverAppBar> createState() =>
      _StretchableSliverAppBarState();
}

class _StretchableSliverAppBarState extends State<StretchableSliverAppBar> {
  bool _stretch = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              snap: true,
              pinned: true,
              floating: true,
              stretch: _stretch,
              expandedHeight: 142.0,
              leading: const Icon(Icons.abc),
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  // Calculate appbar collapse percentage
                  double collapseRatio =
                      (constraints.maxHeight - kToolbarHeight) /
                          (200.0 - kToolbarHeight);

                  return FlexibleSpaceBar(
                    titlePadding: EdgeInsets.only(
                      left: collapseRatio > 0.2 ? 18 : 56, // Adjust dynamically
                      bottom: 16,
                    ),
                    title: const Text('SliverAppBar'),
                    background: const FlutterLogo(),
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: index.isOdd ? Colors.white : Colors.black12,
                    height: 80.0,
                    child: Center(
                      child: Text(
                        '$index',
                        textScaler: const TextScaler.linear(5.0),
                      ),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
