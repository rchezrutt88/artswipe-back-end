require 'csv'
catalog = '../data/catalog.csv'
catalog2 = '../data/catalog2.csv'

def random_lines(input_file, output_file, num)

    header = File.open(input_file) {|f| f.readline }

    old_csv = CSV.open(input_file, 'r', col_sep: ';', headers: true)
    new_csv = CSV.open(output_file, 'w', col_sep: ';', headers: true)

    new_csv << CSV.parse_line(header, col_sep: ';')

    rows = old_csv.to_a.slice(1..-1)
    random_rows = rows.sample(num)

    random_rows.each do |row|
      new_csv << row
    end

  end











#
#   header = File.open(input_file) {|f| f.readline }
#
#   puts header
#
#   # old_csv = CSV.open(input_file, 'r', col_sep: ';', headers: true, return_headers: true)
#   new_csv = CSV.open(output_file, 'a+', col_sep: ';', headers: false)
#   new_csv << header
#
#
#
# end

random_lines(catalog, catalog2, 10)


#   rows = CSV.open(input_file, col_sep: ';', headers: true) do |csv|
#     csv.to_a.to_a.slice(1..-1).sample(num)
#   end
#
# puts rows


#   CSV.open(output_file, 'a+') do |csv|
#     csv << CSV.open(output_file).first
#
# end


  #
  #
  # puts new_csv.headers
  # puts old_csv.headers
  # puts new_csv.headers
  #
  # puts old_csv.to_s


  #
  # new_csv << old_csv.read
  # random_rows.each do |row|
  #   new_csv << row
  # end
  # rows = File.readlines(input_file)
  # header = rows.shift
  # lessRows = rows.sample(num)
  #
  #
  # CSV.open(output_file, 'w', col_sep: ';', headers: header) do |csv|
  #   lessRows.each do |row|
  #     csv << row
  #   end
  # end


  # old_file = CSV.open(input_file, 'r', col_sep: ';', headers: true)
  #
  # CSV.open(output_file, 'a', col_sep: ';', headers: old_file.headers) do |row|
  #   row.puts(old_file.to_a.sample(num))
  # end

  # CSV.open(input_file, 'r', col_sep: ';', headers: true, )
  #
  #
  # CSV.open(input_file, { col_sep: ';', header: true}) do |row|
  #
  #
  # new_file = File.open(output_file, 'w+')
  # old_file = File.open(input_file, 'r')
  #
  # lines = File.readlines(input_file).sample(num)
  # newFile.puts(lines)
# end
