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
    @business_process.destroy
    redirect_to business_processes_url
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
      format.html # show.html.erb
      format.js
    end
  end

  def reset
    @business_process.children.each do |bp|
      bp.update_attributes(x: 500 ,y: 200)
    end
    redirect_to diagram_business_process_path(@business_process)
  end
end
