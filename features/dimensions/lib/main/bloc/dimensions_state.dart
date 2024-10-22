part of 'package:dimensions/main/bloc/dimensions_cubit.dart';

abstract class DimensionsState {}

class DimensionsInitial extends DimensionsState {}

class ItemFitState extends DimensionsState {
  final String message;

  ItemFitState(this.message);
}

class ItemFitFailureState extends DimensionsState {
  final String message;

  ItemFitFailureState(this.message);
}
