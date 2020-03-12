# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :set_room, only: %i[show edit update destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @hotel = Hotel.find(params[:hotel_id])
    @rooms = Room.where(hotel_id: params[:hotel_id])
    #@room_bookings = @room_bookings.paginate(:per_page => 3, :page => params[:page])
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @room = Room.find(params[:id])
  end

  # GET /rooms/new
  def new
    @hotel = Hotel.find(params[:hotel_id])
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.find(params[:id])
  end

  # POST /rooms
  # POST /rooms.json

  def create
    @room = Room.new(room_params)
    @room.hotel_id = params[:hotel_id]
    # @hotel = Hotel.find(params[:id])
    # @room.hotel_id = params[:id]
    # @hotel_id = Hotel.find_by_id(session[:hotel])
    respond_to do |format|
      if @room.save!
        # session[:hotel_id] = @hotel.id
        # hotel_id = Hotel.find_by_id(session[:hotel_
        format.html { redirect_to hotel_rooms_path, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do   |format|
      format.html { redirect_to hotel_rooms_path(@room.hotel_id)  , notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_room
    #byebug
    @room = Room.find(params[:id])

  end

  # Only allow a list of trusted parameters through.
  private

  def room_params
    # byebug
    params.permit(:hotel_id)
    params.require(:room).permit(:room_number, :availibility, :category_id)
  end
end
