class TeammembersController < ApplicationController
  before_action :set_teammember, only: [:show, :edit, :destroy]

  # GET /teammembers
  # GET /teammembers.json
  def index
    @teammembers = Teammember.all
  end

  # GET /teammembers/1
  # GET /teammembers/1.json
  def show
  end

  # GET /teammembers/new
  def new
    @teammember = Teammember.new
  end

  def newmember
    @teamid = params[:teamid]
    @member = Teammember.new
    @team = Team.find(@teamid) 
    @member.team_id = @teamid
    @members = Teammember.where(:team_id => @teamid)
  end

  # GET /teammembers/1/edit
  def edit
  end
  

  # POST /teammembers
  # POST /teammembers.json
  def create
    @teammember = Teammember.new(teammember_params)

    respond_to do |format|
      if @teammember.save
        format.html { redirect_to @teammember, notice: 'Teammember was successfully created.' }
        format.json { render :show, status: :created, location: @teammember }
      else
        format.html { render :new }
        format.json { render json: @teammember.errors, status: :unprocessable_entity }
      end
    end
  end

  def createmember
    @teammember = Teammember.new(teammember_params)

    @teammember.save
    redirect_to :controller => 'teammembers', :action => 'newmember', :teamid => @teammember.team_id
  
  end

  # PATCH/PUT /teammembers/1
  # PATCH/PUT /teammembers/1.json
  def update
    @teammember = Teammember.find(params["teammember"]["id"])

    @teammember.update(teammember_params)
   
    if @teammember.save
      redirect_to :controller => 'teammembers', :action => 'newmember', :teamid => @teammember.team_id
    else
      redirect_to :action => 'edit', id: @teammember.id
    end

  end

  # DELETE /teammembers/1
  # DELETE /teammembers/1.json
  def destroy
    @teamid = @teammember.team_id
    @teammember.destroy
    
    @teammember.save

    redirect_to :controller => 'teammembers', :action => 'newmember', :teamid => @teamid

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teammember
      @teammember = Teammember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teammember_params
      params.require(:teammember).permit(:name, :dob, :email, :gender, :role, :achievements, :foodpreference, :contactno, :team_id)
    end
end
