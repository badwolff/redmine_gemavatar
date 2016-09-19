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

class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.column :user_id, :integer, :null => false
      t.column :location, :string, :null => false
      t.column :created, :date, :null => false
    end
    execute <<-SQL
        ALTER TABLE pictures
        ADD CONSTRAINT fk_user_id
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
    SQL
  end

  def self.down
    drop_table :pictures
    execute <<-SQL
        ALTER TABLE pictures
        DROP FOREIGN KEY fk_user_id
    SQL
  end
end
