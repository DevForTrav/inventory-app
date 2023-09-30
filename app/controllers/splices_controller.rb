class SplicesController < ApplicationController
  before_action :set_splice, only: %i[ show edit update destroy ]

  # GET /splicees or /splicees.json
  def index
    @splices = Splice.all.includes(:user).includes(:circuits)
  end

  # GET /splicees/1 or /splicees/1.json
  def show
    # @terminals = @splicee.terminals
  end

  # GET /splicees/new
  def new
    @splice = Splice.new
  end

  # GET /splicees/1/edit
  def edit
  end

  # POST /splicees or /splicees.json
  def create
    @splice = Splice.new(splice_params)

    respond_to do |format|
      if @splice.save
        format.html { redirect_to splice_url(@splice), notice: "Wiring harness was successfully created." }
        format.json { render :show, status: :created, location: @splice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @splice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /splicees/1 or /splicees/1.json
  def update
    respond_to do |format|
      if @splice.update(splice_params)
        format.html { redirect_to splice_url(@splice), notice: "Wiring harness was successfully updated." }
        format.json { render :show, status: :ok, location: @splice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @splice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /splicees/1 or /splicees/1.json
  def destroy
    @splice.destroy

    respond_to do |format|
      format.html { redirect_to splicees_url, notice: "Wiring harness was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_splice
    @splice = Splice.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def splice_params
    params.require(:splice).permit(:length, :terminal_id, :quantity, :status, :circuit_id, :uncut_wire_id)
  end
end
