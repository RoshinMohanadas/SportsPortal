class UserMailer < ApplicationMailer  
    def welcome_email(team)
         @team = team
         mail(to: @team.pocemail, subject: 'Welcome to NITC Sports Portal')
    end

    def approve_email(team)
        @team = team
        @event = Event.find(@team.event_id)
        mail(to: @team.pocemail, subject: 'NITC Sports Portal - Team Approved')
   end

   def reject_email(team)
    @team = team
    @event = Event.find(@team.event_id)
    mail(to: @team.pocemail, subject: 'NITC Sports Portal - Team Rejected')
   end

end