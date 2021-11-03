class SpicesController < ApplicationController

    # Get
    def index
        spice = Spice.all
        render json: spice
    end

    def create 
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def show
        spice = find_spice
        if spice
            render json: spice 
        else 
            render_not_found
        end
    end

    def update
        spice = find_spice
        if spice
            spice.update(spice_params)
            render json: spice
        else
            render_not_found
        end
    end

    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
        rescue ActiveRecord::RecordNotFound
            render_not_found
        
    end


    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        Spice.find(params[:id])
    end

    def render_not_found
        render json: {error: "Spice not found!"}, status: :not_found
    end
end
