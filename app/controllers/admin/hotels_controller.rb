class Admin::HotelsController < ApplicationController
    before_action :set_hotel, only: [:edit, :update, :show, :destroy]

    def index
        @hotels = Hotel.hotel_with_brands
    end

    def new
        @hotel = Hotel.new
    end

    def create
        @hotel = Hotel.new(hotel_params)

        respond_to do |format|
           if @hotel.save
                format.html { redirect_to admin_hotels_path }
            else
                format.html { render 'new' }
            end
        end
    end

    def edit
    end

    def show
    end

    def update
        respond_to do |format|
            if @hotel.update_attributes(hotel_params)
                format.html { redirect_to admin_hotels_path }
            else
                format.html { render 'edit' }
            end
        end
    end

    def compose_email
        respond_to do |format|
            @hotel = Hotel.find(params[:hotel_id])
            format.js
        end
    end

    def import_csv
        Hotel.import(params[:file])
        redirect_to admin_hotels_path
    end

    def destroy
        @hotels = Hotel.hotel_with_brands
        if @hotel.destroy
            flash.now[:notice] = "Hotel #{@hotel.name} successfully deleted."
        else
            flash.now[:error] = "Cannot delete this hotel, associations still exist."
        end
        render action: :index
    end

    private

        def hotel_params
            params.require(:hotel).permit(:name, :brand_id, :shipping_address, :address_id, :email, :notes, :contact_number)
        end

        def set_hotel
            @hotel = Hotel.friendly.find(params[:id])
        end

end
