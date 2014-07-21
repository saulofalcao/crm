# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140721155254) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "agendamentos", force: true do |t|
    t.string   "data"
    t.string   "hora"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "medico_id"
    t.string   "paciente_nome"
  end

  add_index "agendamentos", ["data"], name: "index_agendamentos_on_data"
  add_index "agendamentos", ["hora"], name: "index_agendamentos_on_hora"
  add_index "agendamentos", ["medico_id"], name: "index_agendamentos_on_medico_id"

  create_table "aulas", force: true do |t|
    t.string   "titulo"
    t.text     "descricao"
    t.integer  "professor_id"
    t.datetime "horario"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clientes", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "rua"
    t.string   "numero"
    t.string   "bairro"
    t.string   "cep"
    t.string   "complemento"
  end

  create_table "medicos", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pacientes", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professors", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quartos", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "remedios", force: true do |t|
    t.string   "descricao"
    t.integer  "quantidade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservas", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quarto_id"
  end

  create_table "servico_tipo_servicos", force: true do |t|
    t.integer  "servico_id"
    t.integer  "tipo_servico_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "servico_tipo_servicos", ["servico_id"], name: "index_servico_tipo_servicos_on_servico_id"
  add_index "servico_tipo_servicos", ["tipo_servico_id"], name: "index_servico_tipo_servicos_on_tipo_servico_id"

  create_table "servicos", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "valor_orcamento"
    t.integer  "cliente_id"
    t.text     "observacao"
  end

  create_table "tipo_servico_executados", force: true do |t|
    t.integer  "servico_id"
    t.integer  "tipo_servico_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_servicos", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transacaos", force: true do |t|
    t.float    "valor"
    t.string   "nome"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "nome"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
