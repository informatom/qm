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
    begin
      @flow_object.destroy
      flash[:success] = t('notice.flow_object.destroyed')
    rescue ActiveRecord::DeleteRestrictionError => e
      @flow_object.errors.add(:base, e)
      flash[:error] = t('exception.' + "#{e}")
    ensure
      redirect_to flow_objects_url
    end
  end
end
