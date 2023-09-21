class ApartmentsController < ApplicationController

    def index
        apartments = Apartment.all
        render json: apartments
    end

    def create
        apartment = Apartment.create(apartment_params)
        render json: apartment, status: :created
    end

    def show
        apartment = Apartment.find(params[:id])
        render json: apartment
    end

    def destroy
        apartment = Apartment.find_by(id: params[:id])
        if apartment
        apartment.destroy
          head :no_content
        else
          render json: { error: "Apartment not found" }, status: :not_found
        end
    end

    def update
    apartment = Apartment.find_by(id: params[:id])
        if apartment
        apartment.update(apartment_params)
          render json: apartment
        else
          render json: { error: "Apartment not found" }, status: :not_found
        end
    end

    private

    def apartment_params
        params.permit(:number)
    end

end
