namespace :db do
  desc 'Load example data from db/examples.rb'
  task examples: :environment do
    require_relative '../../db/examples'
  end

  unless Rails.env == 'production'
    desc 'Drop and setup the development database with examples'
    task nuke_pave: %w(environment db:drop db:create db:migrate db:seed db:examples) do
      puts "Nuke and pave of #{Rails.env} complete."
    end
  end

  desc 'Detect gender of art in db'
  task detect_faces: :environment do
    Art.find_each do |art|
      response = get_gender(art.id)
      unless response['imageFaces'].empty?
        gender = response['imageFaces'][0]['gender']['gender']
        art.update(gender: gender)
      end
    end
  end

  def get_gender(art_id)
    image_url = path_to_image(Art.find(art_id).url)
    params = {
      'url' => image_url,
      'apikey' => ENV["ALCHEMY_KEY"],
      'outputMode' => 'json'
    }
    api_url = 'https://gateway-a.watsonplatform.net/calls/url/URLGetRankedImageFaceTags'

    response = HTTParty.get(api_url, query: params, headers: { 'Accept-encoding' => 'gzip' })

    puts response.parsed_response

    response.parsed_response

  end

  def path_to_image(url)
    url.sub('/html/', '/art/').sub('.html', '.jpg')
  end
end
