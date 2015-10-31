if Rails.env.production?
	CarrierWave.configure do |config|
		config.cloud_name = 'dejrtx1pr'
		config.api_key = '952536564313238'
		config.api_secret = 'a0Mo73MHmNv21hBbkAeWJ5buWb4'
		config.cdn_subdomain = true
	end
end
