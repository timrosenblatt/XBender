# http://opensoul.org/2009/3/3/plugging-rack-into-rails
ActionController::Dispatcher.middleware.insert_after 'ActionController::Failsafe', XBender