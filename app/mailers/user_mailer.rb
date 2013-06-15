class UserMailer < ActionMailer::Base
  default from: "qm@mittenin.at"

  def submission(submission)
    @submission = submission
    mail(:to => "stefan.haslinger@mittenin.at", :subject => "::QM@MITTENIN.AT:: Neue Registrierung")
  end
end