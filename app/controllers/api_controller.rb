class ApiController < ApplicationController

  def lay_tohop_theo_nganh
    nganh = Nganh.find(params[:id])

    render json: nganh.tohopmons.select(
      :IDTOHOP,
      :TENTOHOP,
      :MON1,
      :MON2,
      :MON3
    )
  end

end