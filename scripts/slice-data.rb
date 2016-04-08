# to slice data file down to manageable size

require 'csv'
require 'pry'
catalog = File.expand_path("./data/portraits.csv", Dir.pwd)
arts_csv = File.expand_path("./data/arts.csv", Dir.pwd)


def format_csv(input_file, output_file, num)

  old_csv = CSV.read(input_file, "r:ISO-8859-1", headers: true)
  # puts old_csv

  CSV.open(output_file, 'a+', headers: true) do |csv|
    headers = old_csv.headers
    csv << headers
    random_rows = old_csv.to_a.slice(1..-1).sample(num)
    random_rows.each do |row|
      csv << row
    end

  end
end

format_csv(catalog, arts_csv, 10)



# def random_lines(input_file, output_file, num)
#   header = File.open(input_file, &:readline)
#
#
#   new_csv = CSV.open(output_file, 'w', col_sep: ';', headers: true)
#
#   new_csv << CSV.parse_line(header, col_sep: ';')
#
#   rows = old_csv.to_a.slice(1..-1)
#
#
#   random_rows = rows.sample(num)
#
#   random_rows.each do |row|
#     if
#   end
# end
