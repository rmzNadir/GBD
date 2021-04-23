# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_23_050808) do

  create_table "aerolinea", primary_key: "cod_aerolinea", id: { limit: 5, precision: 5 }, force: :cascade do |t|
    t.string "nom_aerolinea", limit: 25
  end

  create_table "aeropuerto", primary_key: "cod_aeropuerto", id: { limit: 4, precision: 4 }, force: :cascade do |t|
    t.string "nom_aeropuerto", limit: 25
    t.string "direccion", limit: 30
  end

  create_table "aviones", primary_key: "cod_avion", id: :decimal, force: :cascade do |t|
    t.string "fabricante", limit: 25
    t.string "modelo", limit: 25
    t.decimal "capacidad"
    t.string "id_avion", limit: 20
  end

  create_table "cargo", primary_key: "no_cargo", id: :decimal, force: :cascade do |t|
    t.string "nom_cargo", limit: 25
  end

  create_table "clientes", primary_key: "id_cliente", id: { limit: 5, precision: 5 }, force: :cascade do |t|
    t.string "nombre", limit: 25
    t.string "paterno", limit: 25
    t.string "materno", limit: 25
    t.integer "edad", limit: 3, precision: 3
    t.decimal "no_genero", null: false
    t.string "nacionalidad", limit: 25
  end

  create_table "empleado_aerolinea", primary_key: "id_emp_aero", id: { limit: 4, precision: 4 }, force: :cascade do |t|
    t.string "nombre", limit: 25
    t.string "paterno", limit: 25
    t.integer "cod_aerolinea", limit: 5, precision: 5, null: false
    t.decimal "id_cargo", null: false
    t.decimal "id_genero", null: false
  end

  create_table "equipaje", primary_key: "no_equipaje", id: { limit: 6, precision: 6 }, force: :cascade do |t|
    t.decimal "peso"
    t.integer "id_cliente", limit: 5, precision: 5, null: false
  end

  create_table "genero", primary_key: "no_gen", id: :decimal, force: :cascade do |t|
    t.string "nom_genero", limit: 25
  end

  create_table "historico_vuelos", id: false, force: :cascade do |t|
    t.string "id_registro", limit: 10
    t.string "movimiento", limit: 20
    t.string "usuario", limit: 50
    t.datetime "fecha_hora", precision: 6
  end

  create_table "locales", id: false, force: :cascade do |t|
    t.decimal "num_local"
    t.decimal "no_terminal", null: false
    t.integer "cod_negocio", limit: 4, precision: 4, null: false
  end

  create_table "negocio", primary_key: "cod_negocio", id: { limit: 4, precision: 4 }, force: :cascade do |t|
    t.string "nom_negocio", limit: 25
  end

  create_table "pista", primary_key: "no_pista", id: :decimal, force: :cascade do |t|
    t.string "zona", limit: 25
    t.decimal "no_terminal", null: false
  end

  create_table "planes", force: :cascade do |t|
    t.string "modelo", limit: 25
    t.integer "capacidad", precision: 38
    t.string "fabricante", limit: 25
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "id_avion", limit: 20
  end

  create_table "reservaciones", id: false, force: :cascade do |t|
    t.decimal "no_reservacion"
    t.string "asiento", limit: 3
    t.decimal "precio"
    t.integer "id_cliente", limit: 5, precision: 5, null: false
    t.integer "cod_vuelo", limit: 6, precision: 6, null: false
  end

  create_table "responsables_vuelo", id: false, force: :cascade do |t|
    t.integer "vuelos_cod_vuelo", limit: 6, precision: 6, null: false
    t.integer "id_piloto", limit: 4, precision: 4, null: false
    t.integer "id_copiloto", limit: 4, precision: 4, null: false
    t.integer "id_sobrecargo_1", limit: 4, precision: 4, null: false
    t.integer "id_sobrecargo_2", limit: 4, precision: 4, null: false
  end

  create_table "salas", primary_key: "no_sala", id: :decimal, force: :cascade do |t|
    t.string "nombre_sala", limit: 25
    t.decimal "no_terminal", null: false
  end

  create_table "terminal", primary_key: "no_terminal", id: :decimal, force: :cascade do |t|
    t.string "zona", limit: 25
    t.integer "cod_aeropuerto", limit: 4, precision: 4, null: false
  end

  create_table "tipo_evento", primary_key: "no_evento", id: :decimal, force: :cascade do |t|
    t.string "nom_evento", limit: 15
  end

  create_table "tipo_vuelo", primary_key: "cod_tipo_vuelo", id: { limit: 5, precision: 5 }, force: :cascade do |t|
    t.string "nom_tipo", limit: 25
  end

  create_table "vuelos", primary_key: "cod_vuelo", id: { limit: 6, precision: 6 }, force: :cascade do |t|
    t.string "origen", limit: 25
    t.string "destino", limit: 25
    t.datetime "fecha_hora_salida", precision: 6
    t.decimal "no_sala", null: false
    t.decimal "no_pista", null: false
    t.integer "cod_tipo", limit: 5, precision: 5, null: false
    t.decimal "cod_avion", null: false
    t.decimal "no_evento", null: false
  end

  add_foreign_key "clientes", "genero", column: "no_genero", primary_key: "no_gen", name: "clientes_genero_fk"
  add_foreign_key "empleado_aerolinea", "aerolinea", column: "cod_aerolinea", primary_key: "cod_aerolinea", name: "empleado_aerolinea_aerolinea_fk"
  add_foreign_key "empleado_aerolinea", "cargo", column: "id_cargo", primary_key: "no_cargo", name: "empleado_aerolinea_cargo_fk"
  add_foreign_key "empleado_aerolinea", "genero", column: "id_genero", primary_key: "no_gen", name: "empleado_aerolinea_genero_fk"
  add_foreign_key "equipaje", "clientes", column: "id_cliente", primary_key: "id_cliente", name: "equipaje_clientes_fk"
  add_foreign_key "locales", "negocio", column: "cod_negocio", primary_key: "cod_negocio", name: "locales_negocio_fk"
  add_foreign_key "locales", "terminal", column: "no_terminal", primary_key: "no_terminal", name: "locales_terminal_fk"
  add_foreign_key "pista", "terminal", column: "no_terminal", primary_key: "no_terminal", name: "pista_terminal_fk"
  add_foreign_key "reservaciones", "clientes", column: "id_cliente", primary_key: "id_cliente", name: "reservaciones_clientes_fk"
  add_foreign_key "reservaciones", "vuelos", column: "cod_vuelo", primary_key: "cod_vuelo", name: "reservaciones_vuelos_fk"
  add_foreign_key "responsables_vuelo", "empleado_aerolinea", column: "id_copiloto", primary_key: "id_emp_aero", name: "responsables_vuelo_empleado_aerolinea_fkv2"
  add_foreign_key "responsables_vuelo", "empleado_aerolinea", column: "id_piloto", primary_key: "id_emp_aero", name: "responsables_vuelo_empleado_aerolinea_fk"
  add_foreign_key "responsables_vuelo", "empleado_aerolinea", column: "id_sobrecargo_1", primary_key: "id_emp_aero", name: "responsables_vuelo_empleado_aerolinea_fkv3"
  add_foreign_key "responsables_vuelo", "empleado_aerolinea", column: "id_sobrecargo_2", primary_key: "id_emp_aero", name: "responsables_vuelo_empleado_aerolinea_fkv4"
  add_foreign_key "responsables_vuelo", "vuelos", column: "vuelos_cod_vuelo", primary_key: "cod_vuelo", name: "responsables_vuelo_vuelos_fk"
  add_foreign_key "salas", "terminal", column: "no_terminal", primary_key: "no_terminal", name: "salas_terminal_fk"
  add_foreign_key "terminal", "aeropuerto", column: "cod_aeropuerto", primary_key: "cod_aeropuerto", name: "terminal_aeropuerto_fk"
  add_foreign_key "vuelos", "aviones", column: "cod_avion", primary_key: "cod_avion", name: "vuelos_avion_fk"
  add_foreign_key "vuelos", "pista", column: "no_pista", primary_key: "no_pista", name: "vuelos_pista_fk"
  add_foreign_key "vuelos", "salas", column: "no_sala", primary_key: "no_sala", name: "vuelos_salas_fk"
  add_foreign_key "vuelos", "tipo_evento", column: "no_evento", primary_key: "no_evento", name: "vuelos_tipo_evento_fk"
  add_foreign_key "vuelos", "tipo_vuelo", column: "cod_tipo", primary_key: "cod_tipo_vuelo", name: "vuelos_tipo_vuelo_fk"
end
