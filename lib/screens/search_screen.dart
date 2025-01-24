import 'package:flutter/material.dart';

import '../app_methods.dart';
import '../widgets/custom_auto_complete_field.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/cut_off_date_field.dart';
import '../widgets/fcl_checkbox.dart';
import '../widgets/nearby_origins_checkbox.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/history_button.dart';
import '../widgets/lcl_checkbox.dart';
import '../widgets/nearby_destinations_checkbox.dart';
import '../widgets/search_button.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AppMethods.fetchUniversities(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == null || snapshot.data!.isEmpty) {
            ScaffoldMessenger.of(context)
                .showMaterialBanner(const MaterialBanner(
              content: Text("Something went wrong..."),
              actions: [],
            ));
          }
          return Scaffold(
            backgroundColor: const Color.fromRGBO(230, 234, 248, 1),
            appBar: AppBar(
              scrolledUnderElevation: 0,
              backgroundColor: const Color.fromRGBO(255, 255, 255, 0.5),
              title: Text(
                "Search the best Freight Rates",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              actions: const [HistoryButton()],
            ),
            body: Container(
              margin: const EdgeInsets.only(
                  top: 16, bottom: 46, left: 22, right: 22),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 46),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Origin and Destination Row
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              CustomAutoCompleteField(
                                universities: snapshot.data,
                                title: "Origin",
                              ),
                              const SizedBox(height: 8),
                              const NearByOriginsCheckbox()
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            children: [
                              CustomAutoCompleteField(
                                universities: snapshot.data,
                                title: "Destination",
                              ),
                              const SizedBox(height: 8),
                              const NearByDestinationsCheckBox()
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Commodity and Cut-Off Date Row
                    const Row(
                      children: [
                        Expanded(
                          child: CustomDropDown(
                            itemsList: ["Commodity 1", "Commodity 2"],
                            title: "Commodity",
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                            child: CutOffDateField(
                          title: "Cut Off Date",
                          assetPath: "assets/icons/calendar-2.png",
                          isPrefix: false,
                        )),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Shipment Type Row
                    const Text(
                      "Shipment Type:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        FclCheckbox(),
                        SizedBox(width: 16),
                        LclCheckbox(),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Container Size and Additional Fields
                    const Row(
                      children: [
                        Expanded(
                          flex: 21,
                          child: CustomDropDown(
                            itemsList: ["20' Standard", "40' Standard"],
                            title: "Container Size",
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          flex: 10,
                          child: CustomTextField(
                            title: "No of Boxes",
                            isPrefix: false,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                            flex: 10,
                            child: CustomTextField(
                              title: "Weight (Kg)",
                              isPrefix: false,
                            )),
                      ],
                    ),
                    const SizedBox(height: 10),

                    const Row(
                      children: [
                        Icon(Icons.info_outline, size: 14),
                        SizedBox(width: 10),
                        Text(
                          "To obtain accurate rate for spot rate with guaranteed space and booking, please ensure your container count and weight per container is accurate.",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    // Container Internal Dimensions
                    const Text(
                      "Container Internal Dimensions:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Length: 39.46 ft"),
                              SizedBox(height: 14),
                              Text("Width: 7.70 ft"),
                              SizedBox(height: 14),
                              Text("Height: 7.84 ft"),
                              SizedBox(height: 8),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Image.asset(
                            "assets/images/container-image-1.png",
                            height: 86,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Search Button
                    const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SearchButton(),
                        ]),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
