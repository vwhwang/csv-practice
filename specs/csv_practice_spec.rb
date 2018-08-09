# csv_practice_spec.rb

require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/csv_practice'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'CSV Practice Methods' do
  describe 'load_data' do
    it 'returns an array of hashes' do
      # Arrange & Act
      data = load_data('data/SacramentocrimeJanuary2006.csv')

      # Assert
      expect(data.class).must_equal Array
      data.each do |data_row|
        expect(data_row.class).must_equal Hash
        expected_keys = %w[cdatetime address district beat grid crimedescr latitude longitude]

        expected_keys.each do |key|
          expect(data_row.key?(key)).must_equal true
        end
      end
    end

    it 'has the proper number of rows' do
      # Arrange & Act
      data = load_data('data/SacramentocrimeJanuary2006.csv')

      # Assert
      expect(data.length).must_equal 7584
    end

    it 'has the right 1st row' do
      # Arrange & Act
      data = load_data('data/SacramentocrimeJanuary2006.csv')

      # Assert
      expect(data.first['cdatetime']).must_equal '1/18/06 4:40'
      expect(data.first['address']).must_equal 'SAN JUAN RD / EL CENTRO RD'
      expect(data.first['district']).must_equal '1'
    end

    it 'has the right last row' do
      # Arrange & Act
      data = load_data('data/SacramentocrimeJanuary2006.csv')

      # Assert
      expect(data.last['cdatetime']).must_equal '1/9/06 9:30'
      expect(data.last['address']).must_equal '14TH AVE / POWER INN RD'
      expect(data.last['district']).must_equal '6'
    end
  end

  describe 'total_crimes_per_district' do
    correct_totals = {
      '1' => 868,
      '2' => 1462,
      '3' => 1575,
      '4' => 1161,
      '5' => 1159,
      '6' => 1359
    }

    it 'should return a hash' do
      # Arrange
      data = load_data('data/SacramentocrimeJanuary2006.csv')

      # Act
      total_crimes = total_crimes_per_district(data)

      # Assert
      expect(total_crimes).must_be_instance_of Hash
    end

    it 'should calculate the proper totals' do
      # Arrange
      data = load_data('data/SacramentocrimeJanuary2006.csv')

      # Act
      total_crimes = total_crimes_per_district(data)

      # Assert

      correct_totals.keys.each do |key|
        expect(total_crimes[key]).must_equal correct_totals[key]
      end
    end
  end

  describe 'Can create a total crimes file' do
    it 'The file is created' do
      # Arrange
      data = load_data('data/SacramentocrimeJanuary2006.csv')
      total_crimes = total_crimes_per_district(data)

      # Act
      save_crime_totals('data/total_crimes.csv', total_crimes)

      # Assert
      expect(File.exist?('data/total_crimes.csv')).must_equal true
    end

    it 'The file contains the right entries and headers' do
      # Arrange
      data = load_data('data/SacramentocrimeJanuary2006.csv')
      total_crimes = total_crimes_per_district(data)

      # Act
      save_crime_totals('data/total_crimes.csv', total_crimes)

      # Assert
      CSV.read('data/total_crimes.csv', headers: true) do |line|
        correct_totals.keys.each do |key|
          expect(line[key]).must_equal correct_totals[key]
        end
      end
    end
  end

  describe 'all_burglary_crimes' do
    it 'returns an array of hashes' do
      # Arrange
      data = load_data('data/SacramentocrimeJanuary2006.csv')

      # Act
      burglaries = all_burglary_crimes(data)

      # Assert
      expect(burglaries.class).must_equal Array
      burglaries.each do |crime|
        expect(crime.class).must_equal Hash
      end
    end

    it 'contains only crimes with the word `burglary` in the description' do
      # Arrange
      data = load_data('data/SacramentocrimeJanuary2006.csv')

      # Act
      burglaries = all_burglary_crimes(data)

      # Assert
      burglaries.each do |crime|
        expect(crime['crimedescr'].upcase.include? 'BURGLARY').must_equal true
      end
    end
  end

  describe 'crimes_sorted_by_date' do
    it 'orders all the crime reports' do
      # Arrange
      data = load_data('data/SacramentocrimeJanuary2006.csv')

      # Act
      ordered_crimes = crimes_sorted_by_date(data)

      # Assert
      last_crime = DateTime.strptime('1/1/00', '%m/%d/%Y')
      ordered_crimes.each do |crime|
        crime_date = DateTime.strptime(crime['cdatetime'], '%m/%d/%Y %H:%M')
        expect(crime_date >= last_crime).must_equal true

        last_crime = crime_date
      end
    end
  end

  describe 'district_with_most_crime' do
    it 'returns the right value' do
      # Arrange
      data = load_data('data/SacramentocrimeJanuary2006.csv')

      # Act
      high_crime_district = district_with_most_crime(data)

      # Assert
      expect(high_crime_district).must_equal '3'
    end
  end

  describe 'district_with_least_crime' do
    it 'returns the right value' do
      # Arrange
      data = load_data('data/SacramentocrimeJanuary2006.csv')

      # Act
      high_crime_district = district_with_least_crime(data)

      # Assert
      expect(high_crime_district).must_equal '1'
    end
  end

  describe 'crime_coordinates' do
    it 'returns an array of 2-element arrays' do
      # Arrange
      data = load_data('data/SacramentocrimeJanuary2006.csv')

      # Act
      coordinates = crime_coordinates(data)

      # Assert
      expect(coordinates.class).must_equal Array
      coordinates.each do |coordinate|
        expect(coordinate.class).must_equal Array
        expect(coordinate.length).must_equal 2
      end
    end
  end
end
