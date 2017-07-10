class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets
end
