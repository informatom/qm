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

describe InstructionsController do

  # This should return the minimal set of attributes required to create a valid
  # Instruction. As you add validations to Instruction, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "title" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # InstructionsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all instructions as @instructions" do
      instruction = Instruction.create! valid_attributes
      get :index, {}, valid_session
      assigns(:instructions).should eq([instruction])
    end
  end

  describe "GET show" do
    it "assigns the requested instruction as @instruction" do
      instruction = Instruction.create! valid_attributes
      get :show, {:id => instruction.to_param}, valid_session
      assigns(:instruction).should eq(instruction)
    end
  end

  describe "GET new" do
    it "assigns a new instruction as @instruction" do
      get :new, {}, valid_session
      assigns(:instruction).should be_a_new(Instruction)
    end
  end

  describe "GET edit" do
    it "assigns the requested instruction as @instruction" do
      instruction = Instruction.create! valid_attributes
      get :edit, {:id => instruction.to_param}, valid_session
      assigns(:instruction).should eq(instruction)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Instruction" do
        expect {
          post :create, {:instruction => valid_attributes}, valid_session
        }.to change(Instruction, :count).by(1)
      end

      it "assigns a newly created instruction as @instruction" do
        post :create, {:instruction => valid_attributes}, valid_session
        assigns(:instruction).should be_a(Instruction)
        assigns(:instruction).should be_persisted
      end

      it "redirects to the created instruction" do
        post :create, {:instruction => valid_attributes}, valid_session
        response.should redirect_to(Instruction.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved instruction as @instruction" do
        # Trigger the behavior that occurs when invalid params are submitted
        Instruction.any_instance.stub(:save).and_return(false)
        post :create, {:instruction => { "title" => "invalid value" }}, valid_session
        assigns(:instruction).should be_a_new(Instruction)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Instruction.any_instance.stub(:save).and_return(false)
        post :create, {:instruction => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested instruction" do
        instruction = Instruction.create! valid_attributes
        # Assuming there are no other instructions in the database, this
        # specifies that the Instruction created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Instruction.any_instance.should_receive(:update_attributes).with({ "title" => "MyString" })
        put :update, {:id => instruction.to_param, :instruction => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested instruction as @instruction" do
        instruction = Instruction.create! valid_attributes
        put :update, {:id => instruction.to_param, :instruction => valid_attributes}, valid_session
        assigns(:instruction).should eq(instruction)
      end

      it "redirects to the instruction" do
        instruction = Instruction.create! valid_attributes
        put :update, {:id => instruction.to_param, :instruction => valid_attributes}, valid_session
        response.should redirect_to(instruction)
      end
    end

    describe "with invalid params" do
      it "assigns the instruction as @instruction" do
        instruction = Instruction.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Instruction.any_instance.stub(:save).and_return(false)
        put :update, {:id => instruction.to_param, :instruction => { "title" => "invalid value" }}, valid_session
        assigns(:instruction).should eq(instruction)
      end

      it "re-renders the 'edit' template" do
        instruction = Instruction.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Instruction.any_instance.stub(:save).and_return(false)
        put :update, {:id => instruction.to_param, :instruction => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested instruction" do
      instruction = Instruction.create! valid_attributes
      expect {
        delete :destroy, {:id => instruction.to_param}, valid_session
      }.to change(Instruction, :count).by(-1)
    end

    it "redirects to the instructions list" do
      instruction = Instruction.create! valid_attributes
      delete :destroy, {:id => instruction.to_param}, valid_session
      response.should redirect_to(instructions_url)
    end
  end

end
