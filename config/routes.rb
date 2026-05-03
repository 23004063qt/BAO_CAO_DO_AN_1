Rails.application.routes.draw do
  get "nganh/nganh"
  get "nganh/motanganh"
  get "nganh/thuongmai"
  get "nganh/logistics"
  get "nganh/luat"
  get "nganh/luat_kinh_te"
  get "nganh/marketing"
  get "nganh/truyen_thong_da_phuong_tien"
  get "nganh/cong_nghe_thong_tin"
  get "nganh/khoa_hoc_du_lieu"
  get "nganh/toan_tin"
  get "tintuc/tintuc"
  get "noidungtin/noidungtin"
  get "qlkhoa_dv/qlkhoa_dv"
  get "thongkebaocao/thongkebaocao"
  get "thongtintruong/thongtintruong"
  get "cthoso/cthoso"
  get "xlhoso/xlhoso"
  get "lichtuyensinh/lichtuyensinh"
  get "tinhdiem/tinhdiem"
  get "themtintuc/themtintuc"
  get "qltintuc/qltintuc"
  get "dangkytk/dangkytk"
  get "qltaikhoan/qltaikhoan"
  get "nophoso/nophoso"
  get "dangnhap/dangnhap"
  get "trangchu/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "trangchu#index"

  post '/api/chat', to: 'chat#create'
end
