module SweetPickler
  class Config
    class << self
      def load_config
        return @config if @config

        @config = {}

        ['.sweetpickler.yml','~/.sweetpickler.yml'].each do |p|
          if File.exist?(File.expand_path(p))
            @config.merge(YAML.load_file(p))
          end
        end

        @config = @config.reverse_merge('api_token' => ENV["TRACKER_API_TOKEN"])
        
      end
      private :load_config

      def secure
        @secure ||= config[:token] 
      end

      def url
        @url ||= (self.secure ? 'http' : 'https') + '://www.pivotaltracker.com/services/v3'
      end

      def token
        @token ||= config[:token] 
      end

      def config
        @config ||= load_config
      end
    end
  end
end


