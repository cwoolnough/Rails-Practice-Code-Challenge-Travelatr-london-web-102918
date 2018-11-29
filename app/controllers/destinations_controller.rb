class DestinationsController < ApplicationController

    before_action :find_destination, only: [:show, :create] 

    def index
        @destinations = Destination.all
    end 

    def show
    end


    private

    def destination_params
        params.require(:destination).permit(:name, :country)
    end 

    def find_destination
        @destination = Destination.find(params[:id])
    end 


end
