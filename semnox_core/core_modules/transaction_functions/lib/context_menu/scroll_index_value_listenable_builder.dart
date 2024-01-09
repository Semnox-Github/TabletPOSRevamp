import 'package:flutter/cupertino.dart';

class ScrollIndexValueListenableBuilder<A, B, C, D, E, F, G, H, I, J> extends StatelessWidget {
  const ScrollIndexValueListenableBuilder({
    required this.first,
    required this.second,
    required this.third,
    required this.forth,
    required this.fifth,
    required this.sixth,
    required this.seventh,
    required this.eighth,
    required this.ninth,
    required this.tenth,
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final ValueNotifier<A> first;
  final ValueNotifier<B> second;
  final ValueNotifier<C> third;
  final ValueNotifier<D> forth;
  final ValueNotifier<E> fifth;
  final ValueNotifier<F> sixth;
  final ValueNotifier<G> seventh;
  final ValueNotifier<H> eighth;
  final ValueNotifier<I> ninth;
  final ValueNotifier<J> tenth;

  final Widget? child;
  final Widget Function(BuildContext context, A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, Widget? child) builder;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<A>(
        valueListenable: first,
        builder: (_, a, __) {
          return ValueListenableBuilder<B>(
              valueListenable: second,
              builder: (context, b, __) {
                return ValueListenableBuilder(
                    valueListenable: third,
                    builder: (context, c, __) {
                      return ValueListenableBuilder(
                          valueListenable: forth,
                          builder: (context, d, __) {
                            return ValueListenableBuilder(
                                valueListenable: fifth,
                                builder: (context, e, __) {
                                  return ValueListenableBuilder(
                                      valueListenable: sixth,
                                      builder: (context, f, __) {
                                        return ValueListenableBuilder(
                                            valueListenable: seventh,
                                            builder: (context, g, __) {
                                              return ValueListenableBuilder(
                                                  valueListenable: eighth,
                                                  builder: (context, h, __) {
                                                    return ValueListenableBuilder(
                                                        valueListenable: ninth,
                                                        builder: (context, i, __) {
                                                          return ValueListenableBuilder(
                                                              valueListenable: tenth,
                                                              builder: (context, j, __) {
                                                                return builder(context, a, b, c, d, e, f, g, h, i, j, child);
                                                              });
                                                        });
                                                  });
                                            });
                                      });
                                });
                          });
                    });
              });
        },
      );
}
