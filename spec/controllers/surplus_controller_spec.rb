require 'rails_helper'

RSpec.describe SurplusController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Surplus. As you add validations to Surplus, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { resource: 'not empty', active: true }
  }

  let(:invalid_attributes) {
    { resource: '', active: nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SurplusController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:organization) { create(:organization) }

  describe "GET" do
    let(:surplus) { create(:surplus) }

    describe "#index" do
      it "returns a success response" do
        get :index, params: { organization_id: organization }, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "#show" do
      it "returns a success response" do
        get :show, params: { id: surplus.to_param, organization_id: organization }, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "#new" do
      it "returns a success response" do
        get :new, params: { organization_id: organization }, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "#edit" do
      it "returns a success response" do
        get :edit, params: { id: surplus.to_param, organization_id: organization }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Surplus" do
        expect {
          post :create, params: { surplu: valid_attributes, organization_id: organization }, session: valid_session
        }.to change(Surplu, :count).by(1)
      end

      it "redirects to the created surplus" do
        post :create, params: { surplu: valid_attributes, organization_id: organization }, session: valid_session
        expect(response).to redirect_to([organization, Surplu.last])
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { surplu: invalid_attributes, organization_id: organization }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "Update actions" do
    let!(:surplus) { create(:surplus) }
    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          { active: false }
        }

        it "updates the requested surplus" do
          put :update, params: { id: surplus.to_param, surplu: new_attributes, organization_id: organization }, session: valid_session
          surplus.reload
          expect(surplus).to have_attributes(new_attributes)
        end

        it "redirects to the surplus" do
          put :update, params: { id: surplus.to_param, surplu: valid_attributes, organization_id: organization }, session: valid_session
          expect(response).to redirect_to([organization, surplus])
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          put :update, params: { id: surplus.to_param, surplu: invalid_attributes, organization_id: organization }, session: valid_session
          expect(response).to be_successful
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested surplus" do
        expect {
          delete :destroy, params: { id: surplus.to_param, organization_id: organization }, session: valid_session
        }.to change(Surplu, :count).by(-1)
      end

      it "redirects to the surplus list" do
        delete :destroy, params: { id: surplus.to_param, organization_id: organization }, session: valid_session
        expect(response).to redirect_to(organization_surplus_url)
      end
    end
  end

end
