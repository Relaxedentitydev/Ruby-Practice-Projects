require 'nokogiri'
require 'open-uri'

def fetch_page(url)
  URI.open(url)
rescue OpenURI::HTTPError => e
  puts "Failed to fetch #{url}: #{e.message}"
  nil
end

def scrape_page(url)
  html = fetch_page(url)
  return unless html

  doc = Nokogiri::HTML(html)
  puts "Thread Title: #{doc.title}"

  doc.css('.postContainer').each do |post|
    post_id = post['id']
    content_element = post.css('.postMessage')

    content = content_element.text.strip unless content_element.empty?

    puts "Post ID: #{post_id}" if post_id
    puts "Content: #{content}" if content
    puts '---'
  end

  sleep(rand(1..3)) # Respect rate limits
end

initial_url = 'https://boards.4chan.org/vt/thread/80276968'
scrape_page(initial_url)
