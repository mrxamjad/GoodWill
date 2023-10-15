import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:good_will/Constants/FirebaseKey.dart';
import 'package:good_will/methods/toDigit.dart';

class FirebaseService {
  static final date = DateTime.now();

  static String idDate = date.year.toString() +
      toDigit(date.month) +
      toDigit(date.day) +
      toDigit(date.hour) +
      toDigit(date.minute) +
      toDigit(date.second);

  static final CollectionReference userRef =
      FirebaseFirestore.instance.collection("users");
  static final CollectionReference withdrawHistoryRef =
      FirebaseFirestore.instance.collection("withdraw_history");
  static final CollectionReference currentMatchRef =
      FirebaseFirestore.instance.collection("current_match");

  // static final  CollectionReference paymentRef=  FirebaseFirestore.instance.collection("payment_details");

  // CREATE A NEW USER
  static Future createUser(String uid, String name, String email) async {
    final date = DateTime.now();
    final DocumentReference profileRef =
        userRef.doc(uid).collection("profile").doc("profile_id");
    await profileRef.set({
      FirebaseKey.emailId: email,
      FirebaseKey.name: name,
      FirebaseKey.availableBalance: 0,
      FirebaseKey.totalWinning: 0,
      FirebaseKey.createdOn: date.toString(),
      FirebaseKey.currentMatch: 0,
      FirebaseKey.todayWinning: 0,
      FirebaseKey.withdrawPending: 0,
      FirebaseKey.lastMatchStatus: "none",
      FirebaseKey.userId: email.substring(0, 2).toUpperCase() +
          date.year.toString() +
          toDigit(date.month) +
          toDigit(date.day) +
          toDigit(date.hour) +
          toDigit(date.minute) +
          toDigit(date.second),
    });
  }

  //Recharge Update
  static Future updateRecharge(String uid, int rechargeAmount) async {
    final DocumentReference profileRef =
        userRef.doc(uid).collection("profile").doc("profile_id");

    profileRef.update(
        {FirebaseKey.availableBalance: FieldValue.increment(rechargeAmount)});
  }

// Withdraw update
  static Future updateWithdraw(String uid, int withdrawAmount) async {
    final DocumentReference profileRef =
        userRef.doc(uid).collection("profile").doc("profile_id");
    var data = await profileRef.get();
    int availableBalance = data[FirebaseKey.availableBalance];

    if (availableBalance >= withdrawAmount) {
      profileRef.update({
        FirebaseKey.availableBalance: FieldValue.increment(-withdrawAmount)
      });
    }
  }

  //add UPI to account

  static Future addUPI(String uid, String upiId) async {
    DocumentReference ref = FirebaseService.userRef
        .doc(uid)
        .collection(FirebaseKey.paymentDetails)
        .doc(FirebaseKey.upiDetails);
    try {
      ref.set({FirebaseKey.upiId: upiId});
    } catch (e) {}
  }

  //add bank account
  static Future addBank(
      String uid, String name, String ifsc, String account) async {
    DocumentReference ref = FirebaseService.userRef
        .doc(uid)
        .collection(FirebaseKey.paymentDetails)
        .doc(FirebaseKey.bankDetails);
    try {
      ref.set({
        FirebaseKey.bankAccount: account,
        FirebaseKey.bankName: name,
        FirebaseKey.ifscCode: ifsc
      });
    } catch (e) {}
  }

  //create a withdrawal history in user account

  static Future addWithdrawHistory(
      String uid,
      String amount,
      String paymentMethod,
      String account,
      String? bankName,
      String? ifscCode) async {
    DateTime date = DateTime.now();
    String id = date.year.toString() +
        toDigit(date.month) +
        toDigit(date.day) +
        toDigit(date.hour) +
        toDigit(date.minute) +
        toDigit(date.second);
    String tid = "W${uid.substring(0, 4).toUpperCase()}$id";

    await userRef
        .doc(uid)
        .collection(FirebaseKey.withdrawDetails)
        .doc(tid)
        .set({
      FirebaseKey.withdrawAmount: amount,
      FirebaseKey.withdrawId: tid,
      FirebaseKey.withdrawRequestTime: DateTime.now().toString(),
      FirebaseKey.withdrawStatus: "pending",
      FirebaseKey.paymentTime: "",
      FirebaseKey.paymentMethod: paymentMethod,
      FirebaseKey.bankAccount: account,
      FirebaseKey.bankName: bankName ?? '',
      FirebaseKey.ifscCode: ifscCode ?? '',
      FirebaseKey.userKey: uid,
    }).then((value) async {
      await FirebaseFirestore.instance
          .collection("withdraw_history")
          .doc(FirebaseKey.withdrawPending)
          .collection(FirebaseKey.withdrawPending)
          .doc(tid)
          .set({
        FirebaseKey.withdrawAmount: amount,
        FirebaseKey.withdrawId: tid,
        FirebaseKey.withdrawRequestTime: DateTime.now().toString(),
        FirebaseKey.withdrawStatus: "pending",
        FirebaseKey.paymentTime: "",
        FirebaseKey.paymentMethod: paymentMethod,
        FirebaseKey.bankAccount: account,
        FirebaseKey.bankName: bankName ?? '',
        FirebaseKey.ifscCode: ifscCode ?? '',
        FirebaseKey.userKey: uid
      });
    });
  }

//Create recharge history
  static Future addRechargeHistory(String uid, int amount, String paymentMethod,
      String account, String? bankName, String? ifscCode) async {
    DateTime date = DateTime.now();
    String id = date.year.toString() +
        toDigit(date.month) +
        toDigit(date.day) +
        toDigit(date.hour) +
        toDigit(date.minute) +
        toDigit(date.second);
    String tid = "R${uid.substring(0, 4).toUpperCase()}$id";

    await userRef
        .doc(uid)
        .collection(FirebaseKey.rechargeDetails)
        .doc(tid)
        .set({
      FirebaseKey.rechargeAmount: amount,
      FirebaseKey.rechargeId: tid,
      FirebaseKey.rechargeRequestTime: DateTime.now().toString(),
      FirebaseKey.rechargeStatus: "success",
      FirebaseKey.paymentMethod: paymentMethod,
      FirebaseKey.bankAccount: account,
      FirebaseKey.bankName: bankName ?? '',
      FirebaseKey.ifscCode: ifscCode ?? '',
      FirebaseKey.userKey: uid,
    }).then((value) async {
      await FirebaseFirestore.instance
          .collection("recharge_history")
          .doc(tid)
          .set({
        FirebaseKey.rechargeAmount: amount,
        FirebaseKey.rechargeId: tid,
        FirebaseKey.rechargeRequestTime: DateTime.now().toString(),
        FirebaseKey.rechargeStatus: "success",
        FirebaseKey.paymentMethod: paymentMethod,
        FirebaseKey.bankAccount: account,
        FirebaseKey.bankName: bankName ?? '',
        FirebaseKey.ifscCode: ifscCode ?? '',
        FirebaseKey.userKey: uid,
      }).then((value) {
        FirebaseService.updateRecharge(uid, amount);
      });
    });
  }

