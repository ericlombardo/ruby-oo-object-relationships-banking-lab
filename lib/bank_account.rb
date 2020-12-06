class BankAccount
  attr_accessor :balance, :status
  attr_reader :name # can't change name for security

  def initialize(name)  # takes in name for account
    @name = name      # assigns instance variables
    @balance = 1000   # starting out balance
    @status = "open"  # sets status to "open" when created
  end

  def deposit(amount) 
    @balance += amount  # adds amount to balance
  end

  def display_balance # shows your balance message
    "Your balance is $#{@balance}."
  end

  def valid?  # checks if account is able to make a transfer
    @status == "open" && @balance > 0
  end

  def close_account # allows user to close account
    @status = "closed"
  end
end
