import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instrumentationapp/Global%20Wigets/Globalpopup.dart';

PreferredSizeWidget GlobalAppBar(String lable, BuildContext context,
    ArrowbackChangeCallback ArrowBackCallbackAction) {
  return PreferredSize(
    preferredSize:
        Size.fromHeight(kToolbarHeight + 2), // Adjust the height as needed

    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: AppBar(
        title: Text(lable),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: ArrowBackCallbackAction),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.info,
              color: Colors.orange,
            ),
            onPressed: () {
              if (lable == "Select") {
                //can do any popup filtration
              }
              // PopupManager.showPopup(
              //     context, PopupType.snackbar, "No information Avaiable Yet");

              PopupManager.showPopup(context, PopupType.bottomSheet,
                  "No information Avaiable Yet");
            },
          ),
        ],
      ),
    ),
  );
}

class MyLandscapeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ArrowbackChangeCallback ArrowBackCallbackAction;
  MyLandscapeAppBar({Key? key, required this.ArrowBackCallbackAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: ArrowBackCallbackAction,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3)),
              alignment: Alignment.center,

              // we can set width here with conditions
              width: 50,
              height: kToolbarHeight,

              child: const Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }

  ///width doesnt matter
  @override
  Size get preferredSize => Size(200, kToolbarHeight);
}

typedef void ArrowbackChangeCallback();
