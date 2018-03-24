class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    check_item = req.params["item"]
    if req.path == "/items/#{check_item}"
      if @@items.include?(check_item)
        resp.write "3.42"
        resp.status = 200
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
