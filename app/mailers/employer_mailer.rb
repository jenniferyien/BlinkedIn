class EmployerMailer < ApplicationMailer


    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
       :address => "smtp.gmail.com",
       :port => 587,
       :domain => "gmail.com",
       :user_name => "esther.kristen@gmail.com"
       :password =>  "MDBtWKrMxqL3TBsEz6A9"
       :authentication => "plain",
       :enable_starttls_auto => true
    }

   def initial_contact(user)
     @user = user
     mail(to: @user.email, subject: "This employer is interested in you!")
   end
end
