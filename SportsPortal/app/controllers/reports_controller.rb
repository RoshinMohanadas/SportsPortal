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
            pdf.table(table_data, :width => 500, :cell_style => { :inline_format => true })
            send_data pdf.render, filename: 'test.pdf', type: 'application/pdf', :disposition => 'inline'
          end
        end
   end

end
