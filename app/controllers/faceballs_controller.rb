class FaceballsController < ApplicationController

  def index
    # Right now we're showing all microposts
    @faceballs = Faceball.order('created_at DESC')

    respond_to do |format|
      format.js
      format.html
    end
  end #end index
end