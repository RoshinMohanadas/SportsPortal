class ReportsController < ApplicationController

    require "prawn"
  require "prawn/table"
  require "rubygems"
require "prawn" 


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
