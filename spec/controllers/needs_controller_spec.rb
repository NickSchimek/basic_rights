require 'rails_helper'

RSpec.describe NeedsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Need. As you add validations to Need, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { resource: 'not empty', organization_id: create(:organization) }
  }

  let(:invalid_attributes) {
    { resource: '', active: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # NeedsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:organization) { create(:organization) }

  describe "GET" do
    let(:need) { create(:need) }

    describe "#index" do
      it "returns a success response" do
        get :index, params: {organization_id: organization}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "#show" do
      it "returns a success response" do
        get :show, params: {organization_id: organization, id: need.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "#new" do
      it "returns a success response" do
        get :new, params: {organization_id: organization}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "#edit" do
      it "returns a success response" do
        get :edit, params: {organization_id: organization, id: need.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Need" do
        expect {
          post :create, params: {need: valid_attributes, organization_id: organization}, session: valid_session
        }.to change(Need, :count).by(1)
      end

      it "redirects to the created need" do
        post :create, params: {need: valid_attributes, organization_id: organization}, session: valid_session
        expect(response).to redirect_to([organization, Need.last])
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {need: invalid_attributes, organization_id: organization}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "Update actions" do
    let!(:need) { create(:need) }
    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          { active: false }
        }

        it "updates the requested need" do
          put :update, params: {id: need.to_param, need: new_attributes, organization_id: organization}, session: valid_session
          need.reload
          expect(need).to have_attributes(new_attributes)
        end

        it "redirects to the need" do
          put :update, params: {id: need.to_param, need: valid_attributes, organization_id: organization}, session: valid_session
          expect(response).to redirect_to([organization, need])
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          put :update, params: {id: need.to_param, need: invalid_attributes, organization_id: organization}, session: valid_session
          expect(response).to be_successful
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested need" do
        expect {
          delete :destroy, params: {id: need.to_param, organization_id: organization}, session: valid_session
        }.to change(Need, :count).by(-1)
      end

      it "redirects to the needs list" do
        delete :destroy, params: {id: need.to_param, organization_id: organization}, session: valid_session
        expect(response).to redirect_to(organization_needs_path)
      end
    end
  end

end
