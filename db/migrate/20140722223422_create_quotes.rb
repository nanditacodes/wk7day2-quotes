class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :body
      t.references :user, index: true

      t.timestamps
    end
  end
end
