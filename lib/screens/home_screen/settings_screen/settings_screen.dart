import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/controllers.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/shared/app_colors.dart';

class SettingsScreen extends StatefulWidget {
  final Recipe? initialRecipe;
  const SettingsScreen({
    Key? key,
    this.initialRecipe,
  }) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => Scaffold(
            key: const Key("SettingsScaffoldKey"),
            body: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * .025,
                left: MediaQuery.of(context).size.width * .025,
                right: MediaQuery.of(context).size.width * .025,
              ),
              child: Column(
                children: [
                  ToggleButtons(
                    children: const [Text('Light'), Text('Dark')],
                    isSelected: homeController.lightModeSettings,
                    onPressed: (index) {
                      if (index == 0) {
                        homeController.lightModeSettings[0] = true;
                        homeController.lightModeSettings[1] = false;
                        AppColors().enableLightMode();
                      } else {
                        homeController.lightModeSettings[1] = true;
                        homeController.lightModeSettings[0] = false;
                        AppColors().enableDarkMode();
                      }
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
