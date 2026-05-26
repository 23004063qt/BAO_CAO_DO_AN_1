class OtpMailer < ApplicationMailer
    default from: "lehuynhanhduy28@gmail.com"

    def gui_otp(email, otp)
        @otp = otp

        mail(
            to: email,
            subject: "Mã OTP xác nhận đổi mật khẩu"
        )
    end
end