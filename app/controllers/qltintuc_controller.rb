class QltintucController < ApplicationController
  def qltintuc
    @tintuc_list = Tintuc.all
  end
end