import 'package:one_goal/models/rive_model.dart';

class NavItemModel {
    final String title;
    final RiveModel rive;

    NavItemModel({ required this.title, required this.rive });
}


List<NavItemModel> bottomNavItems = [
    NavItemModel(
        title: "HOME", 
        rive: RiveModel(
            scr: "assets/RiveAssets/icons.riv",
            artboard: "HOME",
            stateMachineName: "HOME_interactivity"
        )
    ),
    NavItemModel(
        title: "HOME", 
        rive: RiveModel(
            scr: "assets/RiveAssets/icons.riv",
            artboard: "HOME",
            stateMachineName: "HOME_interactivity"
        )
    )
];