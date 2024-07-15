import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Component/card_loading_shimmer.dart';
import 'package:emergency_alert/Provider/Profile/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SearchCommunityBottomSheet extends StatelessWidget {
  Function(dynamic)? onData;
  final String title;

  final serachTextController = TextEditingController();

  SearchCommunityBottomSheet({super.key, required this.title, this.onData});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 2,
      color: const Color(0xFF737373),
      //so you don't have to change MaterialApp canvasColor
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0))),
          child: Consumer<ProfileProvider>(builder: (context, providerData, _) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppSpaces.height8,
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Search and select city",
                          style: TextStyle(
                            color: AppColors.BLACK,
                            fontFamily: "Product Sans",
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close))
                      ],
                    ),
                  ),
                  TextFormField(
                    onChanged: (v) {
                      providerData.fetchSuggestions(v);
                    },
                  ),
                  Expanded(
                    flex: 7,
                    child: providerData.isLoadingLocation
                        ? const SizedBox(
                            height: 300,
                            child: CardLoadingShimmer(
                              numberOfCards: 3,
                            ))
                        : ListView.builder(
                            // physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: false,
                            itemCount: providerData.suggestions.length,
                            itemBuilder: (context, index) {
                              var result = providerData.suggestions[index];
                              return Column(
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.place,
                                        color: Colors.grey),
                                    onTap: () async {
                                      onData!(result);

                                      Navigator.pop(context);
                                    },
                                    title: Text(
                                      result["description"],
                                      style:
                                          GoogleFonts.lato(color: Colors.black),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Divider(height: 1, color: Colors.grey)
                                ],
                              );
                            },
                          ),
                  )
                ],
              ),
            );
          })),
    );
  }
}
