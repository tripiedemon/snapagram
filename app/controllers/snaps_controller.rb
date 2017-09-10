class SnapsController < ApplicationController
  before_action :set_snap, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, exept: [:index, :show]

  # GET /snaps
  # GET /snaps.json
  def index
    @snaps = Snap.all
  end

  # GET /snaps/1
  # GET /snaps/1.json
  def show
  end

  # GET /snaps/new
  def new
    @snap = current_user.snaps.build
  end

  # GET /snaps/1/edit
  def edit
  end

  # POST /snaps
  # POST /snaps.json
  def create
    @snap = current_user.snaps.create(snap_params)

    respond_to do |format|
      if @snap.save
        format.html { redirect_to root_path, notice: 'Your snap is successfully added!!.' }
        format.json { render :show, status: :created, location: @snap }
      else
        format.html { render :new }
        format.json { render json: @snap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snaps/1
  # PATCH/PUT /snaps/1.json
  def update
    respond_to do |format|
      if @snap.update(snap_params)
        format.html { redirect_to @snap, notice: 'Snap was successfully updated.' }
        format.json { render :show, status: :ok, location: @snap }
      else
        format.html { render :edit }
        format.json { render json: @snap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snaps/1
  # DELETE /snaps/1.json
  def destroy
    @snap.destroy
    respond_to do |format|
      format.html { redirect_to snaps_url, notice: 'Snap was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snap
      @snap = Snap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def snap_params
      params.require(:snap).permit(:url, :caption, :user_id)
    end
end
