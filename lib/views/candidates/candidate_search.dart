import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/candidate_card.dart';
import '../../components/themes.dart';
import '../../controller/pagination_controllers.dart';
import '../../models/models.dart';

class CandidateSearch extends StatefulWidget {
  const CandidateSearch({
    Key? key,
    required this.candidates,
  }) : super(key: key);

  final List<CandidateData> candidates;
  @override
  State<CandidateSearch> createState() => _CandidateSearchState();
}

class _CandidateSearchState extends State<CandidateSearch> {
  late FocusNode searchFocus;
  late TextEditingController searchQueryController;
  String query = "";
  List<CandidateData> results = [];

  setQuery(val) {
    setState(() {
      query = val;
    });
  }

  void buildResults(val) {
    setState(() {
      for (var candidate in widget.candidates) {
        if (candidate.filedCandidacies["May 9, 2022"]["ballot_name"].toString().split("(").first.contains(val)) {
          results.add(candidate);
        }
      }
      PaginationController paginationController = PaginationController();
      paginationController.initSearchPaginationData(results);
    });
  }

  @override
  void initState() {
    searchFocus = FocusNode();
    searchQueryController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchFocus.dispose();
    searchQueryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final paginationController = Provider.of<PaginationController>(context);
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Image.asset(
                "assets/bg_pattern.png",
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width,
                      height: 112,
                      padding: const EdgeInsets.only(
                        top: 48,
                        bottom: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 2,
                            spreadRadius: 0,
                            color: Colors.black.withOpacity(0.30),
                          ),
                          BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 3,
                            spreadRadius: 1,
                            color: Colors.black.withOpacity(0.15),
                          ),
                        ],
                      ),
                      child: Container(
                        width: size.width,
                        height: 56,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                                paginationController.clearSearchFields();
                              },
                              iconSize: 24,
                              color: Colors.black,
                              icon: const Icon(Icons.arrow_back),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: TextFormField(
                                focusNode: searchFocus,
                                autofocus: true,
                                controller: searchQueryController,
                                cursorHeight: 24,
                                cursorColor: Colors.black,
                                style: veripolTextStyles.bodyLarge.copyWith(color: Colors.black),
                                onChanged: (value) {
                                  setQuery(value);
                                },
                                onFieldSubmitted: (val) {
                                  buildResults(val.toUpperCase());
                                },
                                decoration: InputDecoration(
                                  hintText: "Search for a candidate",
                                  contentPadding: EdgeInsets.zero,
                                  isCollapsed: true,
                                  hintStyle: veripolTextStyles.bodyLarge.copyWith(
                                    color: const Color(0xff75777F),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 0,
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: query == "" ? false : true,
                              child: const SizedBox(
                                width: 20,
                              ),
                            ),
                            Visibility(
                              visible: query == "" ? false : true,
                              child: IconButton(
                                onPressed: () {
                                  searchQueryController.clear();
                                  setQuery("");
                                  setState(() {
                                    results.clear();
                                  });
                                  paginationController.clearSearchFields();
                                },
                                color: Colors.black,
                                iconSize: 24,
                                icon: const Icon(Icons.clear),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    results.isNotEmpty
                        ? Expanded(
                            child: ListView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.5),
                                  child: Column(
                                    children: List.generate(
                                        paginationController.searchLength <= 10
                                            ? paginationController.searchLength
                                            : paginationController.searchTempo.length, (index) {
                                      return CandidateCard(data: paginationController.searchTempo[index]);
                                    }),
                                  ),
                                ),
                                results.length > 10
                                    ? Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: paginationController.searchStartCount > 1
                                                ? () {
                                                    paginationController.decrementSearchPageCount();
                                                    paginationController.setSearchTempo();
                                                  }
                                                : null,
                                            icon: Icon(
                                              Icons.arrow_back_ios,
                                              size: 24,
                                              color: paginationController.searchStartCount == 1
                                                  ? Colors.black.withOpacity(0.50)
                                                  : Colors.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          SizedBox(
                                            width: 32,
                                            child: Center(
                                              child: Text(
                                                paginationController.searchStartCount.toString(),
                                                style: veripolTextStyles.bodyMedium.copyWith(color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          SizedBox(
                                            width: 32,
                                            child: Center(
                                              child: Text(
                                                "of",
                                                style: veripolTextStyles.bodyMedium.copyWith(color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          SizedBox(
                                            width: 32,
                                            child: Center(
                                              child: Text(
                                                paginationController.searchEndCount.toString(),
                                                style: veripolTextStyles.bodyMedium.copyWith(color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          IconButton(
                                            onPressed: paginationController.searchStartCount <
                                                    paginationController.searchEndCount
                                                ? () {
                                                    paginationController.incrementSearchPageCount();
                                                    paginationController.setSearchTempo();
                                                  }
                                                : null,
                                            icon: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 24,
                                              color: paginationController.searchStartCount ==
                                                      paginationController.searchEndCount
                                                  ? Colors.black.withOpacity(0.50)
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox(),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
