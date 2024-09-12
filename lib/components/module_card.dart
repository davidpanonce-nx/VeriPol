import 'package:flutter/material.dart';
import 'package:veripol/components/themes.dart';

import '../views/courses/testmodule_mcq_item.dart';

class ModuleCard extends StatelessWidget {
  const ModuleCard({
    super.key,
    required this.moduleData,
  });

  final Map<String, dynamic> moduleData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const TestModuleMCQItem()));
      },
      child: Container(
        width: 330,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        margin: const EdgeInsets.only(
          top: 5,
          left: 20,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff141414),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            moduleData["percentage-completed"] == 100
                ? Image.asset(
                    "assets/done.png",
                    width: 24,
                  )
                : Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 276,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "MODULE ${moduleData["module-number"]}",
                    style: veripolTextStyles.labelSmall.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    moduleData["module-title"],
                    overflow: TextOverflow.ellipsis,
                    style: veripolTextStyles.titleMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
