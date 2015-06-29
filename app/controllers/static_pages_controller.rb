class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @newchild = current_user.children.new
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
