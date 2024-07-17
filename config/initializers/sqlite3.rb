module SQLite3Configuration
  private
    def configure_connection
      super

      if @config[:retries]
        retries = self.class.type_cast_config_to_integer(@config[:retries])
        raw_connection.busy_handler do |count|
          (count <= retries).tap { |result| sleep count * 0.001 if result }
        end
      end
    end
end

ActiveSupport.on_load :active_record do
  ActiveRecord::ConnectionAdapters::SQLite3Adapter.prepend SQLite3Configuration
end
