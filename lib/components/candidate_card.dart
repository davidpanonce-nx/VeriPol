import 'package:flutter/material.dart';
import 'package:veripol/views/profile/board_councilors_profile.dart';
import 'package:veripol/views/profile/governor_vice_profile.dart';
import 'package:veripol/views/profile/mayor_vice_profile.dart';

import '../views/profile/house_of_reps.dart';
import '../views/profile/party_list_profile.dart';
import '../views/profile/pres_vice_profile.dart';
import '../views/profile/senators_profile.dart';
import 'themes.dart';

class CandidateCard extends StatelessWidget {
  const CandidateCard({
    Key? key,
    required this.candidateImage,
    required this.ballotNumber,
    required this.candidateName,
    required this.politicalParty,
    required this.position,
  }) : super(key: key);

  final String position;
  final String candidateImage;
  final int ballotNumber;
  final String candidateName;
  final String politicalParty;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return InkWell(
      onTap: () {
        switch (position) {
          case "President":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const PresidentViceCandidateProfile(position: "President"),
              ),
            );
            break;
          case "Vice President":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PresidentViceCandidateProfile(
                    position: "Vice President"),
              ),
            );
            break;
          case "Senators":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const SenatorsProfile(position: "Senator"),
              ),
            );
            break;
          case "House of Representatives":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HouseOfRepresentativesProfile(
                    position: "House of Representative"),
              ),
            );
            break;
          case "Party Lists":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PartyListProfile(
                  position: "Party List",
                  partyList: "Party List Name",
                  description: "",
                ),
              ),
            );
            break;
          case "Governor":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const GovernorViceProfile(position: "Governor"),
              ),
            );
            break;
          case "Vice Governor":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const GovernorViceProfile(position: "Vice Governor"),
              ),
            );
            break;
          case "Provincial Board":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProvincialBoardCouncilorsProfile(
                    position: "Provincial Board"),
              ),
            );
            break;
          case "Mayor":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MayorViceProfile(position: "Mayor"),
              ),
            );
            break;
          case "Vice Mayor":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const MayorViceProfile(position: "Vice Mayor"),
              ),
            );
            break;
          case "Councilors":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProvincialBoardCouncilorsProfile(
                    position: "Councilor"),
              ),
            );
            break;
        }
      },
      child: Container(
        width: 350 / mockUpWidth * size.width,
        decoration: BoxDecoration(
          color: const Color(0xff141414),
          borderRadius: BorderRadius.circular(5 / mockUpWidth * size.height),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 8 / mockUpWidth * size.width,
          vertical: 10 / mockUpHeight * size.height,
        ),
        margin: EdgeInsets.only(bottom: 10 / mockUpHeight * size.height),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80 / mockUpWidth * size.width,
              height: 80 / mockUpWidth * size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(candidateImage),
                ),
                borderRadius:
                    BorderRadius.circular(7 / mockUpWidth * size.height),
              ),
            ),
            SizedBox(
              width: 10 / mockUpWidth * size.width,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "#" + ballotNumber.toString(),
                  textScaleFactor: textScale,
                  style: veripolTextStyles.titleSmall.copyWith(
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                Text(
                  candidateName,
                  textScaleFactor: textScale,
                  style: veripolTextStyles.titleMedium.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5 / mockUpHeight * size.height,
                ),
                Text(
                  politicalParty,
                  textScaleFactor: textScale,
                  style: veripolTextStyles.labelMedium.copyWith(
                    color: Colors.white.withOpacity(0.50),
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
