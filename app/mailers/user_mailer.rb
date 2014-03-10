class UserMailer < ActionMailer::Base
  default :from =>  "mayuri.icicle@gmail.com"
  def create_post(post)
    mail(:to => user.email, :subject => "Welcome to Blog Application")
  end
end
