class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :user_id
      t.string :title, null: false
      t.string :category
      t.boolean :is_done, default: false, null: false
      t.boolean :fav, default: false, null: false

      t.timestamps
    end
  end
end
