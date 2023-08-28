class TransactionServices
  def initialize(transaction)
    @transaction = transaction
  end

  def perform
    calculate_transaction
  rescue ActiveRecord::RecordInvalid => e
    raise StandardError, e.record.errors.full_messages.to_sentence
  end

  def calculate_transaction
    case @transaction.type

    when 'Topup'
      @transaction.stock.update(balance: @transaction.stock.balance - @transaction.amount)
      @transaction.account.update(balance: @transaction.account.balance + @transaction.amount)
    when 'Withdraw'
      @transaction.account.update(balance: @transaction.account.balance - @transaction.amount)
      @transaction.stock.update(balance: @transaction.stock.balance + @transaction.amount)
    when 'Transfer'
      @transaction.sender.update(balance: @transaction.sender.balance - @transaction.amount)
      @transaction.receiver.update(balance: @transaction.receiver.balance + @transaction.amount)
    end
  end
end
