# frozen_string_literal: true

Resque.schedule = YAML.load_file('config/schedule.yml')

Resque::Scheduler.dynamic = true
