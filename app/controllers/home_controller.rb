class HomeController < AuthenticatedController
  def index
    check_payment
    @shop = current_shop
    @shop.update_attributes(uninstall: false)

    if @shop.rainify
        new_script = ShopifyAPI::ScriptTag.new
        new_script.event = "onload"
        new_script.src = "https://cdn.jsdelivr.net/gh/Tommyixi/rainify/public/rainify.js"
        new_script.save
    else
        ShopifyAPI::ScriptTag.all.each do |script|
            if script.src = "https://cdn.jsdelivr.net/gh/Tommyixi/rainify/public/rainify.js"
                script.destroy
            end
        end
    end

  end

end