import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:uboat_course_calculator/src/domain/entities/course_parameters.dart';
import 'package:uboat_course_calculator/src/domain/enums/scope.dart' as scope;
import 'package:uboat_course_calculator/src/domain/repositories/course_parameters_repository.dart';
import 'package:uboat_course_calculator/src/presentation/ui/bottom_navigation_view/cubit/course_calculator_event.dart';
import 'package:uboat_course_calculator/src/utils/object_extensions.dart';

part 'course_calculator_state.dart';

part 'course_calculator_cubit.freezed.dart';

@injectable
class CourseCalculatorCubit extends Cubit<CourseCalculatorState>
    with BlocPresentationMixin<CourseCalculatorState, CourseCalculatorEvent> {
  CourseCalculatorCubit(this._courseParametersRepository) : super(const CourseCalculatorState());

  final CourseParametersRepository _courseParametersRepository;

  Future<void> onCalculatePressed() async {
    (await _courseParametersRepository.courseParameters).getOrNull()?.let((it) {
      emit(
        state.copyWith(
          distance: it.distance,
          scope: it.scope,
          scale: it.periscopeScaleValue,
          boatLength: it.boatLength,
        ),
      );
      emitPresentation(
        CalculateEvent(
          CourseParameters(
            distance: it.distance,
            scope: it.scope,
            periscopeScaleValue: it.periscopeScaleValue,
            boatLength: it.boatLength,
          ),
        ),
      );
    });
  }
}
