class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  def index
    # Right now we're showing all users
    @users = User.all

    respond_to do |format|
      format.js
      format.html
    end
  end #end index
end