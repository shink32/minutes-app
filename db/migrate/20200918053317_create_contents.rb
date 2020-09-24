class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string     :writing
      t.string     :task
      t.string     :closing_day
      t.references :user,          foreign_key: true 
      t.references :meeting,       foreign_key: true 
      t.boolean    :checked
      t.timestamps
    end
  end
end
