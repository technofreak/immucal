class ChildrenController < ApplicationController
  load_and_authorize_resource

  include VaccinesHelper

  def show
    @newchild = current_user.children.new
    @child = current_user.children.find_by_id(params[:id])
    @child.vaccinations.find_all_by_status("notgiven").each { |vaccination|
      if vaccination.due_start <= Date.today + 30
        vaccination.update_attribute("status", "duenow")
      end
    }
  end
  
  def new
    @newchild = current_user.children.new
  end

  def create
    params[:child][:date_of_birth] = Date.civil(params[:child]["date_of_birth(1i)"].to_i,
                                                params[:child]["date_of_birth(2i)"].to_i,
                                                params[:child]["date_of_birth(3i)"].to_i)
    child = current_user.children.create(params[:child])
    respond_to do |format|
      format.html { redirect_to :back }
      format.js 
    end
  end

  def edit
    @child = current_user.children.find_by_id(params[:id])
  end

  def update
    params[:child][:date_of_birth] = Date.civil(params[:child]["date_of_birth(1i)"].to_i,
                                                params[:child]["date_of_birth(2i)"].to_i,
                                                params[:child]["date_of_birth(3i)"].to_i)
    if current_user.children.find_by_id(params[:id]).update_attributes(params[:child])
      flash[:success] = "Successfully updated your profile"
      redirect_to root_url
    end
  end

  def destroy
    current_user.children.find_by_id(params[:id]).destroy
    flash[:success] = "Successfully deleted."
    redirect_to root_url
  end
end
