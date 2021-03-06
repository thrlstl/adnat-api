class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.float :hourly_rate, scale: 2, precision: 2

      t.timestamps
    end
  end
end
