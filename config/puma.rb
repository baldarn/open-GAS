# frozen_string_literal: true

threads_count = ENV.fetch('RAILS_MAX_THREADS', 3)
threads threads_count, threads_count

rails_env = ENV.fetch('RAILS_ENV', 'development')
environment rails_env

case rails_env
when 'production'
  workers_count = Integer(ENV.fetch('WEB_CONCURRENCY') { (Concurrent.processor_count * 0.666).ceil })
  workers workers_count if workers_count > 1

  preload_app!
when 'development'
  worker_timeout 3600 # Don't let worker die during debugger session
end

port ENV.fetch('PORT', 3000)
plugin :tmp_restart
