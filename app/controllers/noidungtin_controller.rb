class NoidungtinController < ApplicationController
  def noidungtin
    @tin = Tintuc.find(params[:id])
  end
end