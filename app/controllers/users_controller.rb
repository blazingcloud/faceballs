class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :mercury_update]
  def index
    # Right now we're showing all users
    @users = User.all

    if user_signed_in?
      @fb_friends = current_user.fb_graph.friends if current_user.fb_graph
    end

    respond_to do |format|
      format.js
      format.html
    end
  end #end index

  def mercury_update
    puts "here!!!"
    users = params[:content]
    puts users.inspect
    users.each do |id, datum|
      u = User.find(id)
      if u
        if datum[:value].is_a? Integer
          u.radius = datum[:value]
          u.save
        end
      end
    end
    render text: ""
  end
end