  static joinMatch(String matchId, int amount, String userKey, String selected,
      String matchStatedTime) async {
    String category = "";
    String matchCode = matchId.substring(0, 1);

    String matchType = "";
    String typeCode = matchId.substring(1, 2);

    // check match category
    if (matchCode == "N") {
      category = "novel";
    }
    if (matchCode == "H") {
      category = "hero";
    }
    if (matchCode == "F") {
      category = "fizz";
    }
    if (matchCode == "E") {
      category = "elite";
    }

    // check match type
    if (typeCode == "N") {
      matchType = "neo";
    }
    if (typeCode == "D") {
      matchType = "duo";
    }
    if (typeCode == "T") {
      matchType = "trio";
    }

    /// Update the joined list for match
    await FirebaseFirestore.instance
        .collection(FirebaseKey.matchHistory)
        .doc(category)
        .collection(category)
        .doc(matchId)
        .collection("joined")
        .doc(userKey)
        .set(
      {
        FirebaseKey.matchId: matchId,
        FirebaseKey.matchJoinTime: DateTime.now().toString(),
        FirebaseKey.amount: amount,
        FirebaseKey.selectedItem: selected,
        FirebaseKey.matchType: matchType,
        FirebaseKey.matchStatus: FirebaseKey.matchInProcess,
        FirebaseKey.matchWinner: "",
        FirebaseKey.userKey: userKey
      },
    );

    /// update the amount and count of the match
    await FirebaseFirestore.instance
        .collection(FirebaseKey.matchHistory)
        .doc(category)
        .collection(category)
        .doc(matchId)
        .update({
      "${selected}_amount": FieldValue.increment(amount),
      "${selected}_joined": FieldValue.increment(1),
    });

    /// update the match history of user
    await FirebaseFirestore.instance
        .collection(FirebaseKey.users)
        .doc(userKey)
        .collection(FirebaseKey.matchDetails)
        .doc(matchId)
        .set(
      {
        FirebaseKey.matchStatus: FirebaseKey.matchInProcess,
        FirebaseKey.matchWinner: "",
        FirebaseKey.matchId: matchId,
        FirebaseKey.matchStartTime: matchStatedTime,
        FirebaseKey.amount: amount,
        FirebaseKey.selectedItem: selected,
        FirebaseKey.matchType: matchType,
      },
    );

    /// amount and profile of user
    await FirebaseFirestore.instance
        .collection(FirebaseKey.users)
        .doc(userKey)
        .collection(FirebaseKey.profile)
        .doc(FirebaseKey.profileId)
        .update({
      FirebaseKey.availableBalance: FieldValue.increment(-amount),
      FirebaseKey.currentMatch: FieldValue.increment(1)
    });

    /// update the current match
    await FirebaseFirestore.instance
        .collection(FirebaseKey.users)
        .doc(userKey)
        .collection(FirebaseKey.currentMatch)
        .doc(matchId)
        .set({});
  }

// Get Match History
  static Future novelMatchHistory() async {
    return await FirebaseFirestore.instance
        .collection("match_history")
        .doc("novel")
        .collection("novel")
        .orderBy(
          "start_date",
          descending: true,
        )
        .limit(50)
        .get();
  }

  static Future fizzMatchHistory() async {
    return await FirebaseFirestore.instance
        .collection(FirebaseKey.matchHistory)
        .doc("fizz")
        .collection("fizz")
        .orderBy(
          "start_date",
          descending: true,
        )
        .limit(50)
        .get();
  }

  static Future eliteMatchHistory() async {
    return await FirebaseFirestore.instance
        .collection(FirebaseKey.matchHistory)
        .doc("elite")
        .collection("elite")
        .orderBy(
          "start_date",
          descending: true,
        )
        .limit(50)
        .get();
  }

  static Future heroMatchHistory() async {
    return await FirebaseFirestore.instance
        .collection(FirebaseKey.matchHistory)
        .doc("hero")
        .collection("hero")
        .orderBy(
          "start_date",
          descending: true,
        )
        .limit(50)
        .get();
  }
}
