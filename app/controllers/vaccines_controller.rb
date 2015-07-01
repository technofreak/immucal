class VaccinesController < ApplicationController
  load_and_authorize_resource

  def index
    set_new_child
    @vaccines = Vaccine.all
  end

  def show
    set_new_child
    @vaccine = Vaccine.find_by_id(params[:id])
  end

  def new
    @vaccine = Vaccine.new
  end

  def create
    @vaccine = Vaccine.create(params[:vaccine])
    flash[:success] = "Successfully added a new vaccine"
    respond_to do |format|
      format.html { redirect_to vaccines_path }
      format.json
    end
  end

  def edit
    @vaccine = Vaccine.find_by_id(params[:id])
  end

  def update
    if Vaccine.find_by_id(params[:id]).update_attributes(params[:vaccine])
      flash[:success] = "Successfully updated."
      redirect_to vaccines_path
    end
  end

  # def destroy
  #   Vaccine.find_by_id(params[:id]).destroy
  #   flash[:success] = "Successfully deleted."
  #   reditect_to "index"
  # end

  protected

    def set_new_child
      if signed_in?
        @newchild = current_user.children.new
      end
    end
end
