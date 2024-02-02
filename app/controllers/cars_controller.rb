class CarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car, only: %i[ show edit update destroy ]

  # GET /cars or /cars.json
  def index
    @cars = Car.all
  end

  # GET /cars/1 or /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars or /cars.json
  def create
    @car = Car.new(car_params)

    @car.image.attach(params[:car][:image])


    # if params[:car][:image].present?
    #   uploaded_io = params[:car][:image]
    #   File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    #     file.write(uploaded_io.read)
    #   end
    #   @car.url_image = uploaded_io.original_filename
    # end

    respond_to do |format|
      if @car.save
        format.html { redirect_to car_url(@car), notice: "Veículo criado com sucesso." }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update

    @car.image.attach(params[:car][:image])


    # if params[:car][:image].present?
    #   uploaded_io = params[:car][:image]
    #   File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    #     file.write(uploaded_io.read)
    #   end
    #   @car.url_image = uploaded_io.original_filename
    # end

    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to car_url(@car), notice: "Veículo atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url, notice: "Veículo excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  # LOCAÇÃO /cars/1 or /cars/1.json 
  def status
    car = Car.find(params[:id])
    if car.liberado?
      car.locado!
    else
      car.liberado!
    end
    redirect_to car_path(car.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:name, :year, :color, :km, :status, :brand_id, :model_id, :url_image)
    end
end
