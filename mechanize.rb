require 'open-uri'
require 'nokogiri'
require 'inline-style'


stylesheetFolder = "stylesheet"
url = 'http://sweng.web.fc2.com/ja/index.html'
uri = URI(url)
path = uri.path
host = url.gsub(/#{path}/, '')

if path.include? "index\.html"
  path = path.gsub(/index\.html/, '')
end

stylesheetList = []
stylesheetLinkList = []

doc = Nokogiri::HTML.parse(open(url))
linkStylesheetList = doc.xpath("//link[@rel='stylesheet']")

linkStylesheetList.each do |linkStylesheet|
  stylesheetList.push(linkStylesheet['href'])
end

stylesheetList.each do |stylesheet|
  if stylesheet.include? "http"
    stylesheetLinkList.push(stylesheet)
  else
    relativePath = File.expand_path(stylesheet, path)
    stylesheetLinkList.push(host + relativePath)
  end
end


stylesheetLinkList.each do |stylesheetLink|
  `wget #{stylesheetLink} -P #{stylesheetFolder}`
end

`cat #{stylesheetFolder}/* > stylesheet.css`
`rm -rf #{stylesheetFolder}`

`curl #{url} > index.html`

`node uncss.js`

`./cssIntoHTML.sh`

`node juice.js`

