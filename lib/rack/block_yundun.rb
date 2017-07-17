module Rack
  class BlockYundun
    def initialize(app)
      @app = app
    end

    def call(env)
      if match_yundun?(env)
        [406, {}, [not_acceptable_rfc_message]]
      else
        @app.call(env)
      end
    end

    private
    def match_yundun?(env)
      keywords = %w[Alibaba Security Heimdall]
      return false if env['HTTP_USER_AGENT'].nil?
      keywords.any? {|keyword| env['HTTP_USER_AGENT'].include?(keyword)}
    end

    def not_acceptable_rfc_message
      <<-MESSAGE
      The target resource does not have a current representation that would
 be acceptable to the user agent, according to the proactive negotiation header
 fields received in the request1, and the server is unwilling to supply a default representation.
      MESSAGE
    end
  end
end