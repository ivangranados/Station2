class GasStationsController < ApplicationController
  def new
    @gas_station = GasStation.new
    @show = GasStation.all
  end

  def create
    @gas_station = GasStation.new(params[:gas_station])
    
    if @gas_station.save
      flash[:notice] = "Estacion de Gasolina Creada Exitosamente"
      redirect_to (car_tanking_logs_path)
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      flash[:notice] = "Estacion de Gasolina Ya Existe"
      @show = GasStation.all
      render :action => "new"
    end

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end
end
