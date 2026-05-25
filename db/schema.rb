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

ActiveRecord::Schema[8.1].define(version: 2026_05_25_004330) do
  create_table "DIEMCHUAN", primary_key: "IDDIEMCHUAN", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.float "DIEM"
    t.integer "IDDOT", null: false
    t.integer "IDNGANH", null: false
    t.index ["IDDOT"], name: "IDDOT"
    t.index ["IDNGANH"], name: "IDNGANH"
  end

  create_table "DIEMHOCBA", primary_key: "IDDIEMHOCBA", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.float "DIEM"
    t.integer "IDTHISINH", null: false
    t.string "MON", limit: 100
    t.index ["IDTHISINH"], name: "IDTHISINH"
  end

  create_table "DIEMTHI", primary_key: "IDDIEMTHI", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.float "DIEM"
    t.integer "IDTHISINH", null: false
    t.string "MON", limit: 100
    t.index ["IDTHISINH"], name: "IDTHISINH"
  end

  create_table "DOTTUYENSINH", primary_key: "IDDOT", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.date "NGAYBATDAU"
    t.date "NGAYKETTHUC"
    t.string "TENDOT", limit: 200
  end

  create_table "HOSODANGKY", primary_key: "IDHOSO", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "IDDOT", null: false
    t.integer "IDNGANH", null: false
    t.integer "IDTHISINH", null: false
    t.date "NGAYNOP", default: -> { "(curdate())" }
    t.integer "THUTU"
    t.string "TRANGTHAI", limit: 50, default: "Cho xu ly"
    t.index ["IDDOT"], name: "IDDOT"
    t.index ["IDNGANH"], name: "IDNGANH"
    t.index ["IDTHISINH"], name: "IDTHISINH"
  end

  create_table "KHOA", primary_key: "IDKHOA", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "MOTA", limit: 500
    t.string "TENKHOA", limit: 200, null: false
  end

  create_table "LICHSUCHATBOT", primary_key: "IDCHAT", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.text "CAUHOI"
    t.text "CAUTRALOI"
    t.integer "IDTHISINH", null: false
    t.datetime "THOIGIAN", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.index ["IDTHISINH"], name: "IDTHISINH"
  end

  create_table "NGANHDAOTAO", primary_key: "IDNGANH", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "IDKHOA", null: false
    t.string "MOTA", limit: 500
    t.string "TENNGANH", limit: 200, null: false
    t.index ["IDKHOA"], name: "IDKHOA"
  end

  create_table "NGANH_TOHOP", primary_key: "ID", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "IDNGANH"
    t.integer "IDTOHOP"
    t.index ["IDNGANH"], name: "IDNGANH"
    t.index ["IDTOHOP"], name: "IDTOHOP"
  end

  create_table "NGUOIDUNG", primary_key: "IDNGUOIDUNG", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "EMAIL", limit: 120
    t.string "MATKHAU", null: false
    t.datetime "NGAYTAO", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.string "USERNAME", limit: 50, null: false
    t.string "VAITRO", limit: 20, default: "THISINH"
    t.index ["EMAIL"], name: "EMAIL", unique: true
    t.index ["USERNAME"], name: "USERNAME", unique: true
  end

  create_table "PHUONGTHUCXETTUYEN", primary_key: "IDPHUONGTHUC", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "MOTA", limit: 500
    t.string "TENPHUONGTHUC", limit: 200
  end

  create_table "THISINH", primary_key: "IDTHISINH", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "ANHCCCDS", limit: 50
    t.string "ANHCCCDT", limit: 50
    t.string "ANHGIAYTOKHAC", limit: 50
    t.string "ANHHOCBA", limit: 50
    t.string "DANTOC", limit: 50
    t.string "DIACHI", limit: 250
    t.string "DTUT", limit: 70
    t.string "EMAIL", limit: 120
    t.string "GIAYKHAISINH", limit: 50
    t.string "GIOITINH", limit: 4
    t.string "HANHKIEM", limit: 50
    t.string "HOTENTS", limit: 70
    t.integer "IDNGUOIDUNG", null: false
    t.string "KQHT12", limit: 50
    t.string "KVUT", limit: 70
    t.string "LOAIDAOTAO", limit: 100
    t.integer "NAMTN"
    t.date "NGAYSINH"
    t.string "NOIHOC12", limit: 70
    t.string "NOISINH", limit: 70
    t.string "SDT", limit: 11
    t.bigint "SOCCCD"
    t.string "THPT", limit: 70
    t.string "TINHTT", limit: 70
    t.index ["IDNGUOIDUNG"], name: "IDNGUOIDUNG"
  end

  create_table "TIEUCHITUYENSINH", primary_key: "IDTIEUCHI", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.float "DIEMTOITHIEU"
    t.integer "IDNGANH", null: false
    t.integer "IDPHUONGTHUC", null: false
    t.integer "IDTOHOP"
    t.index ["IDNGANH"], name: "IDNGANH"
    t.index ["IDPHUONGTHUC"], name: "IDPHUONGTHUC"
    t.index ["IDTOHOP"], name: "IDTOHOP"
  end

  create_table "TINTUC", primary_key: "IDTINTUC", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.datetime "NGAYDANG", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.text "NOIDUNG"
    t.string "TIEUDE", limit: 300
  end

  create_table "TOHOPMON", primary_key: "IDTOHOP", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "MON1", limit: 50
    t.string "MON2", limit: 50
    t.string "MON3", limit: 50
    t.string "TENTOHOP", limit: 50
  end

  create_table "dottuyensinhs", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nganhs", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "tennganh"
    t.datetime "updated_at", null: false
  end

  create_table "nguoidungs", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phuongthucxettuyens", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "tenphuongthuc"
    t.datetime "updated_at", null: false
  end

  create_table "taikhoans", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "DIEMCHUAN", "DOTTUYENSINH", column: "IDDOT", primary_key: "IDDOT", name: "DIEMCHUAN_ibfk_2"
  add_foreign_key "DIEMCHUAN", "NGANHDAOTAO", column: "IDNGANH", primary_key: "IDNGANH", name: "DIEMCHUAN_ibfk_1"
  add_foreign_key "DIEMHOCBA", "THISINH", column: "IDTHISINH", primary_key: "IDTHISINH", name: "DIEMHOCBA_ibfk_1"
  add_foreign_key "DIEMTHI", "THISINH", column: "IDTHISINH", primary_key: "IDTHISINH", name: "DIEMTHI_ibfk_1"
  add_foreign_key "HOSODANGKY", "DOTTUYENSINH", column: "IDDOT", primary_key: "IDDOT", name: "HOSODANGKY_ibfk_3"
  add_foreign_key "HOSODANGKY", "NGANHDAOTAO", column: "IDNGANH", primary_key: "IDNGANH", name: "HOSODANGKY_ibfk_2"
  add_foreign_key "HOSODANGKY", "THISINH", column: "IDTHISINH", primary_key: "IDTHISINH", name: "HOSODANGKY_ibfk_1"
  add_foreign_key "LICHSUCHATBOT", "THISINH", column: "IDTHISINH", primary_key: "IDTHISINH", name: "LICHSUCHATBOT_ibfk_1"
  add_foreign_key "NGANHDAOTAO", "KHOA", column: "IDKHOA", primary_key: "IDKHOA", name: "NGANHDAOTAO_ibfk_1"
  add_foreign_key "NGANH_TOHOP", "NGANHDAOTAO", column: "IDNGANH", primary_key: "IDNGANH", name: "NGANH_TOHOP_ibfk_1"
  add_foreign_key "NGANH_TOHOP", "TOHOPMON", column: "IDTOHOP", primary_key: "IDTOHOP", name: "NGANH_TOHOP_ibfk_2"
  add_foreign_key "THISINH", "NGUOIDUNG", column: "IDNGUOIDUNG", primary_key: "IDNGUOIDUNG", name: "THISINH_ibfk_1"
  add_foreign_key "TIEUCHITUYENSINH", "NGANHDAOTAO", column: "IDNGANH", primary_key: "IDNGANH", name: "TIEUCHITUYENSINH_ibfk_1"
  add_foreign_key "TIEUCHITUYENSINH", "PHUONGTHUCXETTUYEN", column: "IDPHUONGTHUC", primary_key: "IDPHUONGTHUC", name: "TIEUCHITUYENSINH_ibfk_2"
  add_foreign_key "TIEUCHITUYENSINH", "TOHOPMON", column: "IDTOHOP", primary_key: "IDTOHOP", name: "TIEUCHITUYENSINH_ibfk_3"
end
