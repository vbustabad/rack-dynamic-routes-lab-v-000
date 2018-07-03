class Application

  @@item = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/testing/)
      resp.write "Route not found"
      resp.status = 404
    elsif req.path.match(/items/Figs/)
    elsif req.path.match(/items/Apples/)
    else
      resp.write "Path Not Found"
    end
    resp.finish
  end

end
