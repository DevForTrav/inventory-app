class CircuitsController < ApplicationController
  before_action :set_circuit, only: %i[ show edit update destroy ]

  # GET /circuits
  def index
    @circuits = Circuit.all
    # get_circuit_terminals
    
  end

  # GET /circuits/1
  def show
  end

  # GET /circuits/new
  def new
    @wiring_harness = WiringHarness.find(params[:wiring_harness_id])
    @circuit = Circuit.new
  end

  # GET /circuits/1/edit
  def edit
  end

  # POST /circuits
  def create
    @circuit = Circuit.new(circuit_params)

    if @circuit.save
      redirect_to @circuit, notice: "Circuit was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /circuits/1
  def update
    if @circuit.update(circuit_params)
      redirect_to @circuit, notice: "Circuit was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /circuits/1
  def destroy
    @circuit.destroy
    redirect_to circuits_url, notice: "Circuit was successfully destroyed.", status: :see_other
  end

  private

    def get_circuit_terminals
      # indexed_terminal_ids = @circuits.index_by(&:id).transform_values { |circuit| [circuit.p1_terminal_id, circuit.p2_terminal_id] }
      # terminal_ids_array = terminal_ids.values.compact.uniq.compact.first
      # @circuit_terminals = Terminal.where(id: terminal_ids_array)

      debugger
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_circuit
      @circuit = Circuit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def circuit_params
      params.require(:circuit).permit(
        :number,
        :position,
        :length,
        :p1_terminal_id,
        :p2_terminal_id,
        :quantity,
        :wiring_harness_id
      )
    end
end
