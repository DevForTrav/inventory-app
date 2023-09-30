class PreppedWiresController < ApplicationController
  before_action :set_prepped_wire, only: %i[ show edit update destroy ]

  # GET /prepped_wires or /prepped_wires.json
  def index
    @prepped_wires = PreppedWire.all.includes(:uncut_wire)
  end

  # GET /prepped_wires/1 or /prepped_wires/1.json
  def show
  end

  # GET /prepped_wires/new
  def new
    @prepped_wire = PreppedWire.new
  end

  # GET /prepped_wires/1/edit
  def edit
  end

  # POST /prepped_wires or /prepped_wires.json
  def create
    @prepped_wire = PreppedWire.new(prepped_wire_params)

    respond_to do |format|
      if @prepped_wire.save
        format.html { redirect_to prepped_wire_url(@prepped_wire), notice: "Prepped wire was successfully created." }
        format.json { render :show, status: :created, location: @prepped_wire }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prepped_wire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prepped_wires/1 or /prepped_wires/1.json
  def update
    respond_to do |format|
      if @prepped_wire.update(prepped_wire_params)
        format.html { redirect_to prepped_wire_url(@prepped_wire), notice: "Prepped wire was successfully updated." }
        format.json { render :show, status: :ok, location: @prepped_wire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prepped_wire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prepped_wires/1 or /prepped_wires/1.json
  def destroy
    @prepped_wire.destroy

    respond_to do |format|
      format.html { redirect_to prepped_wires_url, notice: "Prepped wire was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prepped_wire
      @prepped_wire = PreppedWire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prepped_wire_params
      params.require(:prepped_wire).permit(:uncut_wire_id, :p1_terminal, :p2_terminal, :length_in_cm)
    end
end
