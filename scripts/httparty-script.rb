require 'HTTParty'

url = URI.escape('http://www.wga.hu/art/g/goya/5/510goya.jpg')

response = HTTParty.get("https://apius.faceplusplus.com/v2/detection/detect?url=#{url}&api_secret=f2FOY1uWSWL7I-QRO_DhG6AyWZDbUaw8&api_key=8eed808875b9b78e8d24f5ffbd0005e7&attribute=glass,pose,gender,age,race,smiling")


puts response.body, response.code, response.message, response.headers.inspect
