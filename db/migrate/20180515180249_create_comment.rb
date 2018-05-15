class CreateComment < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
