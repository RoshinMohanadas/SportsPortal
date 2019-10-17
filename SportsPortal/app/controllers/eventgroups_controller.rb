class EventgroupsController < ApplicationController
  before_action :set_eventgroup, only: [:show, :edit, :update, :destroy]

  # GET /eventgroups
  # GET /eventgroups.json
  def index
    @eventgroups = Eventgroup.all
  end

  # GET /eventgroups/1
  # GET /eventgroups/1.json
  def show
  end

  # GET /eventgroups/new
  def new
    @eventgroup = Eventgroup.new
  end

  # GET /eventgroups/1/edit
  def edit
  end

  # POST /eventgroups
  # POST /eventgroups.json
  def create
    @eventgroup = Eventgroup.new(eventgroup_params)

    respond_to do |format|
      if @eventgroup.save
        format.html { redirect_to @eventgroup, notice: 'Eventgroup was successfully created.' }
        format.json { render :show, status: :created, location: @eventgroup }
      else
        format.html { render :new }
        format.json { render json: @eventgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventgroups/1
  # PATCH/PUT /eventgroups/1.json
  def update
    respond_to do |format|
      if @eventgroup.update(eventgroup_params)
        format.html { redirect_to @eventgroup, notice: 'Eventgroup was successfully updated.' }
        format.json { render :show, status: :ok, location: @eventgroup }
      else
        format.html { render :edit }
        format.json { render json: @eventgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventgroups/1
  # DELETE /eventgroups/1.json
  def destroy
    @eventgroup.destroy
    respond_to do |format|
      format.html { redirect_to eventgroups_url, notice: 'Eventgroup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eventgroup
      @eventgroup = Eventgroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eventgroup_params
      params.require(:eventgroup).permit(:name, :description, :regstartdate, :regenddate, :startdate, :enddate, :isactive, :venue)
    end
end
