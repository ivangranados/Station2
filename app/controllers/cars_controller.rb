class CarsController < ApplicationController
  def index
    if user_signed_in?   
    @cars = Car.where(:user_id => current_user.id)
    @user = current_user
    else 
    end 
  end

  def show
    @cars = Car.find(params[:id])
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    logger.info @car.inspect
    if @car.update_attributes(params[:car])
      flash[:notice] = "Auto actualizado exitosamente"
      redirect_to (cars_path)
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render :action => "edit"
    end
  end

  def destroy
    TankingLog.where(:car_id => params[:id]).destroy_all
    Car.find(params[:id]).destroy
    flash[:notice] = "Auto borrado exitosamente"
    redirect_to (root_path)
  end

  def new
    @car = Car.new
    
  end

  def create
    @car = Car.new(params[:car])
    @car.user_id = current_user.id
    if @car.save
      flash[:notice] = "Auto creado exitosamente"
      redirect_to (cars_path)
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render :action => "new"
    end
    
  end
end
