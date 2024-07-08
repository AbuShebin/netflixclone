import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixclone/domain/core/failures/main_failures.dart';
import 'package:netflixclone/domain/downloads/i_downloads_repo.dart';
import 'package:netflixclone/domain/downloads/models/downloads.dart';
import 'package:netflixclone/domain/search/models/search_response/search_response.dart';
import 'package:netflixclone/domain/search/search_service.dart';
import 'package:netflixclone/infrastructure/downloads/downloads_repository.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;

  SearchBloc(this._downloadsService, this._searchService)
      : super(SearchState.initial()) {
    ///idle state
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(
          SearchState(
              SearchResultList: [],
              idleList: state.idleList,
              isLoading: false,
              isError: false),
        );
        return;
      }

      emit(
        SearchState(
            SearchResultList: [],
            idleList: [],
            isLoading: true,
            isError: false),
      );

      final _result = await _downloadsService.getDownloadsImages();
      final _state = _result.fold((MainFailures f) {
        return const SearchState(
            SearchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (List<Downloads> list) {
        return SearchState(
            SearchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false);
      });

      emit(_state);
    });

    ///search result state
    on<SearchMovie>((event, emit) async {
      emit(
        SearchState(
            SearchResultList: [],
            idleList: [],
            isLoading: true,
            isError: false),
      );

      final _result =
          await _searchService.searchMoviews(movieQuery: event.movieQuery);

      final _statek = _result.fold(
        (MainFailures l) {
          return SearchState(
              SearchResultList: [],
              idleList: [],
              isLoading: false,
              isError: true);
        },
        (SearchResponse r) {
          return SearchState(
              SearchResultList: r.results,
              idleList: [],
              isLoading: false,
              isError: false);
        },
      );

      ///show to ui
      emit(_statek);
    });
  }
}
