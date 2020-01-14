class UserMailer < ApplicationMailer  
    def welcome_email(team)
         @team = team
         mail(to: @team.pocemail, subject: 'Welcome to NITC Sports Portal',cc: @team.user.email)
    end

    def approve_email(team)
        @team = team
        @event = Event.find(@team.event_id)
        mail(to: @team.pocemail, subject: 'NITC Sports Portal - Team Approved',cc: @team.user.email)
   end

   def reject_email(team)
    @team = team
    @event = Event.find(@team.event_id)
    mail(to: @team.pocemail, subject: 'NITC Sports Portal - Team Rejected',cc: @team.user.email)
   end
   def arrangetransport_email(team)
     @team = team
     @event = Event.find(@team.event_id)
     mail(to: @team.pocemail, subject: 'NITC Sports Portal - Travel Plan Approved',cc: @team.user.email)
    end

    def rejecttravelplan_email(team)
     @team = team
     @event = Event.find(@team.event_id)
     mail(to: @team.pocemail, subject: 'NITC Sports Portal - Travel Plan Rejected',cc: @team.user.email)
    end

    def changeinpassword_email(user, pass)
        @user = user
        @pass = pass
        mail(to: @user.email, subject: 'NITC Sports Portal - Generated new account password')
    end


end