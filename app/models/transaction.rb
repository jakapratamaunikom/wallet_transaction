class Transaction < ApplicationRecord
	after_create :transaction_calculation

  def transaction_calculation
    TransactionServices.new(self).perform
  end

  def transaction_sender
    return Stock.find(sender_id).code if type == 'Topup'
    return Account.find(sender_id).number if type == 'Withdraw'

    Account.find(sender_id).number
  end

  def transaction_receiver
    return Account.find(receiver_id).number if type == 'Topup'
    return Stock.find(receiver_id).code if type == 'Withdraw'

    Account.find(receiver_id).number
  end
end
