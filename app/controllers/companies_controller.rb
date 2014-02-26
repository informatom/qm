class CompaniesController < ApplicationController
  load_and_authorize_resource
  include CopyCarrierwaveFile

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
      n.role_in_company_id = rics.first.id if rics.any?
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

    ds = Department.where(company_id: id)
    ds.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      n.save
    end

    das = DepartmentAffiliation.where(company_id: id)
    das.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      ds = Department.where(legacy_id: o.department_id, company_id: new_company.id)
      n.department_id = ds.first.id if ds.any?
      n.save
    end

    pis = ProcessIndicator.where(company_id: id)
    pis.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      n.save
    end

    ns = Note.where(company_id: id)
    ns.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      n.save
    end

    npsas = NoteProcessStepAssignment.where(company_id: id)
    npsas.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      ns = Note.where(legacy_id: o.note_id, company_id: new_company.id)
      n.note_id =  ns.first.id if ns.any?
      pss = ProcessStep.where(legacy_id: o.process_step_id, company_id: new_company.id)
      n.process_step_id =  pss.first.id if pss.any?
      n.save
    end

    bpnas = BusinessProcessNoteAssignment.where(company_id: id)
    bpnas.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      bps = BusinessProcess.where(legacy_id: o.business_process_id, company_id: new_company.id)
      n.business_process_id = bps.first.id if bps.any?
      ns = Note.where(legacy_id: o.note_id, company_id: new_company.id)
      n.note_id =  ns.first.id if ns.any?
      n.save
    end

    bppias = BusinessProcessProcessIndicatorAssignment.where(company_id: id)
    bppias.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      bps = BusinessProcess.where(legacy_id: o.business_process_id, company_id: new_company.id)
      n.business_process_id = bps.first.id if bps.any?
      pis = ProcessIndicator.where(legacy_id: o.process_indicator_id, company_id: new_company.id)
      n.process_indicator_id =  pis.first.id if pis.any?
      n.save
    end

    is = Instruction.where(company_id: id)
    is.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      ds = Department.where(legacy_id: o.scope_id, company_id: new_company.id)
      n.scope_id = ds.first.id if ds.any?
      n.save
    end

    ipsas = InstructionProcessStepAssignment.where(company_id: id)
    ipsas.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      is = Instruction.where(legacy_id: o.instruction_id, company_id: new_company.id)
      n.instruction_id =  is.first.id if is.any?
      pss = ProcessStep.where(legacy_id: o.process_step_id, company_id: new_company.id)
      n.process_step_id =  pss.first.id if pss.any?
      n.save
    end

    bpdas = BusinessProcessDepartmentAssignment.where(company_id: id)
    bpdas.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      bps = BusinessProcess.where(legacy_id: o.business_process_id, company_id: new_company.id)
      n.business_process_id = bps.first.id if bps.any?
      ds = Department.where(legacy_id: o.department_id, company_id: new_company.id)
      n.department_id = ds.first.id if ds.any?
      n.save
    end

    fs = Function.where(company_id: id)
    fs.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      n.save
    end

    ufas = UserFunctionAssignment.where(company_id: id)
    ufas.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      fs = Function.where(legacy_id: o.function_id, company_id: new_company.id)
      n.function_id = fs.first.id if fs.any?
      n.save
    end

    ds = Document.where(company_id: id)
    ds.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      copy_carrierwave_file(o, n, :attachment) if o.attachment.url
      n.save
    end

    idas = InstructionDocumentAssignment.where(company_id: id)
    idas.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      is = Instruction.where(legacy_id: o.instruction_id, company_id: new_company.id)
      n.instruction_id =  is.first.id if is.any?
      ds = Document.where(legacy_id: o.document_id, company_id: new_company.id)
      n.document_id =  ds.first.id if ds.any?
      n.save
    end

    bpdas = BusinessProcessDocumentAssignment.where(company_id: id)
    bpdas.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      bps = BusinessProcess.where(legacy_id: o.business_process_id, company_id: new_company.id)
      n.business_process_id = bps.first.id if bps.any?
      ds = Document.where(legacy_id: o.document_id, company_id: new_company.id)
      n.document_id =  ds.first.id if ds.any?
      n.save
    end

    dpsas = DocumentProcessStepAssignment.where(company_id: id)
    dpsas.each do |o|
      n = o.dup
      n.legacy_id = o.id
      n.company_id = new_company.id
      ds = Document.where(legacy_id: o.document_id, company_id: new_company.id)
      n.document_id =  ds.first.id if ds.any?
      pss = ProcessStep.where(legacy_id: o.process_step_id, company_id: new_company.id)
      n.process_step_id =  pss.first.id if pss.any?
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