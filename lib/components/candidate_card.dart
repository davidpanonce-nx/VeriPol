import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veripol/controller/chart_controller.dart';

import '../models/models.dart';
import '../views/profile/board_councilors_profile.dart';
import '../views/profile/governor_vice_profile.dart';
import '../views/profile/house_of_reps.dart';
import '../views/profile/mayor_vice_profile.dart';
import '../views/profile/party_list_profile.dart';
import '../views/profile/pres_vice_profile.dart';
import '../views/profile/senators_profile.dart';
import 'themes.dart';

class CandidateCard extends StatelessWidget {
  const CandidateCard({
    Key? key,
    required this.data,
    this.index,
  }) : super(key: key);

  final CandidateData data;
  final int? index;

  @override
  Widget build(BuildContext context) {
    final chartController = Provider.of<ChartController>(context);
    return InkWell(
      onTap: () async {
        switch (data.filedCandidacies["May 9, 2022"]["position"]) {
          case "PRESIDENT":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PresidentViceCandidateProfile(data: data),
              ),
            );
            break;
          case "VICE-PRESIDENT":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PresidentViceCandidateProfile(data: data),
              ),
            );
            break;
          case "SENATOR":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SenatorsProfile(
                  data: data,
                  index: index,
                ),
              ),
            );
            break;
          case "MEMBER, HOUSE OF REPRESENTATIVES":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HouseOfRepresentativesProfile(
                  position: "House of Representative",
                  data: data,
                ),
              ),
            );
            break;
          case "PARTY LIST":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PartyListProfile(
                  data: data,
                  description: "",
                ),
              ),
            );
            break;
          case "PROVINCIAL GOVERNOR":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GovernorViceProfile(
                  position: "Governor",
                  data: data,
                ),
              ),
            );
            break;
          case "PROVINCIAL VICE-GOVERNOR":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GovernorViceProfile(
                  position: "Vice Governor",
                  data: data,
                ),
              ),
            );
            break;
          case "MEMBER, SANGGUNIANG PANLALAWIGAN":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProvincialBoardCouncilorsProfile(
                  position: "Provincial Board",
                  index: index,
                  data: data,
                ),
              ),
            );
            break;
          case "MAYOR":
            {
              if (data.filedCandidacies["May 9, 2022"]["id"] == 'f9938825-39f1-4290-85fb-edc2999a3106') {
                chartController.setForRadazaData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MayorViceProfile(data: data, position: "Mayor", id: 'f9938825-39f1-4290-85fb-edc2999a3106'),
                  ),
                );
              } else {
                await chartController
                    .readCMCIData(data.id, data.filedCandidacies["May 9, 2022"]["location"]["id"])
                    .whenComplete(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MayorViceProfile(data: data, position: "Mayor"),
                    ),
                  );
                });
              }
            }
            break;
          case "VICE-MAYOR":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MayorViceProfile(data: data, position: "Vice Mayor"),
              ),
            );
            break;
          case "COUNCILOR":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProvincialBoardCouncilorsProfile(
                  index: index,
                  position: "Councilor",
                  data: data,
                ),
              ),
            );
            break;
        }
      },
      child: Container(
        width: 350,
        decoration: BoxDecoration(
          color: const Color(0xff141414),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10,
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    data.imgURL == "" ? "assets/default_img.png" : data.imgURL,
                  ),
                ),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "#${data.filedCandidacies["May 9, 2022"]["ballot_number"]}",
                  style: veripolTextStyles.titleSmall.copyWith(
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                SizedBox(
                  width: 240,
                  child: Text(
                    data.filedCandidacies["May 9, 2022"]["ballot_name"].toString().split("(").first,
                    maxLines: 2,
                    style: veripolTextStyles.titleMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Visibility(
                  visible: data.filedCandidacies["May 9, 2022"]["political_party"] == null ||
                          data.filedCandidacies["May 9, 2022"]["political_party"] == ""
                      ? false
                      : true,
                  child: SizedBox(
                    width: 240,
                    child: Text(
                      data.filedCandidacies["May 9, 2022"]["political_party"] ?? "",
                      maxLines: 2,
                      style: veripolTextStyles.labelMedium.copyWith(
                        color: Colors.white.withOpacity(0.50),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
