class BugsController < ApplicationController

  before_action :check_if_logged_in, except: [ :index, :show ]

  def new
    #bringing the project_id from the project show page and we're getting the project info from DB
    @project = Project.find params[:project_id]
    #initializing a new Bug
    @bug = Bug.new
    #saving project as the new bug project
    @bug.project = @project

  end

  def create
    params[:bug][:user_id] = @current_user.id
    @bug = Bug.create bug_params

    # check_ownership
    redirect_to project_path(@bug.project_id)
  end

  def index
    @bugs = Bug.all
  end

  def show
    @bug = Bug.find params[:id]
    @project_id = @bug.project.id
  end

  def edit
    @bug = Bug.find params[:id]
    check_ownership
  end

  def update
    @bug = Bug.find params[:id]

    check_ownership

    # Actually update the database

    # @bug.name = params[:name]
    # raise 'hell'
      @bug.update bug_params

    redirect_to project_path(@bug.project.id)
  end

  def destroy

    Bug.destroy params[:id]


    redirect_to project_path(params[:project_id])
  end

  private
  def check_ownership
    redirect_to login_path and return unless @current_user.present? && ( @current_user.admin? || @bug.user == @current_user || @bug.project.user == @current_user )
  end

  private
  def bug_params
    params.require(:bug).permit( :name, :priority, :team_member, :status, :start_date, :due_date, :project_id, :user_id )
  end

end
