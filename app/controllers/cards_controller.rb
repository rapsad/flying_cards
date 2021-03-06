class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  def index
    @cards = Card.where(panel_id: params[:panel_id])
      .paginate(:page => params[:page], :per_page => 15)
  end

  # GET /cards/1
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
    @card.panel = Panel.find(params[:panel_id])
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to panel_cards_url(panel_id: params[:panel_id]), notice: 'Card was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cards/1
  def update

    if @card.update(card_params)
      redirect_to panel_cards_url(panel_id: params[:panel_id]), notice: 'Card was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cards/1
  def destroy
    @card.destroy
    redirect_to panel_cards_url, notice: 'Card was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def card_params
      params.require(:card).permit(:text, :translation, :panel_id)
    end
end
