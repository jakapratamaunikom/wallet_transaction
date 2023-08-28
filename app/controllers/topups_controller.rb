class TopupsController < ApplicationController
	before_action :set_topup, only: %i[show edit update destroy]

  # GET /topups or /topups.json
  def index
    @topups = Topup.all
  end

  # GET /topups/1 or /topups/1.json
  def show; end

  # GET /topups/new
  def new
    @topup = Topup.new
  end

  # GET /topups/1/edit
  def edit; end

  # POST /topups or /topups.json
  def create
    @topup = Topup.new(topup_params)

    respond_to do |format|
      if @topup.save
        format.html { redirect_to topup_url(@topup), notice: 'Topup was successfully created.' }
        format.json { render :show, status: :created, location: @topup }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @topup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topups/1 or /topups/1.json
  def update
    respond_to do |format|
      if @topup.update(topup_params)
        format.html { redirect_to topup_url(@topup), notice: 'Topup was successfully updated.' }
        format.json { render :show, status: :ok, location: @topup }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @topup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topups/1 or /topups/1.json
  def destroy
    @topup.destroy

    respond_to do |format|
      format.html { redirect_to topups_url, notice: 'Topup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_topup
    @topup = Topup.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def topup_params
    params.require(:topup).permit(:amount, :sender_id, :receiver_id)
  end
end
