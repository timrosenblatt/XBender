# Based off http://railscasts.com/episodes/151-rack-middleware
class XBender
  def initialize(app)
    @app = app
  end

  # This makes it threadsafe
  def call(env)
    dup._call(env)
  end

  def _call(env)
    @status, @headers, @response = @app.call(env)
    @headers['X-Bender'] = "Bite my shiny metal ass!"
    [@status, @headers, @response]
  end
end