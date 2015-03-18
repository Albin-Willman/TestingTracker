require 'rails_helper'



RSpec.describe UsersController, type: :controller do

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

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:require_user).and_return(true)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FeaturesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #show" do
    it "assigns the requested user as @user" do
      user = User.new valid_attributes
      user.save!
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      get :show
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #new" do
    it "assigns a new user as @new_user" do
      get :new
      expect(assigns(:new_user)).to be_a_new(User)
    end
  end

  describe "GET #edit" do
    it "assigns the requested feature as @feature" do
      user = User.new valid_attributes
      user.save!
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      get :edit
      expect(assigns(:user)).to eq(user)
    end
  end

end
