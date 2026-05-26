class QlkhoaDvController < ApplicationController

    # Hiển thị danh sách khoa
    def qlkhoa_dv
        @khoas = Khoa.all
    end

    # Form thêm
    def new
        @khoa = Khoa.new
    end

    # Lưu thêm
    def create
        @khoa = Khoa.new(khoa_params)

        if @khoa.save
            redirect_to qlkhoa_dv_qlkhoa_dv_path,
            notice: "Thêm khoa thành công!"
        else
            render :new
        end
    end

    # Form sửa
    def edit
        @khoa = Khoa.find(params[:id])
    end

    # Cập nhật
    def update
        @khoa = Khoa.find(params[:id])

        if @khoa.update(khoa_params)
            redirect_to qlkhoa_dv_qlkhoa_dv_path,
            notice: "Cập nhật thành công!"
        else
            render :edit
        end
    end

    # Xóa
    def delete
        @khoa = Khoa.find(params[:id])
        @khoa.destroy

        redirect_to qlkhoa_dv_qlkhoa_dv_path,
        notice: "Xóa thành công!"
    end

    private

    def khoa_params
        params.require(:khoa).permit(
            :TENKHOA,
            :MOTA
        )
    end
end