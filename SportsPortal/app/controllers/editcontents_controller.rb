class EditcontentsController < ApplicationController
  before_action :set_editcontent, only: [:show, :edit, :update, :destroy]
  $homecontent = Editcontent.first
  # GET /editcontents
  # GET /editcontents.json
  def index
    @editcontents = Editcontent.all
  end

  # GET /editcontents/1
  # GET /editcontents/1.json
  def show
  end

  # GET /editcontents/new
  def new
    @editcontent = Editcontent.new
  end

  # GET /editcontents/1/edit
  def edit
  end

  # POST /editcontents
  # POST /editcontents.json
  def create
    @editcontent = Editcontent.new(editcontent_params)

    respond_to do |format|
      if @editcontent.save
        format.html { redirect_to @editcontent, notice: 'Editcontent was successfully created.' }
        format.json { render :show, status: :created, location: @editcontent }
      else
        format.html { render :new }
        format.json { render json: @editcontent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /editcontents/1
  # PATCH/PUT /editcontents/1.json
  def update
    respond_to do |format|
      if @editcontent.update(editcontent_params)
        format.html { redirect_to @editcontent, notice: 'HomeContents were successfully updated.' }
        format.json { render :show, status: :ok, location: @editcontent }
      else
        format.html { render :edit }
        format.json { render json: @editcontent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editcontents/1
  # DELETE /editcontents/1.json
  def destroy
    @editcontent.destroy
    respond_to do |format|
      format.html { redirect_to editcontents_url, notice: 'Editcontent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editcontent
      @editcontent = Editcontent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def editcontent_params
      params.require(:editcontent).permit(:welcometext, :about, :facilities, :contact)
    end
end
