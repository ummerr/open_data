require 'soda'
require 'pry'


class SatScoreGenerator

  attr_accessor :score, :subject
  attr_reader :client, :response

  def initialize
    @client = SODA::Client.new({:domain => "data.cityofnewyork.us", :app_token => "xQSxQTgxE84h7p1i4byfItWMR"})
    @response = client.get("zt9s-n5aj")
    @score = nil
    @subject = nil
    get_score
  end

  def get_score
    puts "Welcome to NYC SCHOOL SAT SCORE searcher."
    puts "Enter a minimum score that you want to search by (between 0 and 800)"
    @score = gets.chomp
    get_subject
  end

  def get_subject
    puts "Please enter the subject of SAT score you want to search by:"
    puts "The options are 'Math', 'Writing' or 'Reading'"
    subject = gets.chomp.downcase
    if subject == 'math'
      @subject = "mathematics_mean"
    elsif subject == 'writing'
      @subject = "writing_mean"
    elsif subject == 'reading'
      @subject = "critical_reading_mean"
    else
      puts "The options are 'Math', 'Writing' or 'Reading'"
    end
    score_response
  end

  def score_response
    response = client.get("zt9s-n5aj", {'$where' => "#{@subject} > #{@score}"})

    response.each do |school|
      puts "#{school.school_name}"
      puts "WRITING: #{school.writing_mean}"
      puts "READING: #{school.critical_reading_mean}"
      puts "MATHS: #{school.mathematics_mean}"
    end
  end

end

sat = SatScoreGenerator.new




