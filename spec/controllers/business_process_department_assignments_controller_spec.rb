require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe BusinessProcessDepartmentAssignmentsController do

  # This should return the minimal set of attributes required to create a valid
  # BusinessProcessDepartmentAssignment. As you add validations to BusinessProcessDepartmentAssignment, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BusinessProcessDepartmentAssignmentsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all business_process_department_assignments as @business_process_department_assignments" do
      business_process_department_assignment = BusinessProcessDepartmentAssignment.create! valid_attributes
      get :index, {}, valid_session
      assigns(:business_process_department_assignments).should eq([business_process_department_assignment])
    end
  end

  describe "GET show" do
    it "assigns the requested business_process_department_assignment as @business_process_department_assignment" do
      business_process_department_assignment = BusinessProcessDepartmentAssignment.create! valid_attributes
      get :show, {:id => business_process_department_assignment.to_param}, valid_session
      assigns(:business_process_department_assignment).should eq(business_process_department_assignment)
    end
  end

  describe "GET new" do
    it "assigns a new business_process_department_assignment as @business_process_department_assignment" do
      get :new, {}, valid_session
      assigns(:business_process_department_assignment).should be_a_new(BusinessProcessDepartmentAssignment)
    end
  end

  describe "GET edit" do
    it "assigns the requested business_process_department_assignment as @business_process_department_assignment" do
      business_process_department_assignment = BusinessProcessDepartmentAssignment.create! valid_attributes
      get :edit, {:id => business_process_department_assignment.to_param}, valid_session
      assigns(:business_process_department_assignment).should eq(business_process_department_assignment)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new BusinessProcessDepartmentAssignment" do
        expect {
          post :create, {:business_process_department_assignment => valid_attributes}, valid_session
        }.to change(BusinessProcessDepartmentAssignment, :count).by(1)
      end

      it "assigns a newly created business_process_department_assignment as @business_process_department_assignment" do
        post :create, {:business_process_department_assignment => valid_attributes}, valid_session
        assigns(:business_process_department_assignment).should be_a(BusinessProcessDepartmentAssignment)
        assigns(:business_process_department_assignment).should be_persisted
      end

      it "redirects to the created business_process_department_assignment" do
        post :create, {:business_process_department_assignment => valid_attributes}, valid_session
        response.should redirect_to(BusinessProcessDepartmentAssignment.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved business_process_department_assignment as @business_process_department_assignment" do
        # Trigger the behavior that occurs when invalid params are submitted
        BusinessProcessDepartmentAssignment.any_instance.stub(:save).and_return(false)
        post :create, {:business_process_department_assignment => {}}, valid_session
        assigns(:business_process_department_assignment).should be_a_new(BusinessProcessDepartmentAssignment)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        BusinessProcessDepartmentAssignment.any_instance.stub(:save).and_return(false)
        post :create, {:business_process_department_assignment => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested business_process_department_assignment" do
        business_process_department_assignment = BusinessProcessDepartmentAssignment.create! valid_attributes
        # Assuming there are no other business_process_department_assignments in the database, this
        # specifies that the BusinessProcessDepartmentAssignment created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        BusinessProcessDepartmentAssignment.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => business_process_department_assignment.to_param, :business_process_department_assignment => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested business_process_department_assignment as @business_process_department_assignment" do
        business_process_department_assignment = BusinessProcessDepartmentAssignment.create! valid_attributes
        put :update, {:id => business_process_department_assignment.to_param, :business_process_department_assignment => valid_attributes}, valid_session
        assigns(:business_process_department_assignment).should eq(business_process_department_assignment)
      end

      it "redirects to the business_process_department_assignment" do
        business_process_department_assignment = BusinessProcessDepartmentAssignment.create! valid_attributes
        put :update, {:id => business_process_department_assignment.to_param, :business_process_department_assignment => valid_attributes}, valid_session
        response.should redirect_to(business_process_department_assignment)
      end
    end

    describe "with invalid params" do
      it "assigns the business_process_department_assignment as @business_process_department_assignment" do
        business_process_department_assignment = BusinessProcessDepartmentAssignment.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BusinessProcessDepartmentAssignment.any_instance.stub(:save).and_return(false)
        put :update, {:id => business_process_department_assignment.to_param, :business_process_department_assignment => {}}, valid_session
        assigns(:business_process_department_assignment).should eq(business_process_department_assignment)
      end

      it "re-renders the 'edit' template" do
        business_process_department_assignment = BusinessProcessDepartmentAssignment.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BusinessProcessDepartmentAssignment.any_instance.stub(:save).and_return(false)
        put :update, {:id => business_process_department_assignment.to_param, :business_process_department_assignment => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested business_process_department_assignment" do
      business_process_department_assignment = BusinessProcessDepartmentAssignment.create! valid_attributes
      expect {
        delete :destroy, {:id => business_process_department_assignment.to_param}, valid_session
      }.to change(BusinessProcessDepartmentAssignment, :count).by(-1)
    end

    it "redirects to the business_process_department_assignments list" do
      business_process_department_assignment = BusinessProcessDepartmentAssignment.create! valid_attributes
      delete :destroy, {:id => business_process_department_assignment.to_param}, valid_session
      response.should redirect_to(business_process_department_assignments_url)
    end
  end

end
