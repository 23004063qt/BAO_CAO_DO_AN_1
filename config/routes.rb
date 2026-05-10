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
  get "nganh/cong_nghe_ky_thuat_co_khi"
  get "nganh/cong_nghe_ky_thuat_co_dien_tu"
  get "nganh/ky_thuat_robot"
  get "nganh/cong_nghe_ky_thuat_o_to"
  get "nganh/ky_thuat_o_to_dien"
  get "nganh/cong_nghe_ky_thuat_cong_trinh_xay_dung"
  get "nganh/cong_nghe_ky_thuat_dieu_khien_va_tdh"
  get "nganh/cong_nghe_ky_thuat_dien_dien_tu"
  get "nganh/cong_nghe_ky_thuat_nhiet_dien_lanh"
  get "nganh/ky_thuat_hoa_hoc"
  get "nganh/cong_nghe_thuc_pham"
  get "nganh/cong_nghe_sinh_hoc"
  get "nganh/ngon_ngu_anh"
  get "nganh/cong_tac_xa_hoi"
  get "nganh/chinh_tri_hoc"
  get "nganh/triet_hoc"
  get "nganh/su_pham_cong_nghe"
  get "nganh/giao_duc_hoc"
  get "nganh/du_lich"
  get "nganh/thu_y"
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
