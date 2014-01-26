require 'net/http'
require 'uri'

module Arkamai
    module Commands

        def log_error(message)
            puts "Error: #{message}"
        end

        def log_info(message)
            puts "Info:  #{message}"
        end

        def parse_url(url)
            # we set the right format expected by net/http
            url = 'http://' + url unless url.include?('http://')
            URI.parse(url)
        end

        def head_request(url)
            
            path = '/'
            path = url.path unless url.path.empty?
            
            request = Net::HTTP.new(url.host)
            response = request.request_head(path, 'Pragma' => 'akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, 
            akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces, 
            akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no', 'Host' => url.host)  		

        end

        def cache_key_check(urls)
            @urls.each do |url|
                url = parse_url(url)
                response = head_request(url)

                if !response.is_a?(Net::HTTPSuccess)
                    log_error("#{url} cannot be checked: #{response.code} + #{response.message}")
                else
                    if response['X-Cache-Key'].nil?
                        log_error("#{url} cache key not present")
                    else
                        if !response['X-Cache-Key'].include?(url.host)
                            log_error("#{url} cache key: #{response['X-Cache-Key']}")
                        else
                            log_info("OK #{url} cache key: #{response['X-Cache-Key']}")
                        end
                    end
                end
            end

        end  	 	

        def info(urls)

            @urls.each do |url|
                url = parse_url(url)
                response = head_request(url)

                if !response.is_a?(Net::HTTPSuccess)
                    log_error(url.to_s + ' cannot be checked: ' + response.code + ' ' + response.message)
                    log_info('---')
                else
                    log_info(url.to_s)
                    response.header.each_header {|key,value| log_info("> #{key} = #{value}") }
                    log_info('---')
                end

            end  		

        end

        def cacheable?(urls)

            @urls.each do |url|
                url = parse_url(url)
                response = head_request(url)

                if !response.is_a?(Net::HTTPSuccess)
                    log_error("#{url} cannot be checked: #{response.code} + #{response.message}")
                else
                    if response['X-Check-Cacheable'].nil?
                        log_error("#{url} x-check-cacheable header not present")
                    else
                        if response['X-Check-Cacheable'].include?('YES')
                            log_info("Cacheable YES #{url.to_s}")
                        else
                            log_info("Cacheable NO  #{url.to_s}")
                        end
                    end
                end
            end
        end

        def cache_hit?(urls)

            @urls.each do |url|
                url = parse_url(url)
                response = head_request(url)

                if !response.is_a?(Net::HTTPSuccess)
                    log_error("#{url} cannot be checked: #{response.code} + #{response.message}")
                else
                    if response['X-Cache'].nil?
                        log_error("#{url} x-check header not present")
                    else
                        if response['X-Cache'].include?('TCP_MISS')
                            log_info("MISS #{url.to_s}")
                        else
                            log_info("HIT  #{url.to_s}")
                        end
                    end
                end
            end
        end

    end
end