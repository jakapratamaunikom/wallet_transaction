require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns @customers" do
      customer = FactoryBot.create(:customer)
      get :index
      expect(assigns(:customers)).to eq([customer])
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      customer = FactoryBot.create(:customer)
      get :show, params: { id: customer.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "assigns a new customer to @customer" do
      get :new
      expect(assigns(:customer)).to be_a_new(Customer)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new customer" do
        expect {
          post :create, params: { customer: FactoryBot.attributes_for(:customer) }
        }.to change(Customer, :count).by(1)
      end

      it "redirects to the created customer" do
        post :create, params: { customer: FactoryBot.attributes_for(:customer) }
        expect(response).to redirect_to(Customer.last)
      end
    end

    context "with invalid parameters" do
      it "does not create a new customer" do
        expect {
          post :create, params: { customer: { username: nil } }
        }.not_to change(Customer, :count)
      end

      it "returns unprocessable entity status" do
        post :create, params: { customer: { username: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
