class UmidificadorsController < ApplicationController
  before_action :set_umidificador, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /umidificadors
  # GET /umidificadors.json
  def index
    @umidificadors = Umidificador.all
  end

  # GET /umidificadors/1
  # GET /umidificadors/1.json
  def show
  end

  # GET /umidificadors/new
  def new
    @umidificador = Umidificador.new
  end

  # GET /umidificadors/1/edit
  def edit
  end

  # POST /umidificadors
  # POST /umidificadors.json
  def create
    @umidificador = Umidificador.new(umidificador_params)

    respond_to do |format|
      if @umidificador.save
        format.html { redirect_to @umidificador, notice: 'Umidificador was successfully created.' }
        format.json { render :show, status: :created, location: @umidificador }
      else
        format.html { render :new }
        format.json { render json: @umidificador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /umidificadors/1
  # PATCH/PUT /umidificadors/1.json
  def update
    respond_to do |format|
      if @umidificador.update(umidificador_params)
        format.html { redirect_to @umidificador, notice: 'Umidificador was successfully updated.' }
        format.json { render :show, status: :ok, location: @umidificador }
      else
        format.html { render :edit }
        format.json { render json: @umidificador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /umidificadors/1
  # DELETE /umidificadors/1.json
  def destroy
    @umidificador.destroy
    respond_to do |format|
      format.html { redirect_to umidificadors_url, notice: 'Umidificador was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_umidificador
      @umidificador = Umidificador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def umidificador_params
      params.require(:umidificador).permit(:umidade)
    end
end
