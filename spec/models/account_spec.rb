require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'validations' do
    it { should belong_to(:customer) }

    it { should validate_presence_of(:customer_id) }
    it { should validate_presence_of(:number) }

  end
end
