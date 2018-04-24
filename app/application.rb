class Application

  @@items=[Item.new("Car",75000),Item.new("Dog",400)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/) 
      itemName = req.path.split("/items/").last
      if item = @@items.find{|s| s.name == itemName}
        resp.write "#{item.price}"
      else
        resp.write "route not found"
        resp.status = 404
      end
    else
      resp.write "route not found"
      resp.status = 404
    end
  end
end
