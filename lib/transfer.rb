class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)  # takes in transfer details
    @sender = sender      # sets instance variables
    @receiver = receiver  # for the transfer
    @amount = amount      
    @status = "pending"   # sets status to pending to start
  end

  def valid?  # calls BankAccount instances to check validity
    sender.valid? && receiver.valid?
  end

  def execute_transaction # validates transfer criteria 
    if transfer_qualifies
      transaction_process(sender, receiver)
      @status = "complete"      # shows transfer is complete
    else
      @status = "rejected"  # shows as rejected
      "Transaction rejected. Please check your account balance."  # rejection message
    end
  end

  def reverse_transfer 
    if @status == "complete"  # transfer must be complete to happen
      transaction_process(receiver, sender)
      @status = "reversed"  # updates status to show transfer was reversed
    end
  end

  def transfer_qualifies # makes sure transfer can be executed
    self.valid? && sender.balance - amount > 0 && @status == "pending"
  end

  def transaction_process(sender, receiver)
    sender.balance -= amount    # makes withdraw from sender
    receiver.deposit(amount)  # makes deposit in receiver
  end
end
