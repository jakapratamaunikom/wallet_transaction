require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns all accounts to @accounts' do
      accounts = create_list(:account, 3)
      get :index
      expect(assigns(:accounts)).to match_array(accounts)
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      account = create(:account)
      get :show, params: { id: account.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new account to @account' do
      get :new
      expect(assigns(:account)).to be_a_new(Account)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new account' do
        expect {
          post :create, params: { account: attributes_for(:account) }
        }.to change(Account, :count).by(1)
      end

      it 'redirects to the created account' do
        post :create, params: { account: attributes_for(:account) }
        expect(response).to redirect_to(account_path(assigns(:account)))
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new account' do
        expect {
          post :create, params: { account: attributes_for(:account, customer_id: nil) }
        }.not_to change(Account, :count)
      end

      it 're-renders the new template' do
        post :create, params: { account: attributes_for(:account, customer_id: nil) }
        expect(response).to render_template(:new)
      end
    end
  end

  # Similar tests can be written for the other actions (edit, update, destroy)
end
