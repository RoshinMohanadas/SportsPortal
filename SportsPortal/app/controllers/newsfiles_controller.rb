class NewsfilesController < ApplicationController
  before_action :set_newsfile, only: [:show, :edit, :update, :destroy]

  # GET /newsfiles
  # GET /newsfiles.json
  def index
    @newsfiles = Newsfile.all
  end

  # GET /newsfiles/1
  # GET /newsfiles/1.json
  def show
  end

  # GET /newsfiles/new
  def new
    @newsfile = Newsfile.new
  end

  # GET /newsfiles/1/edit
  def edit
  end

  # POST /newsfiles
  # POST /newsfiles.json
  def create
    @newsfile = Newsfile.new(newsfile_params)

    respond_to do |format|
      if @newsfile.save
        format.html { redirect_to @newsfile, notice: 'Newsfile was successfully created.' }
        format.json { render :show, status: :created, location: @newsfile }
      else
        format.html { render :new }
        format.json { render json: @newsfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newsfiles/1
  # PATCH/PUT /newsfiles/1.json
  def update
    respond_to do |format|
      if @newsfile.update(newsfile_params)
        format.html { redirect_to @newsfile, notice: 'Newsfile was successfully updated.' }
        format.json { render :show, status: :ok, location: @newsfile }
      else
        format.html { render :edit }
        format.json { render json: @newsfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newsfiles/1
  # DELETE /newsfiles/1.json
  def destroy
    @newsfile.destroy
    respond_to do |format|
      format.html { redirect_to newsfiles_url, notice: 'Newsfile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsfile
      @newsfile = Newsfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsfile_params
      params.require(:newsfile).permit(:title, :description)
    end
end
