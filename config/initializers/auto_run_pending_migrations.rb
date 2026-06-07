# Auto-run pending migrations on boot for development or when explicitly enabled.
# This avoids ActiveRecord::PendingMigrationError during development/docker boot.
begin
  # If migrations are pending, ActiveRecord::Migration.check_pending! will raise
  ActiveRecord::Migration.check_pending!
rescue ActiveRecord::PendingMigrationError => e
  should_auto_run = Rails.env.development? || ENV['AUTO_MIGRATE_ON_BOOT'] == 'true'

  if should_auto_run
    Rails.logger.info "Detected pending migrations. Running migrations automatically..."
    begin
      # Use the migration context API which is stable across Rails versions
      ActiveRecord::Base.connection_pool.with_connection do |conn|
        migration_context = if conn.respond_to?(:migration_context)
                              conn.migration_context
                            else
                              ActiveRecord::MigrationContext.new(Rails.root.join('db', 'migrate'))
                            end

        migration_context.migrate
      end

      Rails.logger.info "Migrations applied successfully."
    rescue => migrate_err
      Rails.logger.error "Failed to run migrations automatically: #{migrate_err.class}: #{migrate_err.message}"
      # Re-raise original error so the boot fails visibly if migrations can't be applied
      raise e
    end
  else
    # Re-raise to preserve default behaviour in non-dev environments
    raise e
  end
end
