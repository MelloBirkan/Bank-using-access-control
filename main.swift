// Write your code below 🏦
struct Bank {
  private let password: String
  private var balance: Double = 0.00
  static let depositBonusRate: Double = 0.01

  init (password: String) {
    self.password = password
  }

  private func isValid(_ enteredPassword: String) -> Bool {
    if enteredPassword == self.password {
      return true
    } else {
      return false
    }
  }

  private func finalDepositWithBonus(fromInitialDeposit deposit: Double) -> Double {
    let depositTotal = deposit + (Bank.depositBonusRate * deposit)
    return depositTotal
  }

  func makeDeposit(ofAmount depositAmount: Double) {
    let depositWithBonus = finalDepositWithBonus(fromInitialDeposit: depositAmount)
    print("Making a deposit of \(depositAmount) with a bonus rate.\nThe final amount deposited is \(depositWithBonus)")
  }
}