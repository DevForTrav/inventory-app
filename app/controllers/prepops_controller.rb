class PrepopsController < ApplicationController
  before_action :set_prepop, only: %i[ show edit update destroy ]

  # GET /prepops or /prepops.json
  def index
    @prepops = Prepop.all
  end

  # GET /prepops/1 or /prepops/1.json
  def show
  end

  # GET /prepops/new
  def new
    @prepop = Prepop.new
  end

  # GET /prepops/1/edit
  def edit
  end

  # POST /prepops or /prepops.json
  def create
    @prepop = Prepop.new(prepop_params)

    respond_to do |format|
      if @prepop.save
        format.html { redirect_to prepop_url(@prepop), notice: "Prepop was successfully created." }
        format.json { render :show, status: :created, location: @prepop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prepop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prepops/1 or /prepops/1.json
  def update
    respond_to do |format|
      if @prepop.update(prepop_params)
        format.html { redirect_to prepop_url(@prepop), notice: "Prepop was successfully updated." }
        format.json { render :show, status: :ok, location: @prepop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prepop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prepops/1 or /prepops/1.json
  def destroy
    @prepop.destroy

    respond_to do |format|
      format.html { redirect_to prepops_url, notice: "Prepop was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prepop
      @prepop = Prepop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prepop_params
      params.require(:prepop).permit(:name, :wire_harness_id, :weekly_need, :weekly_quantity, :due_date)
    end
end
