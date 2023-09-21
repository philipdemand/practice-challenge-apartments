class LeasesController < ApplicationController

    def index
        leases = Lease.all
        render json: leases
    end

    def create
        lease = Lease.create(lease_params)
        render json: lease, status: :created
    end

    def show
        lease = Lease.find(params[:id])
        render json: lease
    end

    def destroy
        lease = Lease.find_by(id: params[:id])
        if lease
        lease.destroy
          head :no_content
        else
          render json: { error: "Lease not found" }, status: :not_found
        end
    end

    private

    def lease_params
        params.permit(:rent, :tenant_id, :apartment_id)
    end

end
