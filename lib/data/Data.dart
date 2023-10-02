class DataClass {
  static int availableBalance = 0;

  // add amount
  static void addRecharge(int amount) {
    availableBalance += amount;
  }
}
