class WiringHarnessConnectorsController < ApplicationController
  before_action :set_wiring_harness_connector, only: %i[ show edit update destroy ]
  before_action :set_wiring_harness, only: %i[ new create show edit update ]

  # GET /wiring_harness_connectors or /wiring_harness_connectors.json
  def index
    @wiring_harness_connectors = WiringHarnessConnector.includes(:connector).all
    # @wiring_harness = @wiring_harness_connectors.first.wiring_harness
  end

  # GET /wiring_harness_connectors/1 or /wiring_harness_connectors/1.json
  def show
  end

  # GET /wiring_harness_connectors/new
  def new
    if params[:wiring_harness_id]
      @wiring_harness_connector = @wiring_harness.wiring_harness_connectors.build()
    else
      @wiring_harness_connector = WiringHarnessConnector.new(wiring_harness_connector_params)
    end
  end
  
  # GET /wiring_harness_connectors/1/edit
  def edit
  end
  
  # POST /wiring_harness_connectors or /wiring_harness_connectors.json
  def create
    if params[:wiring_harness_id]
      debugger
      @wiring_harness_connector = @wiring_harness.wiring_harness_connectors.build(wiring_harness_connector_params)
    else
      @wiring_harness_connector = WiringHarnessConnector.new(wiring_harness_connector_params)
    end

    # @wiring_harness_connector.wiring_harness_id = params[:wiring_harness_id] unless @wiring_harness.save
    respond_to do |format|
      if @wiring_harness_connector.save
        format.html { redirect_to wiring_harness_path(@wiring_harness_connector.wiring_harness_id), notice: "Wiring harness connector was successfully created." }
        format.json { render :show, status: :created, location: @wiring_harness_connector }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wiring_harness_connector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wiring_harness_connectors/1 or /wiring_harness_connectors/1.json
  def update
    respond_to do |format|
      if @wiring_harness_connector.update(wiring_harness_connector_params)
        format.html { redirect_to wiring_harness_connector_url(@wiring_harness_connector), notice: "Wiring harness connector was successfully updated." }
        format.json { render :show, status: :ok, location: @wiring_harness_connector }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wiring_harness_connector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wiring_harness_connectors/1 or /wiring_harness_connectors/1.json
  def destroy
    @wiring_harness_connector.destroy

    respond_to do |format|
      format.html { redirect_to wiring_harness_connectors_url, notice: "Wiring harness connector was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiring_harness_connector
      @wiring_harness_connector = WiringHarnessConnector.find(params[:id])
    end

    def set_wiring_harness
      @wiring_harness = WiringHarness.find(params[:wiring_harness_id]) if  params[:wiring_harness_id]
    end

    def wiring_harness_connector_params
      params.require(:wiring_harness_connector).permit(:wiring_harness_id, :connector_id)
    end
end
