class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

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

    redirect_to :action => 'index'

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
    # @arrivaldate = params["team"]["arrivaldate"]
    @arrivaldate = getDateTime(params["team"], "arrivaldate")
    @modeofdeparture = params["team"]["modeofdeparture"]
    @departuredetails = params["team"]["departuredetails"]
    @departureloc = params["team"]["departureloc"]
    # @departuredate = params["team"]["departuredate"]
    @departuredate = getDateTime(params["team"], "departuredate")

    debugger
    

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
      redirect_to :controller => 'teams', :action => 'index'
    else
      redirect_to :controller => 'teams', :action => 'edittravelplan', :id => @team.id
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
      DateTime.new parent[date_label + '(1i)'].to_i, parent[date_label + '(2i)'].to_i, parent[date_label + '(3i)'].to_i, parent[date_label + '(4i)'].to_i, parent[date_label + '(5i)'].to_i
  end

end
