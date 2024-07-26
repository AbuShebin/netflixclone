// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:netflixclone/application/downloads/downloads_bloc.dart' as _i7;
import 'package:netflixclone/application/home_bloc/home_bloc.dart' as _i14;
import 'package:netflixclone/application/hot_and_new/hot_and_new_bloc.dart'
    as _i13;
import 'package:netflixclone/application/movieScreen_bloc/movie_screen_bloc.dart'
    as _i12;
import 'package:netflixclone/application/search/search_bloc.dart' as _i15;
import 'package:netflixclone/domain/downloads/i_downloads_repo.dart' as _i3;
import 'package:netflixclone/domain/hot%20and%20new/hot_and_new_response/hot_and_new_service.dart'
    as _i10;
import 'package:netflixclone/domain/movie%20details/movie_details_service.dart'
    as _i5;
import 'package:netflixclone/domain/search/search_service.dart' as _i8;
import 'package:netflixclone/infrastructure/downloads/downloads_repository.dart'
    as _i4;
import 'package:netflixclone/infrastructure/hot_and_new/hot_and_new_implementation.dart'
    as _i11;
import 'package:netflixclone/infrastructure/movie_details/movie_details_repository.dart'
    as _i6;
import 'package:netflixclone/infrastructure/search/search_implimentation.dart'
    as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.IDownloadsRepo>(() => _i4.DownloadsRepository());
    gh.lazySingleton<_i5.MovieDetailsService>(
        () => _i6.MovieDetailsRepository());
    gh.factory<_i7.DownloadsBloc>(
        () => _i7.DownloadsBloc(gh<_i3.IDownloadsRepo>()));
    gh.lazySingleton<_i8.SearchService>(() => _i9.SearchImpl());
    gh.lazySingleton<_i10.HotAndNewService>(
        () => _i11.HotAndNewImplementation());
    gh.factory<_i12.MovieScreenBloc>(
        () => _i12.MovieScreenBloc(gh<_i6.MovieDetailsRepository>()));
    gh.factory<_i13.HotAndNewBloc>(
        () => _i13.HotAndNewBloc(gh<_i10.HotAndNewService>()));
    gh.factory<_i14.HomeBloc>(() => _i14.HomeBloc(gh<_i10.HotAndNewService>()));
    gh.factory<_i15.SearchBloc>(() => _i15.SearchBloc(
          gh<_i3.IDownloadsRepo>(),
          gh<_i8.SearchService>(),
        ));
    return this;
  }
}
