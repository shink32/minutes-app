class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.string :title
      t.string :detail
      t.boolean :check
      t.timestamps
    end
  end
end
