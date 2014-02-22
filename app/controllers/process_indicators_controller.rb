class ProcessIndicatorsController < ApplicationController
  load_and_authorize_resource
  autocomplete :user, :lastname, :full => true, :extra_data => [:firstname],
               :display_value => :name

  def get_autocomplete_items(parameters)
    super(parameters).joins(:companies).where(companies: {id: current_company.id})
  end

  def create
    if @process_indicator.save
      redirect_to @process_indicator, notice: t('notice.process_indicator.created')
    else
      render action: "new"
    end
  end

  def update

    if @process_indicator.update_attributes(params[:process_indicator]) && 
       @process_indicator.update_attributes(operator: params[:process_indicator][:operator][0])
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

  def index
    @process_indicators = ProcessIndicator.where(company_id: current_company.id)
  end
end
