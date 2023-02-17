require 'csv'
require 'chartkick'

class EcgsController < ApplicationController
  before_action :set_ecg, only: %i[ show edit update destroy ]

  # GET /ecgs or /ecgs.json
  def index
    url = 'test.csv'
    @array = CSV.read(url).drop(1)
    @maxs = []
    tmp_array = []
    inArray = false
    @array.each do |item|
        if item[1].to_i > 1127
          if inArray == true
            tmp_array << item
          else
            tmp_array << item
            inArray = true
          end
        else
          if inArray == true
            @maxs << tmp_array
            tmp_array = []
            inArray = false
          end
        end
    end

    @peeks = []

    @maxs.each do |peek|
      @peeks << peek.max
    end

    @max_value = (@array.map { |item| item[1].to_i }).max
  end

  # GET /ecgs/1 or /ecgs/1.json
  def show
  end

  # GET /ecgs/new
  def new
    @ecg = Ecg.new
  end

  # GET /ecgs/1/edit
  def edit
  end

  # POST /ecgs or /ecgs.json
  def create
    @ecg = Ecg.new(ecg_params)

    respond_to do |format|
      if @ecg.save
        format.html { redirect_to ecg_url(@ecg), notice: "Ecg was successfully created." }
        format.json { render :show, status: :created, location: @ecg }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ecg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ecgs/1 or /ecgs/1.json
  def update
    respond_to do |format|
      if @ecg.update(ecg_params)
        format.html { redirect_to ecg_url(@ecg), notice: "Ecg was successfully updated." }
        format.json { render :show, status: :ok, location: @ecg }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ecg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ecgs/1 or /ecgs/1.json
  def destroy
    @ecg.destroy

    respond_to do |format|
      format.html { redirect_to ecgs_url, notice: "Ecg was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ecg
      @ecg = Ecg.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ecg_params
      params.require(:ecg).permit(:name, :facts)
    end
end
