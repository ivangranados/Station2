class TankingLogsController < ApplicationController
  def new
    @tanking_log = TankingLog.new
    @gas_stations = GasStation.find(:all, :order => 'name').map{|x| [x.name, x.id]}
    @tanking_log.date = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    
  end

  def create
    @tanking_log = TankingLog.new(params[:tanking_log])
    @tanking_log.car_id = params[:id]
    if @tanking_log.save
      flash[:notice] = "Tankeo Guardado"
      redirect_to (car_tanking_logs_path)
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
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
    @tanking_log = TankingLog.where(:car_id => params[:id])
    @gas_stations = GasStation.find(:all)
    @cost = @tanking_log.all.map{|x| x.cost}
    @name_cost =   @tanking_log.all.map{|x| GasStation.find(x.gas_station_id).name }
    @cost_v = [[''],[]]
    @name_cost_v = [[''],[]]
    @f_cost = @cost_v << @cost
    @f_name_cost = @name_cost_v << @name_cost
    logger.info "hello>>>><>"+ @f_cost.flatten.inspect
  end
end
