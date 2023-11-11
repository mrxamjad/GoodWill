import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:good_will/data/Data.dart';

import 'package:good_will/screens/BankDetailsScreen.dart';

import 'package:good_will/screens/MatchScreen.dart';
import 'package:good_will/screens/PendingWithdrawalScreen.dart';
import 'package:good_will/screens/ProfileEdit.dart';
import 'package:good_will/screens/RechargeScreen.dart';

import 'package:good_will/screens/WalletScreen.dart';
import 'package:good_will/screens/WithdrawalScreen.dart';
import 'package:good_will/widget/ProfileItem.dart';
import 'package:good_will/widget/logoutWidget.dart';

import '../widget/pageBackground.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  // String? name = "Amjad Ali";

  Future<void> pay() async {
    const platform = MethodChannel('com.sabpaisa.integration/native');
    final List<Object?> result = await platform.invokeMethod('callSabPaisaSdk',
        ["sabpaa", "lastn", "ftter@gmail.com", "7260004480", "30"]);

    String txnStatus = result[0].toString();
    String txnId = result[1].toString();

    Fluttertoast.showToast(
        msg: "$txnStatus TransactionID: $txnId",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: [logoutWidget(context)],
      ),
      body: Stack(
        children: [
          pageBackground(
              fistBoxColor: Colors.teal[200]!,
              secondBoxColor: Colors.grey[200]!),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Card(
                    color: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(width: 0.5, color: Colors.teal)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.teal,
                          child: Text(
                            DataClass.name
                                .toString()
                                .substring(0, 1)
                                .toUpperCase(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 63,
                                color: Colors.white),
                          ),
                        ),
                        Text(
                          DataClass.name.toString().toUpperCase(),
                          style: const TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          DataClass.email,
                          style: const TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        Text(
                          "[ ${DataClass.phone} ]",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),

                ProfileItem(
                    context: context,
                    widget: ProfileEdit(),
                    title: "Profile",
                    icon: Icons.person),
                ProfileItem(
                    context: context,
                    widget: BankDetailScreen(),
                    title: "Bank Details",
                    icon: Icons.comment_bank),
                ProfileItem(
                    context: context,
                    widget: const WalletScreen(),
                    title: "Wallet",
                    icon: Icons.currency_rupee),
                ProfileItem(
                    context: context,
                    widget: const RechargeScreen(),
                    title: "Recharge",
                    icon: Icons.add),
                ProfileItem(
                    context: context,
                    widget: const WithdrawalScreen(),
                    title: "Withdrawal",
                    icon: Icons.monetization_on),
                ProfileItem(
                    context: context,
                    widget: const PendingWithdrawalScreen(),
                    title: "Pending ",
                    icon: Icons.pending_actions),
                ProfileItem(
                    context: context,
                    widget: const MatchScreen(),
                    title: "Winnings",
                    icon: Icons.wallet_giftcard),

                // ProfileItem(
                //     context: context,
                //     widget: WalletScreen(),
                //     title: "Settings",
                //     icon: Icons.settings),
                // ProfileItem(
                //     context: context,
                //     widget: WalletScreen(),
                //     title: "About",
                //     icon: Icons.help),
              ],
            ),
          )
        ],
      ),
    );
  }
}
