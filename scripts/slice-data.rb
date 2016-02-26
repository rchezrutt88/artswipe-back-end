require 'csv'
require 'pry'
catalog = '../data/catalog.csv'
catalog2 = '../data/catalog2.csv'

def random_lines(input_file, output_file, num)
  header = File.open(input_file, &:readline)

  old_csv = CSV.open(input_file, 'r', col_sep: ';', headers: true)
  new_csv = CSV.open(output_file, 'w', col_sep: ';', headers: true)

  new_csv << CSV.parse_line(header, col_sep: ';')

  rows = old_csv.to_a.slice(1..-1)
  random_rows = rows.sample(num)

  random_rows.each { |row| new_csv << row }
end
