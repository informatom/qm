class SubmissionsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :create

  def create
    @submission = Submission.new(params[:submission])
    @testimonials = Paragraph.where( :assignment => "Kontakt", :position => 1).first
    if @submission.save
      UserMailer.submission(@submission).deliver
      redirect_to contact_paragraphs_path, :notice => 'E-Mail wurde erfolgreich erzeugt.'
    else
      render "paragraphs/contact", :layout => "website"
    end
  end
end
