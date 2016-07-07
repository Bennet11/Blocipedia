class CollaboratorsController < ApplicationController

  def new
    @collaborator = Collaborator.new(collaborator_params)
  end

  def create
    @collaborator = Collaborator.new(collaborator_params)
    if @collaborator.save
      flash[:notice] = "Collaborator saved successfully"
      redirect_to @wiki
    else
      flash[:error] = "Failed to save collaborator"
      render :edit
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Collaborator removed"
      redirect_to @wiki
    else
      flash[:error] = "Failed to remove collaborator"
      render :show
    end
  end

  private

  def collaborator_params
    params.require(:collaborator).permit(:user_id, :wiki_id)
  end
end
