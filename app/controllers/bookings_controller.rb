# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  # GET /bookings
  # GET /bookings.json
  def index; end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @final = Booking.find(params[:id])
    @booking_final = RoomBooking.where(booking_id: @final.id)

    
    respond_to do |format|
      format.html
      format.pdf do
          render pdf: "Invoice No",
          page_size: 'A4',
          template: "bookings/show.html.erb",
          layout: "pdf.html",
          orientation: "Landscape",
          lowquality: true,
          zoom: 1,
          dpi: 75
      end
    end
  end


  def avail_date

  rooms = Room.joins(:room_bookings).where.not("((room_bookings.check_in between ? AND ?) OR (room_bookings.check_out between ? AND ?))", params[:check_in], params[:check_out], params[:check_in], params[:check_out]).where(hotel_id: params[:hotel_id]).uniq

    @room_category=[]

       rooms.each do |room|
       @room_category.push(Category.find_by(id: room.category_id))
       end
   
     # render json: {rooms: final}
  render json: {rooms: rooms, category: @room_category}


  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    @spclroom = Room.where('hotel_id=?', params[:format])
    @avail = @spclroom.available_rooms.map { |room| [room.display_room, room.id] }
    @hotel_id = params[:format]
  end

  # GET /bookings/1/edit
  def edit; end

  # POST /bookings
  # POST /bookings.json
  def create

    @booking = current_user.bookings.build(booking_params)
  

    room_numbers = @booking.room_bookings.first.room_id
    room_ids = Room.find_by(room_number: room_numbers).id
    
    @booking.room_bookings.first.room_id = room_ids
     
    
  
    #@rooms = Room.where(id: room_ids).update_all(availibility: false)
    # @room.each do |room|
    #   room.availibility = false
    #   room.save
    # end

    respond_to do |format|
      if @booking.save!

        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }

      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
    render :confirm
  end

def show_room
  
  room= Room.find_by(room_number: params[:room_id])
   render json: { room_price: room.category }
  
end



  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:hotel_id, room_bookings_attributes: %i[id room_id check_in check_out _destroy], categories_attributes: %i[id name _destroy])
    # byebug
  end
end
