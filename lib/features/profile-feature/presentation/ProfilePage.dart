// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:koinonia/features/profile-feature/domain/entity/UserEntity.dart';
import 'package:koinonia/features/profile-feature/presentation/View/UserViewModel.dart';
import 'package:koinonia/injection_container.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// ignore: must_be_immutable
class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);

  UserEntity? _cachedUser;

  void signOut() async {
    await Supabase.instance.client.auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => sl()..add(LoadUser()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          // ignore: unnecessary_null_comparison
          if (_cachedUser != null) {
            return buildUserProfile(context, UserLoaded(user: _cachedUser!));
          }
          if (state is UserLoaded) {
            _cachedUser = state.user;
            return buildUserProfile(context, state);
          }
          // Show loading or initial state
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildUserProfile(BuildContext context, UserLoaded state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 155,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.all(Radius.circular(25.9))),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Container(
                          width: 100,
                          height: 100,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.tertiary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: CircleAvatar(
                            // foregroundrImage:
                            // AssetImage('../assets/images/profile.jpeg'),
                            radius: 80,
                          ))),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.user.name, style: TextStyle(fontSize: 25.9)),
                        Text(state.user.associatedChurch,
                            style: TextStyle(fontSize: 16)),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.local_fire_department),
                                  Text(state.user.qtStreak.toString(),
                                      style: TextStyle(fontSize: 14))
                                ],
                              ),
                              Gap(70),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.local_fire_department),
                                  Text(state.user.brStreak.toString(),
                                      style: TextStyle(fontSize: 14))
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              signOut();
            },
            child: Text("Sign Out"),
          ),
        ],
      ),
    );
  }
}
