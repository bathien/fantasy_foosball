class TeamsController < ApplicationController
  before_action :set_team, only: %i[show edit update destroy]

  def index
    @teams = Team.includes(:players).all
  end

  def show; end

  def new
    @team = Team.new
    2.times { @team.players.build }
  end

  def edit
    (2 - @team.players.size).times { @team.players.build }
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to @team, notice: 'Team was successfully created.'
    else
      (2 - @team.players.size).times { @team.players.build }
      render :new
    end
  end

  # PATCH/PUT /Teams/1
  # PATCH/PUT /Teams/1.json
  def update
    if @team.update!(team_params)
      redirect_to @team, notice: 'Team was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /Teams/1
  # DELETE /Teams/1.json
  def destroy
    @team.destroy
    redirect_to teams_url, notice: 'Team was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def team_params
    params.require(:team).permit(:name, players_attributes: [:first_name, :last_name])
  end
end
