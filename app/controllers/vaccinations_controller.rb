class VaccinationsController < ApplicationController

  def update
    @vaccination = Vaccination.find_by_id(params[:id])
    @child = @vaccination.child
    if params["btn-type"] == "set-given"
      @vaccination.set_given
    elsif params["btn-type"] == "set-skipped"
      @vaccination.set_skipped
    end
    respond_to do |format|
      format.js
    end
  end
end
