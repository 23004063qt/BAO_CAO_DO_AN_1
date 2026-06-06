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

ActiveRecord::Schema[8.1].define(version: 2026_05_26_064755) do

  create_table "KHOA", primary_key: "IDKHOA", id: :serial, force: :cascade do |t|
    t.string "TENKHOA", limit: 200, null: false
    t.string "MOTA", limit: 500
  end

  create_table "NGUOIDUNG", primary_key: "IDNGUOIDUNG", id: :serial, force: :cascade do |t|
    t.string "USERNAME", limit: 50, null: false
    t.string "MATKHAU", null: false
    t.string "EMAIL", limit: 120
    t.string "VAITRO", limit: 20, default: "THISINH"
    t.datetime "NGAYTAO", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["EMAIL"], name: "idx_nguoidung_email", unique: true
    t.index ["USERNAME"], name: "idx_nguoidung_username", unique: true
  end

  create_table "PHUONGTHUCXETTUYEN", primary_key: "IDPHUONGTHUC", id: :serial, force: :cascade do |t|
    t.string "TENPHUONGTHUC", limit: 200
    t.string "MOTA", limit: 500
  end

  create_table "TOHOPMON", primary_key: "IDTOHOP", id: :serial, force: :cascade do |t|
    t.string "TENTOHOP", limit: 50
    t.string "MON1", limit: 50
    t.string "MON2", limit: 50
    t.string "MON3", limit: 50
  end

  create_table "DOTTUYENSINH", primary_key: "IDDOT", id: :serial, force: :cascade do |t|
    t.string "TENDOT", limit: 200
    t.date "NGAYBATDAU"
    t.date "NGAYKETTHUC"
    t.text "NOIDUNG"
  end

  create_table "TINTUC", primary_key: "IDTINTUC", id: :serial, force: :cascade do |t|
    t.string "TIEUDE", limit: 300
    t.text "NOIDUNG"
    t.datetime "NGAYDANG", default: -> { "CURRENT_TIMESTAMP" }
    t.string "ANH_DAI_DIEN", limit: 500
    t.string "ANH_BAI_VIET", limit: 500
    t.text "TOM_TAT"
    t.text "NOI_DUNG_THEM"
    t.string "DANHMUC", limit: 100, default: "Tin tức"
  end

  create_table "NGANHDAOTAO", primary_key: "IDNGANH", id: :serial, force: :cascade do |t|
    t.integer "IDKHOA", null: false
    t.string "TENNGANH", limit: 200, null: false
    t.string "MOTA", limit: 500
    t.index ["IDKHOA"], name: "idx_nganhdaotao_idkhoa"
  end

  create_table "THISINH", primary_key: "IDTHISINH", id: :serial, force: :cascade do |t|
    t.integer "IDNGUOIDUNG", null: false
    t.string "HOTENTS", limit: 70
    t.string "GIOITINH", limit: 4
    t.string "NOISINH", limit: 70
    t.string "DANTOC", limit: 50
    t.date "NGAYSINH"
    t.string "GIAYKHAISINH", limit: 50
    t.bigint "SOCCCD"
    t.string "ANHCCCDT", limit: 50
    t.string "ANHCCCDS", limit: 50
    t.string "TINHTT", limit: 70
    t.string "DTUT", limit: 70
    t.string "KVUT", limit: 70
    t.integer "NAMTN"
    t.string "NOIHOC12", limit: 70
    t.string "THPT", limit: 70
    t.string "SDT", limit: 11
    t.string "EMAIL", limit: 120
    t.string "DIACHI", limit: 250
    t.string "ANHHOCBA", limit: 50
    t.string "HANHKIEM", limit: 50
    t.string "KQHT12", limit: 50
    t.string "ANHGIAYTOKHAC", limit: 50
    t.string "LOAIDAOTAO", limit: 100
    t.index ["IDNGUOIDUNG"], name: "idx_thisinh_idnguoidung"
  end

  create_table "DIEMCHUAN", primary_key: "IDDIEMCHUAN", id: :serial, force: :cascade do |t|
    t.integer "IDNGANH", null: false
    t.integer "IDDOT", null: false
    t.float "DIEM"
    t.integer "IDPHUONGTHUC", null: false
    t.index ["IDNGANH"], name: "idx_diemchuan_idnganh"
    t.index ["IDDOT"], name: "idx_diemchuan_iddot"
  end

  create_table "NGANH_TOHOP", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.integer "IDNGANH"
    t.integer "IDTOHOP"
    t.index ["IDNGANH"], name: "idx_nganh_tohop_idnganh"
    t.index ["IDTOHOP"], name: "idx_nganh_tohop_idtohop"
  end

  create_table "DIEMHOCBA", primary_key: "IDDIEMHOCBA", id: :serial, force: :cascade do |t|
    t.integer "IDTHISINH", null: false
    t.string "MON", limit: 100
    t.float "DIEM"
    t.index ["IDTHISINH"], name: "idx_diemhocba_idthisinh"
  end

  create_table "DIEMTHI", primary_key: "IDDIEMTHI", id: :serial, force: :cascade do |t|
    t.integer "IDTHISINH", null: false
    t.string "MON", limit: 100
    t.float "DIEM"
    t.index ["IDTHISINH"], name: "idx_diemthi_idthisinh"
  end

  create_table "HOSODANGKY", primary_key: "IDHOSO", id: :serial, force: :cascade do |t|
    t.integer "IDTHISINH", null: false
    t.integer "IDNGANH", null: false
    t.integer "IDDOT", null: false
    t.date "NGAYNOP", default: -> { "CURRENT_DATE" }
    t.string "TRANGTHAI", limit: 50, default: "Cho xu ly"
    t.integer "THUTU"
    t.integer "IDPHUONGTHUC"
    t.string "KETQUA", limit: 30, default: "Chưa công bố"
    t.index ["IDTHISINH"], name: "idx_hosodangky_idthisinh"
    t.index ["IDNGANH"], name: "idx_hosodangky_idnganh"
    t.index ["IDDOT"], name: "idx_hosodangky_iddot"
  end

  create_table "KETQUAXETTUYEN", primary_key: "IDKETQUA", id: :serial, force: :cascade do |t|
    t.integer "IDHOSO", null: false
    t.string "KETQUA", limit: 30, null: false
    t.float "DIEMXET"
    t.float "DIEMCHUAN"
    t.datetime "NGAYCONGBO", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["IDHOSO"], name: "idx_ketquaxettuyen_idhoso"
  end

  create_table "LICHSUCHATBOT", primary_key: "IDCHAT", id: :serial, force: :cascade do |t|
    t.integer "IDTHISINH", null: false
    t.text "CAUHOI"
    t.text "CAUTRALOI"
    t.datetime "THOIGIAN", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["IDTHISINH"], name: "idx_lichsuchatbot_idthisinh"
  end

  # Legacy Rails migration tables (kept for compatibility)
  create_table "dottuyensinhs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "khoas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nganhs", force: :cascade do |t|
    t.string "tennganh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nguoidungs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phuongthucxettuyens", force: :cascade do |t|
    t.string "tenphuongthuc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taikhoans", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  # Foreign Keys
  add_foreign_key "NGANHDAOTAO",      "KHOA",              column: "IDKHOA",       primary_key: "IDKHOA",       name: "NGANHDAOTAO_ibfk_1"
  add_foreign_key "THISINH",          "NGUOIDUNG",         column: "IDNGUOIDUNG",  primary_key: "IDNGUOIDUNG",  name: "THISINH_ibfk_1"
  add_foreign_key "DIEMCHUAN",        "NGANHDAOTAO",       column: "IDNGANH",      primary_key: "IDNGANH",      name: "DIEMCHUAN_ibfk_1"
  add_foreign_key "DIEMCHUAN",        "DOTTUYENSINH",      column: "IDDOT",        primary_key: "IDDOT",        name: "DIEMCHUAN_ibfk_2"
  add_foreign_key "DIEMCHUAN",        "PHUONGTHUCXETTUYEN",column: "IDPHUONGTHUC", primary_key: "IDPHUONGTHUC", name: "DIEMCHUAN_ibfk_3"
  add_foreign_key "NGANH_TOHOP",      "NGANHDAOTAO",       column: "IDNGANH",      primary_key: "IDNGANH",      name: "NGANH_TOHOP_ibfk_1"
  add_foreign_key "NGANH_TOHOP",      "TOHOPMON",          column: "IDTOHOP",      primary_key: "IDTOHOP",      name: "NGANH_TOHOP_ibfk_2"
  add_foreign_key "DIEMHOCBA",        "THISINH",           column: "IDTHISINH",    primary_key: "IDTHISINH",    name: "DIEMHOCBA_ibfk_1"
  add_foreign_key "DIEMTHI",          "THISINH",           column: "IDTHISINH",    primary_key: "IDTHISINH",    name: "DIEMTHI_ibfk_1"
  add_foreign_key "HOSODANGKY",       "THISINH",           column: "IDTHISINH",    primary_key: "IDTHISINH",    name: "HOSODANGKY_ibfk_1"
  add_foreign_key "HOSODANGKY",       "NGANHDAOTAO",       column: "IDNGANH",      primary_key: "IDNGANH",      name: "HOSODANGKY_ibfk_2"
  add_foreign_key "HOSODANGKY",       "DOTTUYENSINH",      column: "IDDOT",        primary_key: "IDDOT",        name: "HOSODANGKY_ibfk_3"
  add_foreign_key "HOSODANGKY",       "PHUONGTHUCXETTUYEN",column: "IDPHUONGTHUC", primary_key: "IDPHUONGTHUC", name: "HOSODANGKY_ibfk_4"
  add_foreign_key "KETQUAXETTUYEN",   "HOSODANGKY",        column: "IDHOSO",       primary_key: "IDHOSO",       name: "FK_KQXT_HOSO"
  add_foreign_key "LICHSUCHATBOT",    "THISINH",           column: "IDTHISINH",    primary_key: "IDTHISINH",    name: "LICHSUCHATBOT_ibfk_1"

end
