class SequenceFlowsController < ApplicationController
  load_and_authorize_resource

  def create
    @sequence_flow = SequenceFlow.new(params[:sequence_flow])

    if @sequence_flow.save
      redirect_to @sequence_flow, notice: t('notice.sequence_flow.created')
    else
      render action: "new"
    end
  end

  def update
    if @sequence_flow.update_attributes(params[:sequence_flow])
      redirect_to @sequence_flow, notice: t('notice.sequence_flow.created')
    else
      render action: "edit"
    end
  end

  def destroy
    @sequence_flow.destroy
    redirect_to sequence_flows_url
  end
end
