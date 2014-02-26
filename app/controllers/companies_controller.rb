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
    id = params[:id]
    c = Company.find(id)
    new_company = c.dup
    new_company.legacy_id = c.id
    new_company.name = "Kopie von " + c.name + " um " + I18n.l(Time.now()).to_s
    new_company.save

    es = Employment.where(company_id: id)
    es.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      n.save
    end

    pcs = ProcessClass.where(company_id: id)
    pcs.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      n.save
    end

    bps = BusinessProcess.where(company_id: id)
    bps.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id

      pcs = ProcessClass.where(legacy_id: o.process_class_id, company_id: new_company.id)
      n.process_class_id = pcs.first.id if pcs.any?

      n.save(validate: false)
    end

    bps.each do |o|
      n = BusinessProcess.where(legacy_id: o.id, company_id: new_company.id).first
      n.parent = BusinessProcess.where(legacy_id: o.parent.id, company_id: new_company.id).first if o.parent
      n.save
    end

    rocs = RoleInCompany.where(company_id: id)
    rocs.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      n.save
    end

    urica = UserRoleInCompanyAssignment.where(company_id: id)
    urica.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      rics = RoleInCompany.where(legacy_id: o.role_in_company_id, company_id: new_company.id)
      next unless rics.any?
      n.role_in_company_id = rics.first.id
      n.save
    end

    pss = ProcessStep.where(company_id: id)
    pss.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      bps = BusinessProcess.where(legacy_id: o.business_process_id, company_id: new_company.id)
      n.business_process_id = bps.first.id if bps.any?
      n.save
    end

    sfs = SequenceFlow.where(company_id: id)
    sfs.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      ss = ProcessStep.where(legacy_id: o.source_id, company_id: new_company.id)
      n.source_id = ss.first.id if ss.any?
      ts = ProcessStep.where(legacy_id: o.target_id, company_id: new_company.id)
      n.target_id = ts.first.id if ss.any?
      n.save
    end

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