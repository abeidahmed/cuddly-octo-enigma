class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects, id: :uuid do |t|
      t.string :name, null: false, default: ""
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
