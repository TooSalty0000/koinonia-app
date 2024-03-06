import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koinonia/features/profile-feature/domain/entity/UserEntity.dart';

import 'package:equatable/equatable.dart';
import 'package:koinonia/features/profile-feature/domain/usecases/UserUseCase.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {}

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final UserEntity user;

  const UserLoaded({required this.user});
}

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetCurrentUserUseCase getCurrentUserUseCase;

  UserBloc({required this.getCurrentUserUseCase}) : super(UserInitial()) {
    on<LoadUser>(_onLoadUser);
  }

  Future<void> _onLoadUser(LoadUser event, Emitter<UserState> emit) async {
    try {
      final user = await getCurrentUserUseCase.call();
      emit(UserLoaded(user: user!));
    } catch (e) {
      // Handle errors, possibly by emitting a UserError state
      if (kDebugMode) {
        print(e);
      } // Consider a more robust error handling strategy
    }
  }
}
