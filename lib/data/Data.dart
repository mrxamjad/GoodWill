class DataClass {
  static int availableBalance = 0;
  static String userKey = "";
  static String name = "";
  static String phone = "";
  static String email = "";

  // add amount
  static void addRecharge(int amount) {
    availableBalance += amount;
  }

  // withdraw amount
  static void withdraw(int amount) {
    availableBalance -= amount;
  }
}
