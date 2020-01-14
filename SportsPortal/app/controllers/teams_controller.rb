class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :check_login, only: [:basicinfo, :createbasicinfo, :editbasicinfo, :updatebasicinfo, :edittravelplan, :updatetravelplan]
  before_action :check_is_owner, only: [:editbasicinfo, :edittravelplan]
  before_action :is_email_set, only: [:basicinfo]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/basicinfo
  def basicinfo
    @team = Team.new
    @event = Event.find(params[:eventid])
    @user_id = current_user.id
    @user = User.find(@user_id.to_i)

    rand_string = (0...8).map { ('a'..'z').to_a[rand(26)] }.join

    @name_part_one = @user.institute_id ? @user.institute.code: rand_string
    @team.name =  @name_part_one
    @team.event_id = params[:eventid]
  end

  def editbasicinfo
    @team = Team.find(params[:id])    
  end

  def createbasicinfo
    @team = Team.new(team_basic_params)

    @team.user_id = current_user.id

    @team.status = "basicinfofilled"
    @team.travelplanstatus = "notplanned"

      if @team.save
        #UserMailer.welcome_email(@team).deliver_now
        redirect_to :controller => 'teammembers', :action => 'newmember', :teamid => @team.id
      else
        redirect_to 'basicinfo'
      end
    
  end

  def updatebasicinfo
    @team = Team.find(params["team"]["id"])

    @name = params["team"]["name"]
    @achievements = params["team"]["achievements"]
    @poc = params["team"]["poc"]
    @pocmobile = params["team"]["pocmobile"]
    @pocemail = params["team"]["pocemail"]

    @team.update_attributes(:name => @name, :achievements => @achievements, :poc => @poc, :pocmobile => @pocmobile, :pocemail => @pocemail, :status => "basicinfofilled")
    if @team.save
      redirect_to :controller => 'teammembers', :action => 'newmember', :teamid => @team.id
    else
      redirect_to 'editbasicinfo', :id => @team.id
    end
  end

  def createteam
    @team = Team.find(params[:teamid])
    @eventid = params[:eventid]
    @team.status = "pending"


    @team.save

    #send email to event admins regarding the team registration

    redirect_to :action => 'show', :id => @team.id 

  end

  def edittravelplan
    @team = Team.find(params[:id])
  end

  def updatetravelplan
    @team = Team.find(params["team"]["id"])
    @eventid = @team.event_id

    @modeofarrival = params["team"]["modeofarrival"]
    @arrivaldetails = params["team"]["arrivaldetails"]
    @arrivalloc = params["team"]["arrivalloc"]
    @arrivaldate = getDateTime(params["team"], "arrivaldate")
    @modeofdeparture = params["team"]["modeofdeparture"]
    @departuredetails = params["team"]["departuredetails"]
    @departureloc = params["team"]["departureloc"]
    @departuredate = getDateTime(params["team"], "departuredate")

    @team.update_attributes(:modeofarrival => @modeofarrival, 
                            :arrivaldetails => @arrivaldetails, 
                            :arrivalloc => @arrivalloc, 
                            :arrivaldate => @arrivaldate, 
                            :modeofdeparture => @modeofdeparture, 
                            :departuredetails => @departuredetails,
                            :departureloc => @departureloc,
                            :departuredate => @departuredate,
                            :travelplanstatus => "planned")
    if @team.save
      # redirect_to :controller => 'teams', :action => 'index'
      redirect_to :controller => 'teams', :action => 'show', id: @team.id
    else
      redirect_to :controller => 'teams', :action => 'edittravelplan', :id => @team.id
    end
  end

  def approve
    @team = Team.find(params["team"]["id"])

    @team.status = "approved"
    @team.update_attributes(:instructionsfromadmin => params["team"]["instructionsfromadmin"])

    if @team.save
      UserMailer.approve_email(@team).deliver_now
      redirect_to request.referrer
    end

  end

  def reject
    @team = Team.find(params["team"]["id"])

    @team.status = "rejected"
    @team.update_attributes(:instructionsfromadmin => params["team"]["instructionsfromadmin"])

    if @team.save
      UserMailer.reject_email(@team).deliver_now
      redirect_to request.referrer
    end
  end


  def transport
    @team = Team.find(params[:id])
  end

  def arrangetransport
    @team = Team.find(params["team"]["id"])

    @team.travelplanstatus = "arranged"
    @team.update_attributes(:arrivaltravelarrangement => params["team"]["arrivaltravelarrangement"], :departuretravelarrangement => params["team"]["departuretravelarrangement"],:instructionsfromadmin => params["team"]["instructionsfromadmin"])

    if @team.save
      #send email to POC informing the travel arrangements
      UserMailer.arrangetransport_email(@team).deliver_now
      redirect_to :controller => 'teams', :action => 'show', :id => @team.id
    else
      redirect_to :controller => 'teams', :action => 'transport', :id => @team.id
    end

  end
  
  def rejecttravelplan
    @team = Team.find(params["team"]["id"])

    @team.travelplanstatus = "rejected"
    @team.update_attributes(:arrivaltravelarrangement => '', :departuretravelarrangement => '',:instructionsfromadmin => params["team"]["instructionsfromadmin"])

    if @team.save
      #send email to POC informing the rejection of travel plan
      UserMailer.rejecttravelplan_email(@team).deliver_now
      redirect_to :controller => 'teams', :action => 'show', :id => @team.id
    else
      redirect_to :controller => 'teams', :action => 'transport', :id => @team.id
    end

  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    def check_login
      if (!logged_in?)
        redirect_to session_new_path
      end
    end

    def check_is_owner
      team = Team.find(params[:id])

      if(logged_in? && current_user.id != team.user_id)
        redirect_to controller: 'homepage', action: 'home'
      end
    end

    def is_email_set
      if ( logged_in? && current_user.email.blank? )
        redirect_to edit_user_path(current_user)
      end
    end
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :poc, :pocmobile, :pocemail, :arrivaldate, :arrivalloc, :modeofarrival, :arrivaldetails, :departuredate, :departureloc, :modeofdeparture, :departuredetails, :instructionsfromadmin, :event_id, :user_id)
    end

    #def team_basic_params
    def team_basic_params
      params.require(:team).permit(:name, :achievements, :poc, :pocmobile, :pocemail, :event_id)
    end

    def getDate(parent, date_label)
      Date.new parent[date_label + '(1i)'].to_i, parent[date_label + '(2i)'].to_i, parent[date_label + '(3i)'].to_i
  end

  def getDateTime(parent, date_label)
      # year = parent[date_label + '(1i)'].to_i
      # month = parent[date_label + '(2i)'].to_i
      # day = parent[date_label + '(3i)'].to_i
      # hour = parent[date_label + '(4i)'].to_i
      # minute = parent[date_label + '(5i)'].to_i

      # Time.local(year, month, day, hour, minute, 0)



      dt = DateTime.new parent[date_label + '(1i)'].to_i, parent[date_label + '(2i)'].to_i, parent[date_label + '(3i)'].to_i, parent[date_label + '(4i)'].to_i, parent[date_label + '(5i)'].to_i
      dt.change(:offset => "+0530")
  end

end
