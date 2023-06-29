
class TestController < ApplicationController
  def index
    # Every five minutes
    choice = Time.now.min.to_s.last.to_i < 5

    if choice
        render plain: 'all good', status: 200
    else
        render plain: 'error 500', status: 500
    end
  end
end