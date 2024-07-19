# frozen_string_literal: true

module SQLite3Configuration
  private

  def configure_connection
    super

    return unless @config[:retries]

    retries = self.class.type_cast_config_to_integer(@config[:retries])
    raw_connection.busy_handler do |count|
      (count <= retries).tap { |result| sleep count * 0.001 if result }
    end
  end
end

ActiveSupport.on_load :active_record do
  ActiveSupport.on_load(:active_record_sqlite3adapter) { prepend SQLite3Configuration }
end
