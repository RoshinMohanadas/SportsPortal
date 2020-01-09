class ReportsController < ApplicationController

    require "prawn"
  require "prawn/table"
  require "rubygems"
require "prawn" 



def ackdownload_pdf
  request.format = 'pdf'
  @teamid= params[:egid]
  #@egid=1
  @veg=0
  @nonveg=0
  @male=0
  @female=0
  @team = Team.find(@teamid)
      respond_to do |format|
        format.pdf do
          pdf = Prawn::Document.new
          pdf.text "National Institute of Technology Calicut", :size => 20 ,:align => :center,:style => :bold
          pdf.text "  "
          pdf.text @team.event.eventgroup.name, :size => 14 ,:align => :center,:style => :bold
          pdf.text "  "
          pdf.text @team.event.name, :size => 14 ,:align => :center,:style => :bold
          
          pdf.text "  "
          pdf.text "Registration Acknowledgement Receipt", :size => 12 ,:align => :center,:style => :bold
          pdf.text "  "

          table_data = Array.new
          table_data << ["<b>Team Name</b>", @team.name]
          table_data << ["<b>Team Achievements</b>", @team.achievements]
          table_data << ["<b>Point of Contact Name</b>",@team.poc]
          table_data << ["<b>Point of Contact Mobile No</b>",@team.pocmobile]
          table_data << ["<b>Point of Contact Emailid</b>",@team.pocemail]
          pdf.table(table_data, :width => 500, :cell_style => { :inline_format => true,size: 10 },:header => true)
             
          pdf.text "  "
          pdf.text "Team Members : ", :size => 11,:style => :bold

          table_data = Array.new
          table_data << ["<b>Name</b>","<b>DOB</b>","<b>Email</b>","<b>Gender</b>","<b>Role</b>","<b>Food Preference</b>","<b>Contact No</b>"]
          
          
          @team.teammembers.each do |p|
            
            table_data << [p.name, p.dob,p.email,p.gender,p.role,p.foodpreference,p.contactno]
        end
        
        pdf.table(table_data, :width => 500, :cell_style => { :inline_format => true,size: 8 },:header => true)
      
        pdf.text "  "
        pdf.text "  "
        pdf.text "  "
        pdf.text "  "
        
        pdf.text "Signature ", :size => 11,:style => :bold,:align => :right

          send_data pdf.render, filename: 'Acknowledgement_Receipt.pdf', type: 'application/pdf', :disposition => 'inline'
        end
      end
 end

   def participantsdownload_pdf
    request.format = 'pdf'
    @egid= params[:egid]
    #@egid=1
    @veg=0
    @nonveg=0
    @male=0
    @female=0
    @eventgroup = Eventgroup.find(@egid)
        respond_to do |format|
          format.pdf do
            pdf = Prawn::Document.new
            pdf.text "NIT Calicut Sports Portal", :color => "00004d", :size => 22 ,:align => :center
            pdf.text "  "
            pdf.text @eventgroup.name, :size => 18 ,:align => :center
            pdf.text "  "
            pdf.text "Participants Details", :size => 15 ,:align => :center

            stable_data = Array.new
            stable_data << ["<b>Food Preference</b>","<b>Total Count</b>"]

            gtable_data = Array.new
            gtable_data << ["<b>Gender</b>","<b>Total Count</b>"]

            @eventgroup.events.each do |event|
              pdf.text "  "
              pdf.text "Event Name : "+event.name, :size => 13,:align => :center

              event.teams.each do |team|
               
                if team.status=="approved" 
                  pdf.text "  "
                  pdf.text "Team Name : "+team.name, :size => 11

                  table_data = Array.new
                  table_data << ["<b>Name</b>","<b>DOB</b>","<b>Email</b>","<b>Gender</b>","<b>Role</b>","<b>Food Preference</b>","<b>Contact No</b>"]
                  
                  team.teammembers.each do |p|
                      if p.foodpreference=="Veg"
                        @veg=@veg+1
                      end
                      if p.foodpreference=="Non-Veg"
                        @nonveg=@nonveg+1
                      end

                      if p.gender=="Male"
                        @male=@male+1
                      end
                      if p.gender=="Female"
                        @female=@female+1
                      end

                      table_data << [p.name, p.dob,p.email,p.gender,p.role,p.foodpreference,p.contactno]
                  end
                  
                  pdf.table(table_data, :width => 500, :cell_style => { :inline_format => true,size: 7 },:row_colors => ["EEEEEE", "FFFFFF"],:header => true)
                end
              end
              pdf.start_new_page
            end

            pdf.text "  "
            pdf.text "Summary", :size => 15 ,:align => :center
            pdf.text "  "
            pdf.text "Food Preference", :size => 12 ,:align => :center
            pdf.text "  "
            stable_data << ["Veg",@veg]
            stable_data << ["Non-Veg",@nonveg]
            pdf.table(stable_data, :width => 500, :cell_style => { :inline_format => true,size: 7 },:row_colors => ["EEEEEE", "FFFFFF"],:header => true)
            
            pdf.text "  "
            pdf.text "  "
            pdf.text "Gender", :size => 12 ,:align => :center
            pdf.text "  "
            gtable_data << ["Male",@male]
            gtable_data << ["Female",@female]
            pdf.table(gtable_data, :width => 500, :cell_style => { :inline_format => true,size: 7 },:row_colors => ["EEEEEE", "FFFFFF"],:header => true)
                        
            send_data pdf.render, filename: 'Participants_Details.pdf', type: 'application/pdf', :disposition => 'inline'
          end
        end
   end



   def userdownload_pdf
    request.format = 'pdf'
        @users = User.all
        respond_to do |format|
          format.pdf do
            pdf = Prawn::Document.new
            table_data = Array.new
            table_data << ["<b>Name</b>","<b>Username</b>","<b>Email</b>","<b>Role</b>","<b>Contact No</b>"]
            @users.each do |p|
                table_data << [p.name, p.username,p.email,p.role,p.contactno]
            end


              #["<b>#{p.name}</b>", "<i>#{p.category}</i>"]
            pdf.text "NIT C Sports Portal", :color => "00004d", :size => 24 ,:align => :center                  
                  
            
            pdf.text "  "
            pdf.text "User Report", :size => 18 ,:align => :center
            pdf.table(table_data, :width => 500, :cell_style => { :inline_format => true })
            send_data pdf.render, filename: 'test.pdf', type: 'application/pdf', :disposition => 'inline'
          end
        end
   end


   def egdownload_pdf
    request.format = 'pdf'
      @eventgroups = Eventgroup.all
        respond_to do |format|
          format.pdf do
            pdf = Prawn::Document.new
            table_data = Array.new
            table_data << ["<b>Name</b>","<b>Description</b>","<b>Regstartdate</b>","<b>Regenddate</b>","<b>Startdate</b>,<b>Enddate</b>","<b>Isactive</b>","<b>Venue</b>"]
            @eventgroups.each do |p|
                table_data << [p.name, p.description,p.regstartdate,p.regenddate,p.startdate,p.enddate, p.isactive,p.venue]
            end


              #["<b>#{p.name}</b>", "<i>#{p.category}</i>"]
            pdf.text "NIT C Sports Portal", :color => "00004d", :size => 24 ,:align => :center                  
                  
            
            pdf.text "  "
            pdf.text "Event Groups Report", :size => 18 ,:align => :center
            pdf.table(table_data, :width => 500, :cell_style => { :inline_format => true })
            send_data pdf.render, filename: 'test.pdf', type: 'application/pdf', :disposition => 'inline'
          end
        end
   end

end
