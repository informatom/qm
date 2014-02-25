class CompaniesController < ApplicationController
  load_and_authorize_resource

   def new
     @company = Company.new()
     @company.employments.new(user_id: current_user.id)
   end

  def create
    if @company.save
      @company.employments.find_or_create_by_user_id(current_user.id)
      redirect_to @company, notice: t('notice.company.created')
    else
      render action: "new"
    end
  end

  def update
    if @company.update_attributes(params[:company])
      redirect_to @company, notice: t('notice.company.updated')
    else
      render action: "edit"
    end
  end

  def copy
    company = Company.find(params[:id])
    new_company = company.dup :include => [:substitutions, 
                                           :employments, 
                                           {:departments => {:department_affiliations => :company}}],
                              :use_dictionary => true
#                                            {:user_function_assignments => :function},
#                                           {:user_role_in_company_assignments => :role_in_company},
#                                          {:process_classes => {:business_processes => {:process_steps => {:outgoing_sequence_flows => :target}}}}],
# :business_process_department_assignments

    new_company.name = "Kopie von " + company.name + " um " + I18n.l(Time.now()).to_s
    new_company.save
    debugger
    redirect_to new_company, notice: t('notice.company.copied')
  end


  def destroy
    begin
      @company.destroy
      flash[:success] = t('notice.company.destroyed')
    rescue ActiveRecord::DeleteRestrictionError => e
      @company.errors.add(:base, e)
      flash[:error] = t('exception.' + "#{e}")
    ensure
      redirect_to companies_url
    end
  end

  def organigram
    if params["coords"]
      x = params["coords"]["x"].to_i
      y = params["coords"]["y"].to_i
      puts x,y # print coordinates on console
      case params["object"]
      when "dep"
        @department = Department.find_by_id(params["coords"]["id"])
        @department.update_attributes(x: x ,y: y)
      when "fun"
        @function = Function.find_by_id(params["coords"]["id"])
        @function.update_attributes(x: x ,y: y)
      end
    end

    respond_to do |format|
      format.html # diagram.html.erb
      format.js
    end
  end
end