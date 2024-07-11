// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:netflixclone/application/downloads/downloads_bloc.dart' as _i5;
import 'package:netflixclone/application/hot_and_new/hot_and_new_bloc.dart'
    as _i10;
import 'package:netflixclone/application/search/search_bloc.dart' as _i11;
import 'package:netflixclone/domain/downloads/i_downloads_repo.dart' as _i3;
import 'package:netflixclone/domain/hot%20and%20new/hot_and_new_response/hot_and_new_service.dart'
    as _i8;
import 'package:netflixclone/domain/search/search_service.dart' as _i6;
import 'package:netflixclone/infrastructure/downloads/downloads_repository.dart'
    as _i4;
import 'package:netflixclone/infrastructure/hot_and_new/hot_and_new_implementation.dart'
    as _i9;
import 'package:netflixclone/infrastructure/search/search_implimentation.dart'
    as _i7;

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
    gh.factory<_i5.DownloadsBloc>(
        () => _i5.DownloadsBloc(gh<_i3.IDownloadsRepo>()));
    gh.lazySingleton<_i6.SearchService>(() => _i7.SearchImpl());
    gh.lazySingleton<_i8.HotAndNewService>(() => _i9.HotAndNewImplementation());
    gh.factory<_i10.HotAndNewBloc>(
        () => _i10.HotAndNewBloc(gh<_i8.HotAndNewService>()));
    gh.factory<_i11.SearchBloc>(() => _i11.SearchBloc(
          gh<_i3.IDownloadsRepo>(),
          gh<_i6.SearchService>(),
        ));
    return this;
  }
}
