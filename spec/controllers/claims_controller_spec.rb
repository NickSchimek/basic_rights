require 'rails_helper'

RSpec.describe ClaimsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Claim. As you add validations to Claim, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { quantity: 5, surplu_id: create(:surplus), organization_id: create(:organization) }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ClaimsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:surplus) { create(:surplus) }

  describe "GET" do
    let(:claim) { create(:claim) }
    describe "#index" do
      it "returns a success response" do
        get :index, params: { surplu_id: surplus }, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "#show" do
      it "returns a success response" do
        get :show, params: { id: claim.to_param, surplu_id: surplus }, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "#new" do
      it "returns a success response" do
        get :new, params: { surplu_id: surplus }, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "#edit" do
      it "returns a success response" do
        get :edit, params: { id: claim.to_param, surplu_id: surplus }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Claim" do
        expect {
          post :create, params: { claim: valid_attributes, surplu_id: surplus }, session: valid_session
        }.to change(Claim, :count).by(1)
      end

      it "redirects to the created claim" do
        post :create, params: { claim: valid_attributes, surplu_id: surplus }, session: valid_session
        expect(response).to redirect_to([surplus, Claim.last])
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { claim: invalid_attributes, surplu_id: surplus }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "Update actions" do
    let!(:claim) { create(:claim) }
    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          { quantity: 10 }
        }

        it "updates the requested claim" do
          put :update, params: { id: claim.to_param, claim: new_attributes, surplu_id: surplus }, session: valid_session
          claim.reload
          expect(claim).to have_attributes(new_attributes)
        end

        it "redirects to the claim" do
          put :update, params: { id: claim.to_param, claim: valid_attributes, surplu_id: surplus }, session: valid_session
          expect(response).to redirect_to([surplus, claim])
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          put :update, params: { id: claim.to_param, claim: invalid_attributes }, session: valid_session
          expect(response).to be_successful
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested claim" do
        expect {
          delete :destroy, params: { id: claim.to_param, surplu_id: surplus }, session: valid_session
        }.to change(Claim, :count).by(-1)
      end

      it "redirects to the claims list" do
        delete :destroy, params: { id: claim.to_param, surplu_id: surplus }, session: valid_session
        expect(response).to redirect_to(surplu_claims_url)
      end
    end
  end

end
