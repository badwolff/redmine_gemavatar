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

require 'application_helper'

module GemAvatarPlugin
    module ApplicationAvatarPatch
        def self.included(base)
            base.send(:include, InstanceMethods)
            base.class_eval do
                alias_method :avatar, :avatar_gem
            end
        end
        module InstanceMethods
            def avatar_gem(user, options = { })
                if Setting.gravatar_enabled?
                    options.merge!({:ssl => (defined?(request) && request.ssl?), :default => Setting.gravatar_default})
                    options[:size] = "64" unless options[:size]
                    base_url = Redmine::Utils.relative_url_root
                    base_url = base_url + '/' if base_url[-1] != '/'
                    return "<img class=\"gravatar\" width=\"#{options[:size]}\" height=\"#{options[:size]}\" src=\"#{base_url}gemavatar/show/#{user.id}\" />"
                else
                    ''
                end
            end
        end
    end
end

ApplicationHelper.send(:include, GemAvatarPlugin::ApplicationAvatarPatch)
