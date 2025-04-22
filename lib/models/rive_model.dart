import 'package:rive/rive.dart';

class RiveModel {
    final String scr, artboard, stateMachineName;
    late SMIBool? status;

    RiveModel({
        required this.scr,
        required this.artboard,
        required this.stateMachineName,
        this.status
    });

    set setStatus(SMIBool state) {
        status = state;
    }
}