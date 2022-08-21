
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Toasts {
  static getErrorToast({@required String ?text}) async {
    await Fluttertoast.showToast(
        msg: text ?? "please try again",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static getSuccessToast({@required String ?text}) async {
    await Fluttertoast.showToast(
        msg: text ?? "please try again",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static getWarningToast({@required String ?text}) async {
    await Fluttertoast.showToast(
        msg: text ?? "please try again",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        fontSize: 16.0);
  }
  //
  // static showCustomDialog(
  //     { BuildContext context, Function onPress}) async {
  //   await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return Dialog(
  //         child: Container(
  //           height: 229,
  //           width: 330,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(10),
  //             color: Colors.white,
  //           ),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               CommonWidgets.addVerticalSpace(42),
  //               TextView.getLargeText(
  //                 "ADMIN APPROVAL",
  //                 Assets.robotoBlack,
  //                 color: Colors.black,
  //                 size: 25,
  //                 lines: 1,
  //                 fontWeight: FontWeight.w700,
  //               ),
  //               CommonWidgets.addVerticalSpace(12),
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   TextView.getLargeText(
  //                     "Your request is sent to admin. Please",
  //                     Assets.robotoRegular,
  //                     color: Colors.black,
  //                     size: 14,
  //                     lines: 1,
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                   CommonWidgets.addVerticalSpace(7),
  //                   TextView.getLargeText(
  //                     "wait for admin approval",
  //                     Assets.robotoRegular,
  //                     color: Colors.black,
  //                     size: 14,
  //                     lines: 1,
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                 ],
  //               ),
  //               CommonWidgets.addVerticalSpace(20),
  //               CommonWidgets.customBlueButton(
  //                 height: 45,
  //                 width: 185,
  //                 text: "CLOSE",
  //                 press: () => onPress.call(),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
