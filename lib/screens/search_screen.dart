import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/providers/authentication_provider.dart';
import 'package:chat_app/providers/chat_provider.dart';
import 'package:chat_app/resources/Strings.dart';
import 'package:chat_app/resources/theme.dart';
import 'package:chat_app/utils/RouteGenerator.dart';
import 'package:chat_app/utils/navigation_utils.dart';
import 'package:chat_app/widgets/circular_progress_indicator_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  Future<QuerySnapshot<Map<String, dynamic>>>? _filteredUsers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FloatingSearchBar(
            hint: Strings.searchContacts,
            hintStyle: MyTextStyles.formPlaceHolder.copyWith(
              fontSize: 18
            ),
            scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
            transitionDuration: const Duration(milliseconds: 800),
            transitionCurve: Curves.easeInOut,
            physics: const BouncingScrollPhysics(),
            queryStyle: TextStyle(
              color: MyColors.hintColor
            ),
            axisAlignment: 0.0,
            openAxisAlignment: 0.0,
            width: 600,
            debounceDelay: const Duration(milliseconds: 500),
            onQueryChanged: (query) {
              setState(() {
                _filteredUsers = ChatProvider.getUsersFromName(query: query);
              });
            },
          // Specify a custom transition to be used for
          // animating between opened and closed stated.
            backgroundColor: MyColors.containerColor,
            accentColor: MyColors.hintColor,
            transition: CircularFloatingSearchBarTransition(),
            actions: [
              FloatingSearchBarAction(
                showIfOpened: false,
                child: CircularButton(
                  icon: const Icon(Icons.perm_contact_cal_rounded),
                  onPressed: () {},
                ),
              ),
              FloatingSearchBarAction.searchToClear(
                showIfClosed: false,
              ),
            ],
            builder: (context, transition) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Material(
                  color: Colors.white,
                  elevation: 4.0,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: MyColors.containerColor,
                    child: FutureBuilder<QuerySnapshot<dynamic>>(
                      future: _filteredUsers,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicatorWidget();
                        } else {
                          if (snapshot.hasData) {
                            List<QueryDocumentSnapshot<dynamic>> _docs = snapshot.data!.docs;
                            List<UserModel?> _userModels = UserModel.decodeUsers(_docs);
                            _userModels.removeWhere((element) => element?.userId == AuthenticationProvider().currentUser?.uid );
                            if (_userModels.length> 0) {
                              return ListView.builder(
                                itemBuilder: (contextListView, index) {
                                  return ListTile(
                                    onTap: () async {
                                      NavigationUtils.showLoadingDialog(context);
                                      await ChatProvider.getRoomFromSearch(
                                        peerId: _userModels[index]?.userId ?? ""
                                      ).then((value) {
                                        Navigator.of(contextListView).pop();
                                        String _roomId;
                                        if (value.docs.isNotEmpty){
                                          Map<String, dynamic>? _documentData = value.docs.single.data();
                                          _roomId = _documentData[Strings.roomIdFirestore];
                                        }
                                        Navigator.of(contextListView).pushNamed(
                                            ROOM_PAGE,
                                            arguments: _userModels[index]
                                        );
                                      }
                                      );

                                    },
                                    leading: SizedBox(
                                      height: 45,
                                      width: 45,
                                      child: Image.asset(_userModels[index]?.imagePath ?? "assets/pp/no_photo.png")
                                    ),
                                    title: Text(
                                      _userModels[index]?.userName ?? Strings.nullSafetyUnknownUser,
                                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                        fontSize: 16
                                      ),
                                    )
                                  );
                                },
                                itemCount: _userModels.length
                              );
                            } else {
                              return Center(
                                child: Text(
                                  Strings.noContactFound
                                )
                              );
                            }
                          } else {
                            return Center(
                              child: Text(
                                  Strings.noContactFound
                              )
                            );
                          }
                        }
                      }
                    )
                  ),
                ),
              );
            },
          )
        ],
      )
    );
  }
}
