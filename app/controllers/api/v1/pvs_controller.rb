module Api
  module V1
    class PvsController < ApplicationController
      protect_from_forgery with: :null_session, if: ->{request.format.json?}
      # before_action :set_pv, only: [:show, :update, :destroy]
      #
      # # GET /pvs
      # # GET /pvs.json
      # def index
      #   @pvs = Pv.all
      # end
      #
      # # GET /pvs/1
      # # GET /pvs/1.json
      # def show
      # end

      # POST /pvs
      # POST /pvs.json
      def create
        @pv = Pv.new(pv_params)
        @pv.site_id.to_i
        if @pv.save
          render :show, status: :created, location: @pv
        else
          render json: @pv.errors, status: :unprocessable_entity
        end
      end
      #
      # # PATCH/PUT /pvs/1
      # # PATCH/PUT /pvs/1.json
      # def update
      #   if @pv.update(pv_params)
      #     render :show, status: :ok, location: @pv
      #   else
      #     render json: @pv.errors, status: :unprocessable_entity
      #   end
      # end
      #
      # # DELETE /pvs/1
      # # DELETE /pvs/1.json
      # def destroy
      #   @pv.destroy
      # end

      private
        # Use callbacks to share common setup or constraints between actions.
        # def set_pv
        #   @pv = Pv.find(params[:id])
        # end

        # Never trust parameters from the scary internet, only allow the white list through.
        def pv_params
          params.fetch(:pv, {})
        end
    end
  end
end
