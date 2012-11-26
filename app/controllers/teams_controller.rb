class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def create
    @team = Team.create!(params[:team])

    redirect_to root_path
    # Hoa
    @team = Team.create(params[:team])
    @user = current_user
   
    if @team.save
         @user.update_attributes(:team_id => @team.id)
         flash[:notice] = "Successfully created Team."
         redirect_to teams_path(@team)
    else
        @teams = Team.all
         flash[:alert] = "There was an error in creating your team."
         render :action => 'new'
       end
  end

  def new
    # redirect_to root_path if current_user.nil?
    # Hoa
    @teams = Team.all
    @team = Team.new
    
  end

  def join
    @team = Team.find(params[:id])
    # Kingsley adds logic for adding member to team
    # Use 'current_user' as the logged-in user to assign
    # to this team.
    # Be sure to to error check things like:
    #  * There isn't more than 4 people on the team
  end

  def show
    @team = Team.find(params[:id])
    # Landon
  end
end
