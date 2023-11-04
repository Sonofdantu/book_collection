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

RSpec.describe "/attendances", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Attendance. As you add validations to Attendance, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Attendance.create! valid_attributes
      get attendances_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      attendance = Attendance.create! valid_attributes
      get attendance_url(attendance)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_attendance_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      attendance = Attendance.create! valid_attributes
      get edit_attendance_url(attendance)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Attendance" do
        expect {
          post attendances_url, params: { attendance: valid_attributes }
        }.to change(Attendance, :count).by(1)
      end

      it "redirects to the created attendance" do
        post attendances_url, params: { attendance: valid_attributes }
        expect(response).to redirect_to(attendance_url(Attendance.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Attendance" do
        expect {
          post attendances_url, params: { attendance: invalid_attributes }
        }.to change(Attendance, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post attendances_url, params: { attendance: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested attendance" do
        attendance = Attendance.create! valid_attributes
        patch attendance_url(attendance), params: { attendance: new_attributes }
        attendance.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the attendance" do
        attendance = Attendance.create! valid_attributes
        patch attendance_url(attendance), params: { attendance: new_attributes }
        attendance.reload
        expect(response).to redirect_to(attendance_url(attendance))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        attendance = Attendance.create! valid_attributes
        patch attendance_url(attendance), params: { attendance: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested attendance" do
      attendance = Attendance.create! valid_attributes
      expect {
        delete attendance_url(attendance)
      }.to change(Attendance, :count).by(-1)
    end

    it "redirects to the attendances list" do
      attendance = Attendance.create! valid_attributes
      delete attendance_url(attendance)
      expect(response).to redirect_to(attendances_url)
    end
  end
end
