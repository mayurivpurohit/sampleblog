class PostMailer < ActionMailer::Base
  default :from =>  "mayuri.icicle@gmail.com"
  def create_post(post)
    # @user = user
    mail(:to =>"mvpurohit_23@yahoo.com" , :subject => "Welcome to Blog Application")
  end
end
