class UserMailer < ApplicationMailer  
    def welcome_email(team)
         @team = team
         mail(to: @team.pocemail, subject: 'Welcome to NITC Sports Portal')
    end
end