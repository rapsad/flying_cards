class PanelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_panel, only: [:show, :edit, :update, :destroy]

  # GET /panels
  def index
    @panels = Panel.all
  end

  # GET /panels/1
  def show
    @cards = @panel.cards
  end

  # GET /panels/new
  def new
    @panel = Panel.new
  end

  # GET /panels/1/edit
  def edit
  end

  # POST /panels
  def create
    @panel = Panel.new(panel_params)

    if @panel.save
      redirect_to @panel, notice: 'Panel was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /panels/1
  def update
    if @panel.update(panel_params)
      redirect_to @panel, notice: 'Panel was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /panels/1
  def destroy
    @panel.destroy
    redirect_to panels_url, notice: 'Panel was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_panel
      @panel = Panel.includes(:cards).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def panel_params
      params.require(:panel).permit(:name)
    end
end
