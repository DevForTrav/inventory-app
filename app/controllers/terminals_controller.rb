class TerminalsController < ApplicationController
  before_action :set_terminal, only: %i[ show edit update destroy ]

  # GET /terminals or /terminals.json
  def index
    @terminals = Terminal.all
  end

  # GET /terminals/1 or /terminals/1.json
  def show
  end

  # GET /terminals/new
  def new
    @terminal = Terminal.new
  end

  # GET /terminals/1/edit
  def edit
  end

  # POST /terminals or /terminals.json
  def create
    @terminal = Terminal.new(terminal_params)

    respond_to do |format|
      if @terminal.save
        format.html { redirect_to terminal_url(@terminal), notice: "Terminal was successfully created." }
        format.json { render :show, status: :created, location: @terminal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @terminal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /terminals/1 or /terminals/1.json
  def update
    respond_to do |format|
      if @terminal.update(terminal_params)
        format.html { redirect_to terminal_url(@terminal), notice: "Terminal was successfully updated." }
        format.json { render :show, status: :ok, location: @terminal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @terminal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /terminals/1 or /terminals/1.json
  def destroy
    @terminal.destroy

    respond_to do |format|
      format.html { redirect_to terminals_url, notice: "Terminal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_terminal
      @terminal = Terminal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def terminal_params
      params.require(:terminal).permit(:name, :abbreviation, :quantity, :prepped_wire_id)
    end
end
