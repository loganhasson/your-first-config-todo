require 'rack'

class RackAppThingy

  def call(env)
    puts env
    case env["PATH_INFO"]
    when "/"
      [200, {"Content-Type" => "text/html"}, ["Hello Rack! Root page."]]
    when "/test"
      [200, {"Content-Type" => "text/html"}, ["Woah, look at you. You're at #{env['HTTP_HOST']}#{env['REQUEST_PATH']}"]]
    else
      [404, {"Content-Type" => "text/html"}, ["Nothing here, kid."]]
    end
  end

end

run RackAppThingy.new