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

  desc 'Detect faces and update arts with face data in db'
  task detect_faces: :environment do
    Art.find_each do |art|
      response = get_gender(art.id)
      unless response['imageFaces'].empty?
        face = response['imageFaces'][0]
        gender = face['gender']['gender']
        ageRange = face['age']['ageRange']
        height = face['height']
        width = face['width']
        positionX = face['positionX']
        positionY = face['positionY']
        art.update(gender: gender, age_range: ageRange, height: height, width: width, positionX: positionX, positionY: positionY)
      end
    end
  end

  desc 'Load art only if face detected'
  task populate_arts_if_face: :environment do
    path = 'data/arts.csv'
    Art.transaction do
      CSV.foreach(Rails.root + path, encoding: 'ISO-8859-1:UTF-8', headers: true, header_converters: :downcase) do |art_row|
        art = art_row.to_hash
        image_url = path_to_image(art['url'])
        response = detect_faces(image_url)
        if response['status'] == 'OK' && response['imageFaces'].any?
          face = response['imageFaces'][0]
          art['gender'] = face['gender']['gender']
          art['age_range'] = face['age']['ageRange']
          art['height'] = face['height']
          art['width'] = face['width']
          art['positionX'] = face['positionX']
          art['positionY'] = face['positionY']
          Art.find_or_create_by!(art)
          pp(Art.order("created_at DESC").first)
        else
          puts "No face detected in #{art}"
        end
      end
    end
  end

  def get_gender(art_id)
    image_url = path_to_image(Art.find(art_id).url)
    params = {
      'url' => image_url,
      'apikey' => ENV['ALCHEMY_KEY'],
      'outputMode' => 'json'
    }
    api_url = 'https://gateway-a.watsonplatform.net/calls/url/URLGetRankedImageFaceTags'

    response = HTTParty.get(api_url, query: params, headers: { 'Accept-encoding' => 'gzip' })

    puts response.parsed_response

    response.parsed_response
  end

  def detect_faces(url)
    params = {
      'url' => url,
      'apikey' => ENV['ALCHEMY_KEY'],
      'outputMode' => 'json'
    }

    api_url = 'https://gateway-a.watsonplatform.net/calls/url/URLGetRankedImageFaceTags'

    response = HTTParty.get(api_url, query: params, headers: { 'Accept-encoding' => 'gzip' })

    response.parsed_response
  end

  def path_to_image(url)
    url.sub('/html/', '/art/').sub('.html', '.jpg')
  end
end
