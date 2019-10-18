class TeammembersController < ApplicationController
  before_action :set_teammember, only: [:show, :edit, :update, :destroy]

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
    respond_to do |format|
      if @teammember.update(teammember_params)
        format.html { redirect_to @teammember, notice: 'Teammember was successfully updated.' }
        format.json { render :show, status: :ok, location: @teammember }
      else
        format.html { render :edit }
        format.json { render json: @teammember.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teammembers/1
  # DELETE /teammembers/1.json
  def destroy
    @teammember.destroy
    respond_to do |format|
      format.html { redirect_to teammembers_url, notice: 'Teammember was successfully destroyed.' }
      format.json { head :no_content }
    end
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
