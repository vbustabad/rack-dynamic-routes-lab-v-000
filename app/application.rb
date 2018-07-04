class Application

  @@item = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/testing/)
      resp.write "Route not found"
      resp.status = 404
    elsif req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.detect {|item| item.name == item_name}

      if @@items.include?(item_name)
        item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Path Not Found"
    end
    resp.finish
  end

end
