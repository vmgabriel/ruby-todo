class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
    redirect_to root_path
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
    if params[:Nstate] == "0" or params[:Nstate] == "1" or params[:Nstate] == "2"
      @card.state = params[:Nstate]
      @card.update
      redirect_to project_path(@project)
    else
      set_params_object
      if @card.valid?
        @project.cards.update(set_params)
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

    def set_params
      params = {}

      params["dateIn"] = Time.utc(card_params["dateIn(1i)"],
                                  card_params["dateIn(2i)"],
                                  card_params["dateIn(3i)"],
                                  23, 59, 59).in_time_zone("Bogota").to_json
      params["dateOut"] = Time.utc(card_params["dateOut(1i)"],
                                   card_params["dateOut(2i)"],
                                   card_params["dateOut(3i)"],
                                   23, 59, 59).in_time_zone("Bogota").to_json

      params["name"] = card_params[:name]
      params["details"] = card_params[:details]
      params["state"] = card_params[:state]
      params
    end

    def set_params_object
      @card.dateIn = Time.utc(card_params["dateIn(1i)"],
                                  card_params["dateIn(2i)"],
                                  card_params["dateIn(3i)"],
                                  23, 59, 59).in_time_zone("Bogota")
      @card.dateOut = Time.utc(card_params["dateOut(1i)"],
                                   card_params["dateOut(2i)"],
                                   card_params["dateOut(3i)"],
                                   23, 59, 59).in_time_zone("Bogota").to_json

      @card.name = card_params[:name]
      @card.details = card_params[:details]
      @card.state = card_params[:state]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:name, :details, :dateIn, :dateOut, :state, :Nstate)
    end
end
