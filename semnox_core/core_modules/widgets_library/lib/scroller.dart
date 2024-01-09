library vs_scrollbar;

import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';

class Scroller extends StatefulWidget {
  const Scroller({
    Key? key,
    required this.child,
    this.controller,
  }) : super(key: key);

  final Widget child;
  final ScrollController? controller;

  @override
  ScrollbarState createState() => ScrollbarState();
}

class ScrollbarState extends State<Scroller> {
  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return
      RawScrollbar(
      controller: widget.controller,
      thickness: 16,
      trackVisibility: true,
      trackBorderColor: theme.scrollBarHandle,
      trackColor: theme.scrollArea,
      thumbColor: theme.scrollBarHandle,
      thumbVisibility: true,
      radius: const Radius.circular(4),
      interactive: true,
      mainAxisMargin: 4,
      crossAxisMargin: 4,
      child: widget.child,
    );
  }
}


/*
library vs_scrollbar;

import 'package:flutter/material.dart';
import 'package:widgets_library/draggable_srollbar.dart';

class Scroller extends StatefulWidget {
  Scroller({
    Key? key,
    required this.child,
    this.controller,
    this.scrollDirection,
  }) : super(key: key);
  final Widget child;
  ScrollController? controller;
  final Axis? scrollDirection;

  @override
  State<Scroller> createState() => _ScrollerState();
}

class _ScrollerState extends State<Scroller> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: DraggableScrollbar(
          controller: widget.controller!,
          scrollDirection: widget.scrollDirection,
          widthScrollThumb: 20,
          thumbColor: Colors.grey,
          radiusScrollThumb: 5,
          child: widget.child,
        ),
      ),
    );
  }
}


class HorizontalScrollScreen extends StatefulWidget {
  HorizontalScrollScreen({super.key});

  @override
  State<HorizontalScrollScreen> createState() => _HorizontalScrollScreenState();
}

class _HorizontalScrollScreenState extends State<HorizontalScrollScreen> {
  final ScrollController controllerHorizontal = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('horizontal Scrollbar'),
      ),
      body: Center(
        child: SizedBox(
            height: 300,
            width: 310,
            child: DraggableScrollbar(
              controller: controllerHorizontal,
              scrollDirection: Axis.horizontal,
              widthScrollThumb: 20,
              thumbColor: Colors.grey,
              child: ListView.builder(
                  controller: controllerHorizontal,
                  scrollDirection: Axis.horizontal,
                  itemCount:8,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(2) ,
                      height: 100,
                      width: 100,
                      color: Colors.yellow[index % 9 * 100],
                      child: Center(child: Text(index.toString())),
                    );
                  }),
            )),
      ),
    );
  }
}


class HorizontalGrid extends StatefulWidget {
  HorizontalGrid({super.key});

  @override
  State<HorizontalGrid> createState() => _HorizontalGridState();
}

class _HorizontalGridState extends State<HorizontalGrid> {
  ScrollController controllerHorizontal = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal Grid Scrollbar'),
      ),
      body: Center(
        child: SizedBox(height: 400,
          width: 350,
          child: DraggableScrollbar(
            controller: controllerHorizontal,
            scrollDirection: Axis.horizontal,
            widthScrollThumb: 20,
            thumbColor: Colors.grey,
            child: GridView.builder(
              controller: controllerHorizontal,
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount:8,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  width: 100,
                  color: Colors.cyan[index % 9 * 100],
                  child: Center(child: Text(index.toString())),
                );
              },
            ),
          ),
        ),
      ),
    );

  }
}

class VerticalGrid extends StatefulWidget {
  VerticalGrid({super.key});

  @override
  State<VerticalGrid> createState() => _VerticalGridState();
}

class _VerticalGridState extends State<VerticalGrid> {
  ScrollController controllerVertical = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vertcal Grid Scrollbar'),
      ),
      body: Center(
        child: SizedBox(height: 400,
          width: 350,
          child: DraggableScrollbar(
            controller: controllerVertical,
            scrollDirection: Axis.vertical,
            widthScrollThumb: 20,
            thumbColor: Colors.grey,
            child: GridView.builder(
              controller: controllerVertical,
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount:8,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  width: 100,
                  color: Colors.cyan[index % 9 * 100],
                  child: Center(child: Text(index.toString())),
                );
              },
            ),
          ),
        ),
      ),
    );

  }
}

class ListViewScrollScreen extends StatefulWidget {
  ListViewScrollScreen({super.key});

  @override
  State<ListViewScrollScreen> createState() => _ListViewScrollScreenState();
}

class _ListViewScrollScreenState extends State<ListViewScrollScreen> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListViewScrollScreen'),
        ),
        body:DraggableScrollbar(
          controller: controller,
          scrollDirection: Axis.vertical,
          widthScrollThumb: 20,
          thumbColor: Colors.grey,
          child: ListView(
            controller: controller,
            children:
            List.generate(10, (index) => Container(
              margin: const EdgeInsets.all(10) ,
              height: 100,
              width: 100,
              color: Colors.cyan[index % 9* 100],
              child: Center(child: Text(index.toString())),
            )),

          ),
        )
    );
  }
}
*/
