class SubmissionsController < ApplicationController

  skip_authorization_check
  skip_before_filter :authenticate_user!, :only => :create

  def create
    @submission = Submission.new(params[:submission])
    if @submission.valid?
      UserMailer.submission(@submission).deliver
      redirect_to new_user_session_path, :notice => 'E-Mail wurde erfolgreich erzeugt. Wir werden Sie kontaktieren.'
    else
      render "devise/sessions/new"
    end
  end
end
