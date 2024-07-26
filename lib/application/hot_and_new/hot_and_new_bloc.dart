import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixclone/domain/core/failures/main_failures.dart';
import 'package:netflixclone/domain/hot%20and%20new/hot_and_new_response/hot_and_new_service.dart';
import 'package:netflixclone/domain/hot%20and%20new/hot_and_new_response/models/hot_and_new_rep.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;

  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    // Get hot and new movie data
    on<LoadDataInComingSoon>((event, emit) async {
      // Send loading state to UI
      emit(HotAndNewState(
        comingSoonList: [],
        everyoneIsWatchinList: [],
        isLoading: true,
        hasError: false,
      ));

      // Get data from remote
      final _result = await _hotAndNewService.getHotAndNewMovieData();

      // Data to state
      final newState = _result.fold(
        (MainFailures l) => HotAndNewState(
          comingSoonList: [],
          everyoneIsWatchinList: [],
          isLoading: false,
          hasError: true,
        ),
        (HotAndNewResponse r) => HotAndNewState(
          comingSoonList: r.results,
          everyoneIsWatchinList: state.everyoneIsWatchinList,
          isLoading: false,
          hasError: false,
        ),
      );

      emit(newState);
    });

    // Get hot and new TV data
    on<LoadDataInEveryOnesWatching>((event, emit) async {
      // Send loading state to UI
      emit(HotAndNewState(
        comingSoonList: [],
        everyoneIsWatchinList: [],
        isLoading: true,
        hasError: false,
      ));

      // Get data from remote
      final _result = await _hotAndNewService.getHotAndNEwTvData();

      print("result ---$_result");

      // Data to state
      final newState = _result.fold(
        (MainFailures l) => const HotAndNewState(
          comingSoonList: [],
          everyoneIsWatchinList: [],
          isLoading: false,
          hasError: true,
        ),
        (HotAndNewResponse r) => HotAndNewState(
          comingSoonList: state.comingSoonList,
          everyoneIsWatchinList: r.results,
          isLoading: false,
          hasError: false,
        ),
      );

      emit(newState);
    });
  }
}
