require "buffalo/logs/version"
require "logger"

module Buffalo
  module Logs
    class Extraction < Logger
      LOG_LEVEL = %i(debug info warn error fatal unknown).freeze
      LOG_LEVEL_SPECIAL = %i(error fatal unknown).freeze

      def initialize path
        @logger_file = {}
        @special_logger_file = {}
        @logger_stdout = {}
        @path = path

        LOG_LEVEL.each do |level|
          @logger_file[level] = Logger.new "#{path}/#{Rails.env}.log"
          @logger_stdout[level] = ActiveSupport::Logger.new STDOUT
        end
        LOG_LEVEL_SPECIAL.each do |level_special|
          @special_logger_file[level_special] = Logger.new "#{path}/#{Rails.env}_special.log"
        end
      end

      LOG_LEVEL.each do |level|
        define_method(level) do |message="", &block|
          @logger_file[level].send level, message, &block
          @logger_stdout[level].send level, message, &block

          if LOG_LEVEL_SPECIAL.include? level
            @special_logger_file[level].send level, message, &block
          end
        end
      end
    end
  end
end
