class DestinationsController < ApplicationController
    def index
        @destinations = Destination.all
        @bloggers = Blogger.all
        render :index
    end

    def show
        @destination = Destination.find(params[:id])
        render :show
    end
end
