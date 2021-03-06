###
# Blog settings
###

# Time.zone = "EST"

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  blog.sources = "posts/{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  blog.layout = "blog"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
  helpers do
    def nav_link_to(link, url, opts={})
      if current_resource.url == url_for(url)
        prefix = '<li class="active">'
      else
        prefix = '<li>'
      end
      prefix + link_to(link, url, opts) + "</li>"
    end
  end


set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :url_root, 'http://www.codeforcharlotte.org'

activate :search_engine_sitemap

# Google Analytics
activate :google_analytics do |ga|
  # Property ID (default = nil)
  ga.tracking_id = 'UA-51227922-3'
  # Removing the last octet of the IP address (default = false)
  ga.anonymize_ip = false
  # Tracking across a domain and its subdomains (default = nil)
  ga.domain_name = 'codeforcharlotte.org'
  # Tracking across multiple domains and subdomains (default = false)
  ga.allow_linker = false
  # Tracking Code Debugger (default = false)
  ga.debug = false
  # Tracking in development environment (default = true)
  ga.development = false
  # Compress the JavaScript code (default = false)
  ga.minify = true
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
