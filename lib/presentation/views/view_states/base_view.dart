// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget? child) builder;
  final Function(T)? onModelReady;
  final Function(T)? onModelDisposed;
  final T model;

  const BaseView({
    Key? key,
    required this.builder,
    this.onModelReady,
    this.onModelDisposed,
    required this.model,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  // We want to store the instance of the model in the state
  // that way it stays constant through rebuilds
  late T model;

  @override
  void initState() {
    model = widget.model;
    if (widget.onModelReady != null) widget.onModelReady!(model);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onModelDisposed != null) widget.onModelDisposed!(model);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
        // child: widget.child,
      ),
    );
  }
}
