class HomeController < AuthenticatedController
    before_action :check_user
  def index
    check_payment
    @shop = current_shop

    if @shop.rainify
        new_script = ShopifyAPI::ScriptTag.new
        new_script.event = "onload"
        new_script.src = "https://rawgit.com/Tommyixi/rainify/master/public/rainify.js"
        new_script.save
    else
        ShopifyAPI::ScriptTag.all.each do |script|
            if script.src = "https://rawgit.com/Tommyixi/rainify/master/public/rainify.js"
                script.destroy
            end
        end
    end

  end

  def check_user
    if current_shop
    else
        redirect_to login_path
    end
  end

end