class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/) then
      itemName = req.path.split("/items/").last
      item = @@items.find{|s| s.name == itemName}
      resp.write "#{item.price}"
    else
      resp.write "route not found"
      resp.status = 404

  end

end
