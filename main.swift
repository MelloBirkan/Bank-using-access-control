// Write your code below 🏦
struct Bank {
  private let password: String
  private var balance: Double = 0.00 {
    didSet {
      if self.balance <= 100 {
      displayLowBalanceMessage()
      }
    }
  }
  static let depositBonusRate: Double = 0.01

  init (password: String, initialDeposit: Double) {
    self.password = password
    makeDeposit(ofAmount: initialDeposit)
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

  mutating func makeDeposit(ofAmount depositAmount: Double) {
    let depositWithBonus = finalDepositWithBonus(fromInitialDeposit: depositAmount)
    print("Making a deposit of \(depositAmount) with a bonus rate.\nThe final amount deposited is \(depositWithBonus)")
    self.balance += depositWithBonus
  }

  func displayBalance(usingPassword password: String) {
    if !(isValid(password)) {
      print("Error: Invalid password. Cannot retrieve balance.")
      return
    } else {
      print("Your current balance is $ \(self.balance)")
    }
  }

  mutating func makeWithdrawal(ofAmount withdrawalAmount: Double, usingPassword password: String) {
    if !isValid(password) {
      print("Error: Invalid password. Cannot make withdrawal.")
    } else {
      self.balance -= withdrawalAmount
      print("Making a $\(withdrawalAmount) withdrawal")
    }
  }

  private func displayLowBalanceMessage(){
    print("Alert: Your balance is under $100")
  }
}

var myAccount = Bank(password: "senha", initialDeposit: 500)
myAccount.makeDeposit(ofAmount: 50)
myAccount.makeWithdrawal(ofAmount: 100, usingPassword: "123deoliveira4")
myAccount.displayBalance(usingPassword: "senha")
myAccount.makeWithdrawal(ofAmount: 500, usingPassword: "senha")