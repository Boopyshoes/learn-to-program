require 'yaml'

test_array = ['Give Quiche a Chance',
              'Mutants Out!',
              'Chameloenic Life-Forms, No Thanks'
              ]

test_string = test_array.to_yaml

filename = 'RimmerTSirts.txt'
File.open filename, 'w' do |f|
  f.write test_string
end

read_string = File.read filename

read_array = YAML::load read_string
puts(read_string == test_string)
puts(read_array == test_array)
puts read_string
puts read_array.to_s