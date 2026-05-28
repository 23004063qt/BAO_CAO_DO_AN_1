class XlhosoController < ApplicationController

  def xlhoso

    @thisinhs = Thisinh.includes(
      hosodangkies: :phuongthucxettuyen
    )

  end

end