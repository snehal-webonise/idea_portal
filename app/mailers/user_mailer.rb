class UserMailer < ActionMailer::Base
  default from: "idea_portal@example.com"


  def account_created(user)
  	email = user.email
  	mail(:to => email, :subject => "Connect to Idea.")
  end
end
