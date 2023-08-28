class Topup < Transaction
  belongs_to :stock, class_name: 'Stock', foreign_key: 'sender_id'
  belongs_to :account, class_name: 'Account', foreign_key: 'receiver_id'

  validate :is_sufficient_balance?, :minimum_topup

  def is_sufficient_balance?
    errors.add(:stock, 'Amount not available.') if stock.balance <= amount
  end

  def minimum_topup
    errors.add(:amount, 'nominal too low, minimum 10') if amount <= 10
  end
end
