class ChangeBodyToText < ActiveRecord::Migration
  def change
    change_column :quotes, :body, :text
  end
end
