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

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FeaturesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "authed actions" do

    before(:each) do
      @user = User.new email: 'admin@example.com', password: '123456', admin: true
      @user.save!
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    describe "GET #show" do
      it "assigns the requested user as @user" do
        get :show
        expect(assigns(:user)).to eq(@user)
      end
    end

    describe "GET #new" do
      it "assigns a new user as @new_user" do
        get :new
        expect(assigns(:new_user)).to be_a_new(User)
      end
    end

    describe "GET #index" do
      it "assigns a all users as @users" do
        user = User.new valid_attributes
        user.save!
        get :index
        expect(assigns(:users)).to eq(User.all)
      end
    end

    describe "GET #edit" do
      it "assigns the requested feature as @feature" do
        get :edit
        expect(assigns(:user)).to eq(@user)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new user" do
          expect {
            post :create, {:user => valid_attributes}
          }.to change(User, :count).by(1)
        end

        it "assigns a newly created user as @user" do
          post :create, {:user => valid_attributes}
          expect(assigns(:new_user)).to be_a(User)
          expect(assigns(:new_user)).to be_persisted
        end

        it "redirects to the created github_token" do
          post :create, {:user => valid_attributes}
          expect(response).to redirect_to(user_path)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved github_token as @github_token" do
          post :create, {:user => invalid_attributes}
          expect(assigns(:new_user)).to be_a_new(User)
        end

        it "re-renders the 'new' template" do
          post :create, {:user => invalid_attributes}
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do

        let(:new_valid_attributes) {
          {
            email: 'new_email@example.com',
            password: '123456',
            password_validation: '123456'
          }
        }

        it "updates the requested user" do
          put :update, {:user => new_valid_attributes}
          @user.reload
          expect(@user.email).to eq('new_email@example.com')
        end

        it "assigns the requested user as @user" do
          put :update, {:user => new_valid_attributes}
          expect(assigns(:user)).to eq(@user)
        end

        it "redirects to the user" do
          put :update, {:user => new_valid_attributes}
          expect(response).to redirect_to(user_path)
        end
      end

      context "with invalid params" do
        let(:new_invalid_attributes) {
          {
            email: 'new_email@example.com',
            password: '123456',
            password_validation: 'bad password'
          }
        }
        it "assigns the user as @user" do
          put :update, {:user => invalid_attributes}
          expect(assigns(:user)).to eq(@user)
        end

        it "assigns the user as @user unless correct password" do
          put :update, {:user => new_invalid_attributes}
          @user.reload
          expect(assigns(:user)).to eq(@user)
          expect(@user.email).to eq('admin@example.com')
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested user" do
        user = User.create! valid_attributes
        expect {
          delete :destroy, {:id => user.to_param}
        }.to change(User, :count).by(-1)
      end

      it "redirects to the users list" do
        user = User.create! valid_attributes
        delete :destroy, {:id => user.to_param}
        expect(response).to redirect_to(root_url)
      end
    end
  end

  describe "Admin auth fails" do
    before(:each) do
      user = User.create! email: 'admin@example.com', password: '123456'
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    describe "GET #index" do
      it "redirects to root if not logged in" do
        get :index
        expect(response).to redirect_to(root_path)
      end
    end

    describe "GET #new" do
      it "redirects to root if not logged in" do
        get :new
        expect(response).to redirect_to(root_path)
      end
    end

    describe "POST #create" do
      it "redirects to root if not logged in" do
        post :create, {:user => valid_attributes}
        expect(response).to redirect_to(root_path)
      end
    end

    describe "DESTROY #destroy" do
      it "redirects to root if not logged in" do
        delete :destroy, { id: 2 }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "Authentification fails" do
    describe "GET #show" do
      it "redirects to root if not logged in" do
        get :show
        expect(response).to redirect_to(root_path)
      end
    end
  end

end
