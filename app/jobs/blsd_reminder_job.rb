# frozen_string_literal: true

class BlsdReminderJob < ApplicationJob
  @queue = :default

  def perform
    users = User.with_expiring_blsd
    users.each do |user|
      BlsdMailer.with(user:).expiring_email.deliver_later
    end
  end
end
