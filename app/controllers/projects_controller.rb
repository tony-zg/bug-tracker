class ProjectsController < ApplicationController

  before_action :check_if_logged_in, except: [ :index, :show ]

  def new
    @project = Project.new
  end

  def create

    # 1.
    #project = Project.create name: params[:project][:name], user: @current_user

    # 2.
    #@current_user.projects.create name: params[:project][:name]
    #@current_user.projects << project

    # 3.
    @current_user.projects.create name: params[:project][:name]

    redirect_to projects_path #index of projects
  end

  def index
    # @projects = Project.where user: @current_user
    @projects = Project.all
  end

  def show
    @project = Project.find params[:id]
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
    # raise 'hell'
      @project.update name: params[:project][:name]

    redirect_to project_path(@project.id)
  end

  def destroy
  end

  private
  def check_ownership
    redirect_to login_path and return unless @project.users.includes @current_user
  end


end
