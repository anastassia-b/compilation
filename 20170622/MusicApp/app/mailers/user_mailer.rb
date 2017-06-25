class UserMailer < ApplicationMailer
  default from: "anastassia@example.com"

  def activation_email(user)
    @user = user
    mail(to: user.email, subject: "Welcome to Music App! Please activate your account.")
  end
end
