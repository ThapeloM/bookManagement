class CreateProductsProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :products_projects, id: false do |t|
      t.belongs_to :product, index: true
      t.belongs_to :project, index: true
      t.timestamps
    end
  end
end
