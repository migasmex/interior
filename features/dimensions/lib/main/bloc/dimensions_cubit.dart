import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:dimensions/main/bloc/dimensions_state.dart';

class DimensionsCubit extends Cubit<DimensionsState> {
  DimensionsCubit() : super(DimensionsInitial());

  void checkDimensions(
      Room room, double itemLength, double itemWidth, double itemHeight) {
    final bool isFit = itemLength <= room.length &&
        itemWidth <= room.width &&
        itemHeight <= room.height;
    if (isFit) {
      emit(ItemFitState('ok'));
    } else {
      emit(ItemFitFailureState('not ok'));
    }
  }
}
