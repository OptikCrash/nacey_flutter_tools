import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import '../nacey_flutter_tools.dart';

typedef NaceyBuilder<T> = T Function(BuildContext context, OS os);
typedef NaceyIndexBuilder<T> = T Function(
    BuildContext context, OS os, int index);

abstract class NaceyWidgetBase<M extends Widget, C extends Widget,
    F extends Widget> extends StatelessWidget {
  const NaceyWidgetBase({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (isFluent(context)) {
      return createFluentWidget(context);
    } else if (isCupertino(context)) {
      return createCupertinoWidget(context);
    } else if (isMaterial(context)) {
      return createMaterialWidget(context);
    } else {
      return throw UnsupportedError(
          'This os is not supported: $defaultTargetPlatform');
    }
  }

  M createMaterialWidget(BuildContext context);
  C createCupertinoWidget(BuildContext context);
  F createFluentWidget(BuildContext context);
}

class NaceyWidget extends NaceyWidgetBase<Widget, Widget, Widget> {
  final NaceyBuilder<Widget?>? material;
  final NaceyBuilder<Widget?>? cupertino;
  final NaceyBuilder<Widget?>? fluent;

  const NaceyWidget({Key? key, this.material, this.cupertino, this.fluent})
      : super(key: key);

  @override
  Widget createMaterialWidget(BuildContext context) {
    return material?.call(context, os(context)) ?? const SizedBox.shrink();
  }

  @override
  Widget createCupertinoWidget(BuildContext context) {
    return cupertino?.call(context, os(context)) ?? const SizedBox.shrink();
  }

  @override
  Widget createFluentWidget(BuildContext context) {
    return fluent?.call(context, os(context)) ?? const SizedBox.shrink();
  }
}
