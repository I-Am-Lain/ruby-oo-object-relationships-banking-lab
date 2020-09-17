require_relative "bank_account.rb"
require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  @@all = []

  def initialize(sender, receiver, amount, status="pending")
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = status
      @@all << self
  end

  def valid?
    self.sender.valid? && self.receiver.valid? && self.amount <= self.sender.balance 
  end

  def execute_transaction
    #binding.pry
    if self.valid? == true && self.status != "complete"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @@all.last.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
