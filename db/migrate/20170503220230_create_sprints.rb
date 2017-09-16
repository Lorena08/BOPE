class CreateSprints < ActiveRecord::Migration[5.0]
  def change
    create_table :sprints do |t|
      t.string :description
      t.date :inicio
      t.date :fim
<<<<<<< HEAD
=======
      t.integer :pontos_cadastrados
>>>>>>> d0c6183c3349cba16c54d8ce4c0fb5ee26c49700
      t.integer :pontos_atualizados

      t.timestamps
    end
  end
end
