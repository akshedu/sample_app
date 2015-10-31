if Rails.env.production?
	CarrierWave.configure do |config|
		config.fog_credentials = {
		cloud_name: 'dejrtx1pr'
		api_key: '952536564313238'
		api_secret: 'a0Mo73MHmNv21hBbkAeWJ5buWb4'
		cdn_subdomain: true}
	end
end
