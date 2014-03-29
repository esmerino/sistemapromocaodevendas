class CreateVisita < ActiveRecord::Migration
  def change
    create_table :visita do |t|
      t.string :data_hora_inicio
      t.string :data_hora_fim
      t.string :empresa
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
