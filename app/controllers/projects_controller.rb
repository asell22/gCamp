class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    redirect_to project_path(@project), notice: "Project was successfully created!"
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])

  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, notice: "Projects was successfully deleted!"


  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to project_path(@project), notice: "Project was successfully updated!"
  end

private
def project_params
  params.require(:project).permit(
  :name
  )
end
end
