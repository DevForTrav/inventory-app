class WiringHarnessesController < ApplicationController
  before_action :set_wiring_harness, only: %i[ show edit update destroy ]

  # GET /wiring_harnesses or /wiring_harnesses.json
  def index
    @wiring_harnesses = WiringHarness.all.includes(:user)
  end

  # GET /wiring_harnesses/1 or /wiring_harnesses/1.json
  def show
    @wiring_harness_connectors = WiringHarnessConnector.where(wiring_harness_id: params[:id]).includes(:connector)

    @terminals = Terminal.where(connector_id: @wiring_harness_connectors.pluck(:connector_id))
    # @terminals = @wiring_harnesse.terminals
  end

  # GET /wiring_harnesses/new
  def new
    @wiring_harness = WiringHarness.new
  end

  # GET /wiring_harnesses/1/edit
  def edit
  end

  # POST /wiring_harnesses or /wiring_harnesses.json
  def create
    @wiring_harness = WiringHarness.new(wiring_harness_params)

    respond_to do |format|
      if @wiring_harness.save
        format.html { redirect_to wiring_harness_url(@wiring_harness), notice: "Wiring harness was successfully created." }
        format.json { render :show, status: :created, location: @wiring_harness }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wiring_harness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wiring_harnesses/1 or /wiring_harnesses/1.json
  def update
    respond_to do |format|
      if @wiring_harness.update(wiring_harness_params)
        format.html { redirect_to wiring_harness_url(@wiring_harness), notice: "Wiring harness was successfully updated." }
        format.json { render :show, status: :ok, location: @wiring_harness }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wiring_harness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wiring_harnesses/1 or /wiring_harnesses/1.json
  def destroy
    @wiring_harness.destroy

    respond_to do |format|
      format.html { redirect_to wiring_harnesses_url, notice: "Wiring harness was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiring_harness
      if action_name == :show
        @wiring_harness =  WiringHarness.includes(:connectors, :circuits).find(params[:id])
      else
        @wiring_harness = WiringHarness.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def wiring_harness_params
      params.require(:wiring_harness).permit(:name, :company, :weekly_quantity, :harnesses_completed, :user_id)
    end
end
