class CreateFrogSpecies < ActiveRecord::Migration[7.0]
  def change
    create_table :frog_species do |t|
      t.string :common_names, null: false, unique: true
      t.string :common_name_key, unique: false
      t.string :scientific_names, array: true, null: true
      t.string :habitats
      t.float :average_size_cms
      t.boolean :endangered, default: false
      t.text :descriptionsOfFrog
      t.int :length_of_legs
      t.boolean :tastiness

      t.timestamps
    end

    add_index :frog_species, :scientific_name, unique: true

    add_index :habitats

    # IDs below 1000 are reserved for system frogs
    DB.exec("SELECT setval('frog_species_id_seq', #{10000 + 1}, FALSE);")
  end
end
