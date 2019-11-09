require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:user)
  }

  let(:role) { create(:role) }

  let(:organization) { create(:organization) }

  let(:invalid_attributes) {
    { email: 'invalid_email' }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:each) { expect(controller).to receive(:authorize).and_return(true) }

  describe "GET #index" do
    it "returns a success response" do
      User.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      user = User.create! valid_attributes
      get :show, params: {id: user.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new user" do
        expect {
          post :create, params: { user: valid_attributes, role: { name: role.name }, organization: { id: organization.id } }, session: valid_session
        }.to change(User,       :count).by(1).
         and change(Membership, :count).by(1)
      end
    end
    context "with invalid params" do
      it "returns a success response (renders 'new' view)" do
        post :create, params: { user: invalid_attributes, role: { name: role.name }, organization: { id: organization.id } }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, params: {id: user.to_param}, session: valid_session
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = User.create! valid_attributes
      delete :destroy, params: {id: user.to_param}, session: valid_session
      expect(response).to redirect_to(users_url)
    end
  end

end
