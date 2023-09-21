class TenantsController < ApplicationController

    def index
        tenants = Tenant.all
        render json: tenants
    end

    def create
        tenant = Tenant.create(tenant_params)
        render json: tenant, status: :created
    end

    def show
        tenant = Tenant.find(params[:id])
        render json: tenant
    end

    def destroy
        tenant = Tenant.find_by(id: params[:id])
        if tenant
        tenant.destroy
          head :no_content
        else
          render json: { error: "Tenant not found" }, status: :not_found
        end
    end

    def update
        tenant = Tenant.find_by(id: params[:id])
        if tenant
        tenant.update(tenant_params)
          render json: tenant
        else
          render json: { error: "Tenant not found" }, status: :not_found
        end
    end

    private

    def tenant_params
        params.permit(:name, :age)
    end

end
