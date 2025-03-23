module Classifieds
  class CarPartsController < ApplicationController
    before_action :set_classifieds_car_part, only: %i[ show edit update destroy ]

    # GET /classifieds/car_parts or /classifieds/car_parts.json
    def index
      @classifieds_car_parts = Classifieds::CarPart.all
    end

    # GET /classifieds/car_parts/1 or /classifieds/car_parts/1.json
    def show
    end

    # GET /classifieds/car_parts/new
    def new
      @classifieds_car_part = Classifieds::CarPart.new
    end

    # GET /classifieds/car_parts/1/edit
    def edit
    end

    # POST /classifieds/car_parts or /classifieds/car_parts.json
    def create
      @classifieds_car_part = Classifieds::CarPart.new(classifieds_car_part_params)

      respond_to do |format|
        if @classifieds_car_part.save
          format.html { redirect_to @classifieds_car_part, notice: "Car part was successfully created." }
          format.json { render :show, status: :created, location: @classifieds_car_part }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @classifieds_car_part.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /classifieds/car_parts/1 or /classifieds/car_parts/1.json
    def update
      respond_to do |format|
        if @classifieds_car_part.update(classifieds_car_part_params)
          format.html { redirect_to @classifieds_car_part, notice: "Car part was successfully updated." }
          format.json { render :show, status: :ok, location: @classifieds_car_part }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @classifieds_car_part.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /classifieds/car_parts/1 or /classifieds/car_parts/1.json
    def destroy
      @classifieds_car_part.destroy!

      respond_to do |format|
        format.html { redirect_to classifieds_parts_path, status: :see_other, notice: "Car part was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_classifieds_car_part
        @classifieds_car_part = Classifieds::CarPart.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def classifieds_car_part_params
        params.fetch(:classifieds_car_part, {})
      end

    def authorize_owner!
      unless Current.user&.admin? || @classifieds_car_part.user == Current.user
        flash[:alert] = 'You are not authorized to edit this listing.'
        redirect_to @classifieds_car_part
      end
    end
  end
end
