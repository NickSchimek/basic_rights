require 'rails_helper'

RSpec.describe FulfillmentsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Fulfillment. As you add validations to Fulfillment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { quantity: 2, need_id: create(:need), organization_id: create(:organization) }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FulfillmentsController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  let(:need) { create(:need) }

  describe "GET" do
    let(:fulfillment) { create(:fulfillment) }
    describe "#index" do
      it "returns a success response" do
        get :index, params: { need_id: need }, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "#show" do
      it "returns a success response" do
        get :show, params: { id: fulfillment.to_param, need_id: need }, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "#new" do
      it "returns a success response" do
        get :new, params: { need_id: need }, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "#edit" do
      it "returns a success response" do
        get :edit, params: { id: fulfillment.to_param, need_id: need }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Fulfillment" do
        expect {
          post :create, params: { fulfillment: valid_attributes, need_id: need }, session: valid_session
        }.to change(Fulfillment, :count).by(1)
      end

      it "redirects to the created fulfillment" do
        post :create, params: { fulfillment: valid_attributes, need_id: need }, session: valid_session
        expect(response).to redirect_to([need, Fulfillment.last])
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { fulfillment: invalid_attributes, need_id: need }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "Update actions" do
    let!(:fulfillment) { create(:fulfillment) }
    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          { quantity: 10 }
        }

        it "updates the requested fulfillment" do
          put :update, params: { id: fulfillment.to_param, fulfillment: new_attributes, need_id: need }, session: valid_session
          fulfillment.reload
          expect(fulfillment).to have_attributes(new_attributes)
        end

        it "redirects to the fulfillment" do
          put :update, params: { id: fulfillment.to_param, fulfillment: valid_attributes, need_id: need }, session: valid_session
          expect(response).to redirect_to([need, fulfillment])
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          put :update, params: { id: fulfillment.to_param, fulfillment: invalid_attributes, need_id: need }, session: valid_session
          expect(response).to be_successful
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested fulfillment" do
        expect {
          delete :destroy, params: { id: fulfillment.to_param, need_id: need }, session: valid_session
        }.to change(Fulfillment, :count).by(-1)
      end

      it "redirects to the fulfillments list" do
        delete :destroy, params: { id: fulfillment.to_param, need_id: need }, session: valid_session
        expect(response).to redirect_to(need_fulfillments_url(fulfillment.need))
      end
    end
  end

end
