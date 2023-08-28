class Withdraw < Transaction
	belongs_to :account, class_name: 'Account', foreign_key: 'sender_id'
  belongs_to :stock, class_name: 'Stock', foreign_key: 'receiver_id'

  validate :minimum_withdraw, :check_balance

  def minimum_withdraw
    errors.add(:amount, 'nominal too low, minimum 50.') if amount < 50
  end

  def check_balance
    errors.add(:balance, 'is not enough.') if account.balance < amount
  end
end
