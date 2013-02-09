class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :mercury_update]
  def index
    # Right now we're showing all users
    @users = User.all

    if user_signed_in?
      @fb_friends = [] 
      if current_user.fb_graph
        @fb_result = current_user.fb_graph.friends 
        @fb_result.each do |f|
          @fb_friend = {:uid => f.raw_attributes[:id], 
                        :name => f.raw_attributes[:name], :diameter => 60 }
          @fb_friends << @fb_friend
        end
        @fb_friends
      end
    end

    respond_to do |format|
      format.js
      format.html
    end
  end #end index

  def mercury_update
    users = params[:content]
    users.each do |key, datum|
      (id, field) = key.split(":")
      u = User.find(id)
      if u
        if field == "diameter"
          #update radius field of user
          if datum[:value].to_i > 0
            u.diameter = datum[:value]
            u.save
          end
        else
          # replace any images with cloudinary uploaded pics
          doc = Nokogiri::HTML(datum[:value])
          doc.css("img").each do |i|
            img_path = i.get_attribute("src").split("?")[0]
            if /system\/images/.match(img_path) 
              img_path = "#{Rails.root}/public#{i.get_attribute("src").split("?")[0]}"
              cl_img_path = Cloudinary::Uploader.upload(img_path)
              i.set_attribute("src", cl_img_path["url"]) 
            end
          end
          u.description = doc.to_html 
          u.save
        end
      end
    end
    render text: ""
  end
end