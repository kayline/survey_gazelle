class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title
      t.references :creator
      t.timestamps
    end
  end
end
