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
      gender = get_gender(art.id)
      art.update(gender: gender)
    end
  end

  def get_gender(art_id)
    image_url = path_to_image(Art.find(art_id).url)
    params = {
      url: image_url,
      api_secret: 'f2FOY1uWSWL7I-QRO_DhG6AyWZDbUaw8',
      api_key: '8eed808875b9b78e8d24f5ffbd0005e7',
      attribute: 'gender,age,race,smiling'
    }
    api_url = 'https://apius.faceplusplus.com/v2/detection/detect'

    response = HTTParty.get(api_url + '?' + params.to_query)

    # puts response.body, response.code, response.message, response.headers.inspect

    response_object = JSON.parse(response.body, symbolize_names: true)

    # pp(response_object[:face][0][:attribute][:gender]) unless response_object[:face].empty?

    unless (response_object[:face].empty?)
      return response_object[:face][0][:attribute][:gender][:value]
    else
      return nil
    end

  end

  def path_to_image(url)
    url.sub('/html/', '/art/').sub('.html', '.jpg')
  end
end
