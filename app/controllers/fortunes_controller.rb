class FortunesController < ApplicationController

  def horoscopes
    # all_zodiacs = Zodiac.list.with_indifferent_access
    # all_signs = params.fetch(:the_sign)
    # all_signs = all_zodiacs.keys

    # @array_of_signs = Array.new
    # @array_of_horoscopes = Array.new


    # 12.times do

    #   @this_zodiac = all_signs.at(:name)
    #   @horoscope = all_signs.fetch(:horoscope)

    #   @array_of_signs.push(this_zodiac)
    #   @array_of_horoscopes.push(horoscope)

    # end

    # @this_zodiac = all_zodiacs.fetch(:aries)[1]
    # @horoscope = all_zodiacs.fetch(:aries)[2]

    all_zodiacs = Zodiac.list

    @this_zodiac = params.fetch("the_sign")

    @all_signs = all_zodiacs.keys

    counter = 0
    
    while counter < @all_signs.length
      @signs_to_sym = all_zodiacs.fetch(@this_zodiac.to_sym)
      @horoscopes = @signs_to_sym.fetch(:horoscope)

      counter = counter + 1
    end

    @array_of_lucky_numbers = Array.new

    5.times do
      @new_lucky_number = rand(0..100)
      @array_of_lucky_numbers.push(@new_lucky_number)
    end

    render({ :template => "horoscope_templates/all_signs.html.erb"})
  end

end