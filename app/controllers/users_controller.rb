class UsersController < Frack::BaseController
  def index
    #@users =%w[Toan,Tam,Tri,Son,Tu]
    @users = User.all
    render("users/index")
  end
end
