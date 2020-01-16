class ProjectsController < ApplicationController

  before_action :check_if_logged_in

  def new
    @project = Project.new
  end

  def create

    # raise 'hell'

    # 1.
    #project = Project.create name: params[:project][:name], user: @current_user

    # 2.
    #@current_user.projects.create name: params[:project][:name]
    #@current_user.projects << project

    # 3.
    @current_user.projects.create project_params

    redirect_to projects_path #index of projects
  end

  def index
    @projects = Project.where user: @current_user

    if @current_user.admin
      @projects = Project.all
    end
  end

  def show
    @project = Project.find params[:id]
    redirect_to projects_path if @project == nil
  end

  def edit
    @project = Project.find params[:id]
   check_ownership
  end

  def update

    @project = Project.find params[:id]

    redirect_to login_path and return unless @project.users.includes @current_user

    # Actually update the database

    # @project.name = params[:name]
      @project.update project_params


    redirect_to project_path(@project.id)
  end

  def destroy
    Project.destroy params[:id]

  redirect_to projects_path
  end

  private
  def check_ownership
    redirect_to login_path and return unless @project.users.includes @current_user
  end

  private
  def project_params
    params.require(:project).permit( :name, :priority, :to, :frontend, :backend, :customer, user_ids: [] )
  end

end
