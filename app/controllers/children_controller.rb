class ChildrenController < ApplicationController
  def new
    @child = current_user.children.new
  end

  def create
    params[:child][:date_of_birth] = Date.civil(params[:child]["date_of_birth(1i)"].to_i,
                                                params[:child]["date_of_birth(2i)"].to_i,
                                                params[:child]["date_of_birth(3i)"].to_i)
    child = current_user.children.new(params[:child])
    respond_to do |format|
      format.html { redirect_to :back }
      format.js 
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
