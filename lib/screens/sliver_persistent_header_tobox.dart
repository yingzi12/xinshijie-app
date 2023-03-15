import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'extra_info_constraints.dart';

typedef SliverPersistentHeaderToBoxBuilder = Widget Function(
  BuildContext context,
  double maxExtent,
  bool fixed,
);
//自定义一个 SliverPersistentHeaderToBox，它可以将任意 RenderBox 适配为可以固定到顶部的 Sliver 而不用显式指定高度
//SliverPersistentHeaderToBox传递给 child 的约束中的额外信息是一个 bool 类型，表示是否已经固定到顶部。
class SliverPersistentHeaderToBox extends StatelessWidget {
  // 默认构造函数，直接接受一个 widget，不用显式指定高度
  SliverPersistentHeaderToBox({
    Key? key,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        super(key: key);
  // builder 构造函数，需要传一个 builder，同样不需要显式指定高度
  SliverPersistentHeaderToBox.builder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final SliverPersistentHeaderToBoxBuilder builder;

  @override
  Widget build(BuildContext context) {
    return _SliverPersistentHeaderToBox(
      // 通过 LayoutBuilder接收 Sliver 传递给子组件的布局约束信息
    child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return builder(
            context,
            constraints.maxHeight,
            //约束中需要传递的额外信息是一个bool类型，表示 Sliver 是否已经固定到顶部
            (constraints as ExtraInfoBoxConstraints<bool>).extra,
          );
        },
      ),
    );
  }
}

class _SliverPersistentHeaderToBox extends SingleChildRenderObjectWidget {
  const _SliverPersistentHeaderToBox({
    Key? key,
    Widget? child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderSliverPersistentHeaderToBox();
  }
}
/**
 * constraints.scrollOffset 不为 0 时，则表示已经固定到顶部了。
    我们在布局阶段拿到子组件的 size 信息，然后通过通过子组件的大小来确定 Sliver 大小（设置geometry）。 这样就不再需要我们显式传高度值了。
    我们通过给 paintOrigin 设为 0 来实现顶部固定效果；不固定到顶部时应该传 - constraints.scrollOffset，这个需要读者好好体会一下，也可以运行示例修改一下参数值来看看效果。
    必须要重写 childMainAxisPosition ，否则事件便会失效，该方法的返回值在“点击测试”中会用到。关于点击测试我们会在本书面介绍， 读者现在只需要知道该函数应该返回 paintOrigin 的位置即可。
 */
class _RenderSliverPersistentHeaderToBox extends RenderSliverSingleBoxAdapter {
  @override
  void performLayout() {
    if (child == null) {
      geometry = SliverGeometry.zero;
      return;
    }
    child!.layout(
      ExtraInfoBoxConstraints(
        // 只要constraints.scrollOffset不为0，则表示已经有内容在当前Sliver下面了（重叠了）
        constraints.scrollOffset != .0,
        constraints.asBoxConstraints(
          // 我们将剩余的可绘制空间作为 header 的最大高度约束传递给 LayoutBuilder
          maxExtent: constraints.remainingPaintExtent,
        ),
      ),
      //我们要根据child大小来确定Sliver大小，所以后面需要用到child的size信息
      parentUsesSize: true,
    );
    // 子节点 layout 后就能获取它的大小了
    double childExtent;
    switch (constraints.axis) {
      case Axis.horizontal:
        childExtent = child!.size.width;
        break;
      case Axis.vertical:
        childExtent = child!.size.height;
        break;
    }

    geometry = SliverGeometry(
      scrollExtent: childExtent,
      paintOrigin: 0, // 固定，如果不想固定应该传 - constraints.scrollOffset
      paintExtent: childExtent,
      maxPaintExtent: childExtent,
    );
  }

  // 重要，如果没有重写则不会响应事件，点击测试中会用到。关于点击测试我们会在本书面介绍,
  // 读者现在只需要知道该函数应该返回 paintOrigin 的位置即可。
  @override
  double childMainAxisPosition(RenderBox child) => 0.0;
}
