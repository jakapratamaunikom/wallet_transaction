class Stock < ApplicationRecord
	extend Enumerize
  has_many :transactions

  validates :code, presence: true, uniqueness: true

  enumerize :stock_type, in: %i[topup withdraw], scope: :shallow
end
