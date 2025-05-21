import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnblocprovider/helper/lang_cache_helper.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  LocalCubit() : super(LocalInitial());

  Future<void> getSaveLanguage() async {
    final String? cachedLanguageCode =
        await LanguageCacheHelper().getCacheLanguageCode();
    emit(ChangeLocalState(locale: Locale(cachedLanguageCode??"en")));
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper().setCacheLanguageCode(languageCode);
    emit(ChangeLocalState(locale: Locale(languageCode)));
  }
}
