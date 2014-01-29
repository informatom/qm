class BusinessProcessesController < ApplicationController
  load_and_authorize_resource

  def create
    @business_process.created_by = current_user.id
    @business_process.updated_by = current_user.id
    if @business_process.save
      redirect_to @business_process, notice: t('notice.business_process.created')
    else
      render action: "new"
    end
  end

  def update
    @business_process.updated_by = current_user.id
    if @business_process.update_attributes(params[:business_process])
      redirect_to @business_process, notice: t('notice.business_process.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    begin
      @business_process.destroy
      flash[:success] = t('notice.business_process.destroyed')
    rescue ActiveRecord::DeleteRestrictionError => e
      @business_process.errors.add(:base, e)
      flash[:error] = t('exception.' + "#{e}")
    ensure
      redirect_to business_processes_url
    end
  end

  def diagram
    if params["coords"]
      @business_process = BusinessProcess.find_by_id(params["coords"]["id"])
      x = params["coords"]["x"].to_i
      y = params["coords"]["y"].to_i
      puts x,y # print coordinates on console
      @business_process.update_attributes(x: x ,y: y)
    end

    respond_to do |format|
      format.html # diagram.html.erb
      format.js
    end
  end

  def reset
    @business_process.children.each do |bp|
      bp.update_attributes(x: 500 ,y: 200)
    end
    redirect_to diagram_business_process_path(@business_process)
  end

  def step_diagram
    @connectors = Array.new
    heap = Array.new()
    left_stub = 20
    right_stub = 20

    start_flow_object = FlowObject.where(:name => "Start").first || FlowObject.first
    @process_steps = [@business_process.process_steps.where(:flow_object_id => start_flow_object.id).first]

    while (successors = @process_steps.last.successors) && (heap.any? || successors.any? )
      current_step = @process_steps.last
      if successors.any?
        available = true
        successors.each do |successor|
          label = SequenceFlow.where(source_id: current_step.id, target_id: successor.id).first.name
          if @process_steps.include?(successor)
            @connectors << Connector.new(source: current_step.id, target: successor.id,
                             source_pos: "RightMiddle", target_pos: "RightMiddle",
                             stub: right_stub += 10, label: label, gap: 3 )
          else
            if available
              available = false
              @connectors << Connector.new(source: current_step.id, target: successor.id,
                                           source_pos: "BottomCenter", target_pos: "TopCenter",
                                           stub: 0, label: label, gap: 0 )
              @process_steps << successor
            else
              @connectors << Connector.new(source: current_step.id, target: successor.id,
                                           source_pos: "LeftMiddle", target_pos: "LeftMiddle",
                                           stub: left_stub += 10, label: label, gap: 3 )
              heap << successor unless heap.include?(successor)
            end
          end
        end
      else
        pending = heap.shift
        @process_steps << pending unless @process_steps.include?(pending)
      end
    end

    respond_to do |format|
      format.html
      # format.html { render :layout => "test" }
      format.js
    end
  end

  def index
    @business_processes = BusinessProcess.where(company_id: current_company.id)
  end
end
