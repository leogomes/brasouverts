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

ActiveRecord::Schema.define(:version => 20100215201520) do

  create_table "charges", :force => true do |t|
    t.enum     "type_de_charge", :limit => [:Loyer, :Dettes, :"Pension Alimentaire"], :null => false
    t.float    "valeur"
    t.integer  "foyer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "distributions", :force => true do |t|
    t.integer  "element_id"
    t.integer  "foyer_id",                                        :null => false
    t.date     "date",                  :default => '2010-02-21'
    t.integer  "nombre_distribue"
    t.float    "prix",                                            :null => false
    t.float    "dette",                 :default => 0.0
    t.boolean  "donation_bras_ouverts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "elements", :force => true do |t|
    t.string   "elementDistribue"
    t.string   "description"
    t.float    "prix_unitaire"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foyers", :force => true do |t|
    t.string   "chef_nom",                                                                                                                           :null => false
    t.string   "chef_prenom",                                                                                                                        :null => false
    t.enum     "chef_sex",                  :limit => [:M, :F],                                                                                      :null => false
    t.date     "chef_date_naissance"
    t.string   "chef_ville_de_naissance"
    t.integer  "pays_id"
    t.string   "chef_email"
    t.enum     "situation_familiale",       :limit => [:Celibataire, :Marie, :Veuf, :Divorce, :Separe, :Concubinage],                                :null => false
    t.integer  "nbr_colis_a_distribuer"
    t.boolean  "inscription_complete"
    t.string   "adresse_numero"
    t.string   "adresse_rue"
    t.string   "adresse_additionel"
    t.string   "adresse_ville"
    t.string   "adresse_chez"
    t.string   "adresse_code_postal"
    t.string   "telephone_portable"
    t.string   "telephone_fixe"
    t.string   "information_additionnelle"
    t.integer  "revenu_impossable",         :limit => 10,                                                             :precision => 10, :scale => 0
    t.boolean  "mis_a_jour"
    t.boolean  "sans_papier"
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
    t.string   "ville_de_naissance"
    t.integer  "pays_id"
    t.enum     "sexe",               :limit => [:M, :F],                                                                          :null => false
    t.enum     "relation",           :limit => [:Epoux, :Epouse, :Fils, :Fille, :Parent, :"Petit fils", :"Petite fille", :Autre], :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "revenus", :force => true do |t|
    t.enum     "type_de_revenu", :limit => [:"Allocation Sp\303\251cifique Solidarit\303\251", :"Allocation Parent Isol\303\251", :"Allocation Logement", :"Allocation Familiale", :"Prestation d''Accueil du Jeune Enfant", :"Allocation Handicap", :"Pension de Reversion", :"Pension Alimentaire", :"Autres Revenus"], :null => false
    t.float    "valeur"
    t.integer  "foyer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
