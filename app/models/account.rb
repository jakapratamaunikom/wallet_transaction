class Account < ApplicationRecord
	belongs_to :customer

  validates :customer_id, :number, presence: true,
                                   uniqueness: true

  validates_length_of :number, minimum: 8, allow_blank: false
end
