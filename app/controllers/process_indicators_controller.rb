class ProcessIndicatorsController < ApplicationController
  load_and_authorize_resource

  def create
    if @process_indicator.save
      redirect_to @process_indicator, notice: t('notice.process_indicator.created')
    else
      render action: "new"
    end
  end

  def update
    if @process_indicator.update_attributes(params[:process_indicator])
      redirect_to @process_indicator, notice: t('notice.process_indicator.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    begin
      @process_indicator.destroy
      flash[:success] = t('notice.process_indicator.destroyed')
    rescue ActiveRecord::DeleteRestrictionError => e
      @process_indicator.errors.add(:base, e)
      flash[:error] = t('exception.' + "#{e}")
    ensure
      redirect_to process_indicators_url
    end
  end
end
