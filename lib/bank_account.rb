class BankAccount

    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name, balance=1000, status="open")
        @name = name
        @balance = balance
        @status = status
    end

    def deposit(amount)
        self.balance += amount 
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end 

    def valid?
        if self.status == "open" and self.balance > 0
            True
        else
            False
        end
    end
end
