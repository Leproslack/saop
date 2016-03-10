class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]


  def index
    @stores = Store.all
  end


  def show
  end

  def new
    @store = Store.new
  end

  def edit
  end


  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Вы успешно добавили магазин.' }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Вы успешно обновили информацию о магазине.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'Вы успешно удалили магазин.' }
      format.json { head :no_content }
    end
  end

  private

    def set_store
      @store = Store.find(params[:id])
    end

    def store_params
      params.require(:store).permit(:store_name, :store_adress, :store_caregory)
    end
end
