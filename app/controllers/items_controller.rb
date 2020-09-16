class ItemsController < ApplicationController
  def index
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
