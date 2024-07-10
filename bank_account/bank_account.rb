class  BankAccount
  attr_reader :balance, :account_number, :owner_name

  def initialize(account_number, owner_name, initial_balance = 0)
    @account_number = account_number
    @owner_name = owner_name
    @balance = initial_balance
  end

  def deposit(amount)
    if amount > 0
      @balance += amount
      puts "Deposited $#{amount}. New balance: $#{@balance}."
    else
      puts "Deposit amount must be positive."
    end
  end

  def withdraw(amount)
    if amount > 0
      if amount <= @balance
        @balance -= amount
        puts "Withdrew $#{amount}. New balance: $#{@balance}."
      else
        puts "Insufficient funds."
      end
    else
      puts "Withdrawal amount must be positive."
    end
  end

  def check_balance
    puts "Current balance: $#{@balance}."
  end
end

account1 = BankAccount.new("12345678", "Alice", 1000)
account2 = BankAccount.new("87654321", "Bob", 500)

account1.deposit(200)
account1.withdraw(300)
account1.check_balance

account2.deposit(150)
account2.withdraw(700)
account2.check_balance
