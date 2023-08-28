class Transfer < Transaction
  belongs_to :sender, class_name: 'Account', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'Account', foreign_key: 'receiver_id'

  validate :check_balance, :is_same_account?

  def check_balance
    errors.add(:balance, "is not enough. remaining balance is #{sender.balance}") if sender.balance < amount
  end

  def is_same_account?
    errors.add(:receiver, 'is the same account') if sender.number == receiver.number
  end
end
