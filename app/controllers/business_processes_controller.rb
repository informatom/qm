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
    @process_steps = Array.new()
    heap = Array.new()

    start_flow_object = FlowObject.where(:name => "Start").first
    @process_steps << @business_process.process_steps.where(:flow_object_id => start_flow_object.id).first    

    while (successors = @process_steps.last.successors) && (heap.any? || successors.any? )
      if successors.any?        
        @process_steps.include?(successors.first) ? successors.shift : @process_steps << successors.shift
        heap.concat(successors)
      else 
        @process_steps << heap.shift
      end
    end

    respond_to do |format|
      format.html
      # format.html { render :layout => "test" }
      format.js
    end
  end
end
