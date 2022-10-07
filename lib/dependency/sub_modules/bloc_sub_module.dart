import 'package:flutter_app_template/core/models/celebrated.dart';
import 'package:flutter_app_template/dependency/sub_modules/ebr_sub_module.dart';
import 'package:flutter_app_template/dependency/sub_modules/use_case_sub_module.dart';
import 'package:flutter_app_template/features/choose_relation_type/choose_relation_type_bloc.dart';
import 'package:flutter_app_template/features/friend_birthday_data/friend_birthday_data_bloc.dart';
import 'package:flutter_app_template/features/friend_name/friend_name_bloc.dart';
import 'package:flutter_app_template/features/friend_profile/friend_profile_bloc.dart';
import 'package:flutter_app_template/features/intro/intro_bloc.dart';
import 'package:flutter_app_template/features/personalities/personalities_bloc.dart';
import 'package:template_package/template_package.dart';

import 'core_sub_module.dart';

class BlocSubModule extends ISubModule {
  late CoreSubModule _coreSubModule;
  late UseCaseSubModule _useCaseSubModule;
  late EBRSubModule _ebrSubModule;

  @override
  init(List<ISubModule> subModules) {
    _coreSubModule = subModules.singleWhere((element) => element is CoreSubModule) as CoreSubModule;
    _useCaseSubModule = subModules.singleWhere((element) => element is UseCaseSubModule) as UseCaseSubModule;
    _ebrSubModule = subModules.singleWhere((element) => element is EBRSubModule) as EBRSubModule;
  }

  IntroBloc introBloc() => IntroBloc(_coreSubModule.analytics(), _coreSubModule.packageInfoWrapper());

  FriendNameBloc friendNameBloc() => FriendNameBloc(_coreSubModule.analytics());

  FriendBirthdayDateBloc friendBirthdayDataBloc() => FriendBirthdayDateBloc(_coreSubModule.analytics());

  PersonalitiesBloc personalitiesBloc(Celebrated friend) => PersonalitiesBloc(_coreSubModule.analytics(), friend);

  FriendProfileBloc friendProfileBloc(Celebrated friend) => FriendProfileBloc(
        _coreSubModule.analytics(),
        aiRequestUseCase: _useCaseSubModule.aiRequestUseCase(),
        friend: friend,
        aiPromptEbr: _ebrSubModule.aiPromptEBR(),
        abstractAds: _coreSubModule.ads(),
      );

  ChooseRelationTypeBloc chooseRelationTypeBloc(Celebrated friend) =>
      ChooseRelationTypeBloc(_coreSubModule.analytics(), friend: friend);
}
