class BugsController < ApplicationController

  before_action :check_if_logged_in, except: [ :index, :show ]

  def new
    @bug = Bug.new
    # @project = Project.find params[:id] #it will work when you make add button in projects show page

  end

  def create
    @bug = Bug.create params[:id]
    check_ownership
    redirect_to bugs_path
  end

  def index
    @bugs = Bug.all
  end

  def show
    @bug = Bug.find params[:id]
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

    redirect_to bugs_path
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
