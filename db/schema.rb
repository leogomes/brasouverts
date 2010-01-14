# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100102154535) do

  create_table "distributions", :force => true do |t|
    t.integer  "element_id"
    t.integer  "foyer_id",                                        :null => false
    t.date     "date",                  :default => '2010-01-03'
    t.integer  "nombre_distribue"
    t.float    "prix",                                            :null => false
    t.float    "dette"
    t.boolean  "donation_bras_ouverts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "elements", :force => true do |t|
    t.string   "elementDistribue"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foyers", :force => true do |t|
    t.string   "chef_nom",                                                                                :null => false
    t.string   "chef_prenom",                                                                             :null => false
    t.enum     "chef_sex",               :limit => [:m, :f],                                              :null => false
    t.date     "chef_date_naissance"
    t.enum     "situation_familiale",    :limit => [:celibataire, :divorce, :marie, :veuf, :concubinage], :null => false
    t.integer  "nbr_membres"
    t.integer  "nbr_membres_adultes"
    t.integer  "nbr_membres_enfants"
    t.integer  "nbr_colis_a_distribuer"
    t.boolean  "inscription_complete"
    t.float    "dette_cumule"
    t.string   "adresse_numero"
    t.string   "adresse_rue"
    t.string   "adresse_additionel"
    t.string   "adresse_chez"
    t.string   "adresse_code_postal"
    t.string   "telephone_portable"
    t.string   "telephone_fixe"
    t.boolean  "sdf"
    t.boolean  "demandeur_asile"
    t.boolean  "handicape"
    t.boolean  "diabetique"
    t.boolean  "hallal"
    t.boolean  "sans_porc"
    t.boolean  "lettre_AS"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "membres", :force => true do |t|
    t.integer  "foyer_id"
    t.string   "nom"
    t.string   "prenom"
    t.date     "date_de_naissance"
    t.enum     "sexe",              :limit => [:M, :F],                                  :null => false
    t.enum     "relation",          :limit => [:Epoux, :Epouse, :Fils, :Parent, :Autre], :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "revenues", :force => true do |t|
    t.enum     "type_de_revenue", :limit => [:RSA, :AllocSS, :AllocLog, :AllocationFamilial, :AllocPI, :PAJE, :AllocHandicap, :Loyer, :Salaire, :Assedic, :Retraite, :PensRevers, :PensAlim, :AutrePension, :AutresRevenues, :chargesSuplementaires], :null => false
    t.float    "valeur"
    t.integer  "foyer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
