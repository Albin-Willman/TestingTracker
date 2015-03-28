require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Feature. As you add validations to Feature, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      email: 'email@example.com',
      password: '123456'
    }
  }

  let(:invalid_attributes) {
    {
      email: 'email',
      password: '12'
    }
  }

  
  describe "GET #new" do
    it 'can render login form if no user is set' do
      get :new
      expect(assigns(:user_session)).to be_a_new(UserSession)
      expect(assigns(:users_exist)).to be_falsey
    end
    it 'redirects to user_path if user is set' do
      user = User.create! valid_attributes
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      get :new
      expect(response).to redirect_to(user_path)
    end
  end
  describe "Post #create" do
    it 'creates a user if non is in the db' do
      expect {
        post :create, user_session: valid_attributes
      }.to change(User, :count).by(1)
      expect(assigns(:user_session)).to be_a(UserSession)
      expect(assigns(:user_session).persisted?).to be_falsey
    end
    it 'logs a user in if right params are submited' do
      user = User.create! valid_attributes
      expect {
        post :create, user_session: valid_attributes
      }.to change(User, :count).by(0)
      expect(assigns(:user_session).user).to eq(user)
    end

    it "redirects to the users dashboard" do
      user = User.create! valid_attributes
      post :create, user_session: valid_attributes
      expect(response).to redirect_to(user_path)
    end

    it "rerenders the form if faulty params are submited" do
      user = User.create! valid_attributes
      post :create, user_session: invalid_attributes
      expect(response).to render_template("new")
    end

    it 'redirects to user_path if user is set' do
      user = User.create! valid_attributes
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      post :create, user_session: invalid_attributes
      expect(response).to redirect_to(user_path)
    end
  end

  describe "DELETE #destroy" do
    it "redirects to the root path" do
      delete :destroy
      expect(response).to redirect_to(root_path)
    end
  end
end
