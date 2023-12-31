require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/officer_entries", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # OfficerEntry. As you add validations to OfficerEntry, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      OfficerEntry.create! valid_attributes
      get officer_entries_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      officer_entry = OfficerEntry.create! valid_attributes
      get officer_entry_url(officer_entry)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_officer_entry_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      officer_entry = OfficerEntry.create! valid_attributes
      get edit_officer_entry_url(officer_entry)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new OfficerEntry" do
        expect {
          post officer_entries_url, params: { officer_entry: valid_attributes }
        }.to change(OfficerEntry, :count).by(1)
      end

      it "redirects to the created officer_entry" do
        post officer_entries_url, params: { officer_entry: valid_attributes }
        expect(response).to redirect_to(officer_entry_url(OfficerEntry.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new OfficerEntry" do
        expect {
          post officer_entries_url, params: { officer_entry: invalid_attributes }
        }.to change(OfficerEntry, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post officer_entries_url, params: { officer_entry: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested officer_entry" do
        officer_entry = OfficerEntry.create! valid_attributes
        patch officer_entry_url(officer_entry), params: { officer_entry: new_attributes }
        officer_entry.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the officer_entry" do
        officer_entry = OfficerEntry.create! valid_attributes
        patch officer_entry_url(officer_entry), params: { officer_entry: new_attributes }
        officer_entry.reload
        expect(response).to redirect_to(officer_entry_url(officer_entry))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        officer_entry = OfficerEntry.create! valid_attributes
        patch officer_entry_url(officer_entry), params: { officer_entry: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested officer_entry" do
      officer_entry = OfficerEntry.create! valid_attributes
      expect {
        delete officer_entry_url(officer_entry)
      }.to change(OfficerEntry, :count).by(-1)
    end

    it "redirects to the officer_entries list" do
      officer_entry = OfficerEntry.create! valid_attributes
      delete officer_entry_url(officer_entry)
      expect(response).to redirect_to(officer_entries_url)
    end
  end
end
