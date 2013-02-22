class FlowObjectsController < ApplicationController
  load_and_authorize_resource

  def create
    if @flow_object.save
      redirect_to @flow_object, notice: t('notice.flow_object.created')
    else
      render action: "new"
    end
  end

  def update
    if @flow_object.update_attributes(params[:flow_object])
      redirect_to @flow_object, notice: t('notice.flow_object.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @flow_object.destroy

    redirect_to flow_objects_url
  end
end
