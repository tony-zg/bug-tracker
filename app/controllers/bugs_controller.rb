class BugsController < ApplicationController

  before_action :check_if_logged_in, except: [ :index, :show ]

  def new
    @bugs = Bug.new
  end

  def create
    @current_project.bugs.create bug_params

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

    redirect_to login_path and return unless @bug.project @current_project

    # Actually update the database

    # @bug.name = params[:name]
    # raise 'hell'
      @bug.update name: params[:bug][:name]

    redirect_to bug_path(@bug.id)
  end

  def destroy
    Bug.destroy params[:id]

    redirect_to bugs_path
  end

  private
  def check_ownership
    redirect_to login_path and return unless @bug.project @current_project
  end

  private
  def bug_params
    params.require(:bug).permit( :name, :priority, :team_member, :status, :start_date, :due_date, :project_id, :user_id )
  end

end
