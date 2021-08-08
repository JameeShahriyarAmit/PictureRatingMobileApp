//! This class is fully given. Do nothing on it.
//! It is a generic class for the View component of the MVVM architectural pattern.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/viewmodel.dart';

class View extends StatelessWidget {
  final Widget Function(BuildContext context, Viewmodel viewmodel, Widget child)
      _builder;

  final Widget Function(BuildContext context, Viewmodel viewmodel)
      _progressBuilder;
  final Viewmodel _viewmodel;

  const View({@required builder, @required viewmodel, progressBuilder})
      : _builder = builder,
        _viewmodel = viewmodel,
        _progressBuilder = progressBuilder;

  Widget _baseBuilder(BuildContext context, Viewmodel viewmodel, Widget child) {
    if (viewmodel.busy) {
      if (_progressBuilder != null) return _progressBuilder(context, viewmodel);
      return Center(
        child: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return _builder(context, viewmodel, child);
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: _viewmodel,
        child: Consumer<Viewmodel>(builder: _baseBuilder),
      );
}
