require 'net/http'

namespace :sitetrackr do
	desc "Check all active sites."
	task :check => :environment do
		Site.where(active: true).each do |site|
			c = is_site_up? site.url
			Status.create(site_id: site.id, status: c[:status], response_code: c[:code])
		end
	end

	def get_response(url)
		uri = URI.parse(url)
		path = (uri.path.empty?) ? '/' : uri.path

		request = Net::HTTP.new(uri.hostname, uri.port)
		request.request_head(path)
	end

	def is_site_up?(url)
		response = get_response(url)
		up = ["200", "302"].include? response.code
		{ status: up, code: response.code }
	end
end
