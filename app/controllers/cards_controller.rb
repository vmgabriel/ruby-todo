class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.all
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
    @project = Project.find(params[:project_id])
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @project = Project.find(params[:project_id])
    @card = @project.cards.create(set_params)
    if @card.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    if params[:state] == "0" or params[:state] == "1" or params[:state] == "2"
      @card.state = params[:state]
      @card.update
      redirect_to project_path(@project)
    else
      params_edit = set_params card_params
      if @project.cards.update(params_edit)
        redirect_to project_path(@project)
      else
        render 'edit'
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    redirect_to project_path(@project)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @project = Project.find(params[:project_id])
      @card = @project.cards.find(params[:id])
    end

    def set_params(card_params)
      params = {}
      params["dateIn"] = Time.utc(card_params["dateIn(1i)"],
                                  card_params["dateIn(2i)"],
                                  card_params["dateIn(3i)"],
                                  23, 59, 59).in_time_zone("Bogota").to_json
      params["dateOut"] = Time.utc(card_params["dateOut(1i)"],
                                   card_params["dateOut(2i)"],
                                   card_params["dateOut(3i)"],
                                   23, 59, 59).in_time_zone("Bogota").to_json
      params["name"] = card_params["name"]
      params["details"] = card_params["details"]
      params["state"] = card_params["state"]
      params
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:name, :details, :dateIn, :dateOut, :state)
    end
end
