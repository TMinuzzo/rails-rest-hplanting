class RelatoriosController < ApplicationController
  before_action :set_relatorio, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  
  # GET /relatorios
  # GET /relatorios.json
  def index
    @relatorios = Relatorio.all
  end

  # GET /relatorios/1
  # GET /relatorios/1.json
  def show
  end

  # GET /relatorios/new
  def new
    @relatorio = Relatorio.new
  end

  # GET /relatorios/1/edit
  def edit
  end

  # POST /relatorios
  # POST /relatorios.json
  def create
    @relatorio = Relatorio.new(relatorio_params)

    respond_to do |format|
      if @relatorio.save
        format.html { redirect_to @relatorio, notice: 'Relatorio was successfully created.' }
        format.json { render :show, status: :created, location: @relatorio }
      else
        format.html { render :new }
        format.json { render json: @relatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relatorios/1
  # PATCH/PUT /relatorios/1.json
  def update
    respond_to do |format|
      if @relatorio.update(relatorio_params)
        format.html { redirect_to @relatorio, notice: 'Relatorio was successfully updated.' }
        format.json { render :show, status: :ok, location: @relatorio }
      else
        format.html { render :edit }
        format.json { render json: @relatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relatorios/1
  # DELETE /relatorios/1.json
  def destroy
    @relatorio.destroy
    respond_to do |format|
      format.html { redirect_to relatorios_url, notice: 'Relatorio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def monta_relatorio

		@climatizador = Climatizador.find(params[:usuario_id])
		@umidificador = Umidificador.find(params[:usuario_id])
    puts "ENTROU NO MONTA RELATORIO"
    @climatizador_relatorio = ""
    @umidificador_relatorio = ""
    if @climatizador
		  @climatizador_relatorio = "\"climatizador\":" << "[" << @climatizador[:historico] << "]"
		end
    if @umidificador
      @umidificador_relatorio = "\"umidificador\":" << "[" << @umidificador[:historico] << "]"
    end
		@relatorio_total = "{" << @climatizador_relatorio << "," << @umidificador_relatorio < "}"

    render json: @relatorio_total
		return @relatorio_total
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relatorio
      @relatorio = Relatorio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relatorio_params
      params.fetch(:relatorio, {})
    end
end
