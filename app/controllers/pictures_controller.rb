#    This file is part of Gemavatar.
#
#    Gemavatar is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    Gemavatar is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with Gemavatar.  If not, see <http://www.gnu.org/licenses/>.
require 'cgi'

class PicturesController < ApplicationController
    # include ActionView::Helpers
    DEFAULT_OPTIONS = {
        # The URL of a default image to display if the given email address does
        # not have a gravatar.
        :default => nil,

        # The default size in pixels for the gravatar image (they're square).
        :size => 50,

        # The alt text to use in the img tag for the gravatar.  Since it's a
        # decorational picture, the alt text should be empty according to the
        # XHTML specs.
        :alt => '',

        # The title text to use for the img tag for the gravatar.
        :title => '',

        # The class to assign to the img tag for the gravatar.
        :class => 'gravatar',

        :plugin => 'gemavatar'
    }
    unloadable

    def show
        user = User.find(params[:user_id].to_i)
        gemavatar_for(user)
    end

    def delete
        deleted = Picture.where(:user_id => params[:user_id]).delete_all
        result = (deleted > 0) ? 'true' : 'false'
        render :json => "{\"deleted\": #{result}}"
    end

    private

    def gemavatar_for(user, options={})
        picture = get_picture(user.id, user.login)
        send_file(picture.location, :filename => user.login, :type => 'image/jpeg', :disposition => 'inline')
        #gemavatar(user.login, options)
    end

    def get_picture(user_id, user_login)
        picture = Picture.get_by_user_id(user_id)
        if picture.nil? or picture.old?
            picture = Picture.create_from_ldap(user_id, user_login)
        end
        picture
    end

    # Return the HTML img tag for the given email address's gravatar.
    def gemavatar(login, options={})
        options = DEFAULT_OPTIONS.merge(options)
        login+'.jpg'
    end
end