// builder: (context, snapshot) {
// if (snapshot.hasError) {
// return const Center(
// child: SizedBox(height: 100,
// width: 100,
// child: Text("Error found"),),
// );
// }
// else if(snapshot.hasData){
// return SizedBox( height: 100, width: 100,child: CircularProgressIndicator(),);
//
// }
// else {
// return const Center(
// child: SizedBox(height: 100,
// width: 100,
// child: CircularProgressIndicator(),),
// );
// }
// }




//
//
// Column(
// children: [
// Container(
// margin: const EdgeInsets.all(5.0),
// width: double.infinity,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(30),
// border: Border.all(
// width: 1, color: Colors.white)),
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// children: [
// Text(
// "Available Balance".toUpperCase(),
// style: const TextStyle(
// color: Colors.white,
// fontSize: 16,
// fontWeight: FontWeight.bold),
// ),
// Text(
// " ₹ ${DataClass.availableBalance} ",
// style: const TextStyle(
// color: Colors.white,
// fontSize: 22,
// fontWeight: FontWeight.bold),
// ),
// SizedBox(
// width: 90,
// height: 20,
// child: ElevatedButton(
// style: ElevatedButton.styleFrom(
// backgroundColor: Colors.red),
// onPressed: () {
// setState(() {
// recharge = !recharge;
// withdraw=false;
// });
// },
// child: const Text(
// "RECHARGE",
// style: TextStyle(
// fontSize: 10,
// color: Colors.white),
// )))
// ],
// ),
// ),
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceAround,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// displayAmount(
// title: "Today Winning",
// amount: "1000",
// amountBgColor: Colors.green,
// amountColor: Colors.white),
// displayAmount(
// title: "Total Winning", amount: "3000"),
// displayAmount(
// title: "Withdraw Pending",
// amount: "1000",
// amountColor: Colors.white,
// amountBgColor: Colors.amber),
// ],
// )
// ],
//
// )