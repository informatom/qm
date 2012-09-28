class SubstitutionsController < ApplicationController
  load_and_authorize_resource :substitution

  def index
    if current_user.has_role? :qm
      @userarray = Company.find_by_id(current_user.current_company_id).users.map {|user| user.id}
      @substitutions = Substitution.where(:user_id => @userarray, :deputy_id => @userarray)
    end
    if current_user.has_not_role? :admin
      @substitutions = []
    end
  end

  def create
    if @substitution.save
      redirect_to @substitution, notice: 'Substitution was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @substitution.update_attributes(params[:substitution])
      redirect_to @substitution, notice: 'Substitution was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @substitution.destroy

    redirect_to substitutions_url
  end
end
