class ClimatizadorsController < ApplicationController
  before_action :set_climatizador, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /climatizadors
  # GET /climatizadors.json
  def index
    @climatizadors = Climatizador.all
  end

  # GET /climatizadors/1
  # GET /climatizadors/1.json
  def show
  end

  # GET /climatizadors/new
  def new
    @climatizador = Climatizador.new
  end

  # GET /climatizadors/1/edit
  def edit
  end

  # POST /climatizadors
  # POST /climatizadors.json
  def create
    @climatizador = Climatizador.new(climatizador_params)

    respond_to do |format|
      if @climatizador.save

        @data = Time.at(@climatizador[:created_at]).to_datetime
        @data_str = "\"data\":"  << "\"" << @data.utc.strftime('%m/%d/%Y %H:%M %p')  << "\""
        @temperatura_str = "\"temperatura\":" << @climatizador[:temperatura].to_s
        @novo_registro = "{" << @data_str << "," << @temperatura_str << "}"
        
        @climatizador[:historico] << @novo_registro
        @climatizador.save

        format.html { redirect_to @climatizador, notice: 'Climatizador was successfully created.' }
        format.json { render :show, status: :created, location: @climatizador }
      else
        format.html { render :new }
        format.json { render json: @climatizador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /climatizadors/1
  # PATCH/PUT /climatizadors/1.json
  def update
    respond_to do |format|
      if @climatizador.update(climatizador_params)

        @data = Time.at(@climatizador[:updated_at]).to_datetime
        @data_str = "\"data\":"  << "\"" << @data.utc.strftime('%m/%d/%Y %H:%M %p')  << "\""
        @temperatura_str = "\"temperatura\":" << @climatizador[:temperatura].to_s
        @novo_registro = "{" << @data_str << "," << @temperatura_str << "}"

        @historico = @climatizador[:historico]
        @historico = @historico + "," + @novo_registro
        
        @climatizador.update_attribute(:historico , @historico)

        format.html { redirect_to @climatizador, notice: 'Climatizador was successfully updated.' }
        format.json { render :show, status: :ok, location: @climatizador }
      else
        format.html { render :edit }
        format.json { render json: @climatizador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /climatizadors/1
  # DELETE /climatizadors/1.json
  def destroy
    @climatizador.destroy
    respond_to do |format|
      format.html { redirect_to climatizadors_url, notice: 'Climatizador was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_climatizador
      @climatizador = Climatizador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def climatizador_params
      params.require(:climatizador).permit(:temperatura, :usuario_id, :historico)
    end
end
