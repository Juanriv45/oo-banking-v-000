class Transfer
  # your code here
  attr_accessor :status, :amount
  attr_reader :sender, :sender, :receiver


  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @status == "pending" && @sender.valid? && @sender.balance > @amount then
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
    else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" then
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
