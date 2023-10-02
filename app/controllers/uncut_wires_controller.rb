class UncutWiresController < ApplicationController
  before_action :set_uncut_wire, only: %i[ show edit update destroy ]

  # GET /uncut_wires or /uncut_wires.json
  def index
    @uncut_wires = UncutWire.all
  end

  # GET /uncut_wires/1 or /uncut_wires/1.json
  def show
  end

  # GET /uncut_wires/new
  def new
    @uncut_wire = UncutWire.new
  end

  # GET /uncut_wires/1/edit
  def edit
  end

  # POST /uncut_wires or /uncut_wires.json
  def create
    @uncut_wire = UncutWire.new(uncut_wire_params)

    respond_to do |format|
      if @uncut_wire.save
        format.html { redirect_to uncut_wires_path, notice: "Uncut wire was successfully created." }
        format.json { render :show, status: :created, location: @uncut_wire }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @uncut_wire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uncut_wires/1 or /uncut_wires/1.json
  def update
    respond_to do |format|
      if @uncut_wire.update(uncut_wire_params)
        format.html { redirect_to uncut_wire_url(@uncut_wire), notice: "Uncut wire was successfully updated." }
        format.json { render :show, status: :ok, location: @uncut_wire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @uncut_wire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uncut_wires/1 or /uncut_wires/1.json
  def destroy
    @uncut_wire.destroy

    respond_to do |format|
      format.html { redirect_to uncut_wires_url, notice: "Uncut wire was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def select_form_name

    # UncutWire.all.collect { |uncut_wire| ["#{uncut_wire.gauge} #{uncut_wire.primary_color}/#{uncut_wire.secondary_color}", uncut_wire.id] }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uncut_wire
      @uncut_wire = UncutWire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def uncut_wire_params
      params.require(:uncut_wire).permit(:gauge, :primary_color, :secondary_color, :length_in_cm, :date_ordered, :part_number)
    end
end
