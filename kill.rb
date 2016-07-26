class Vampire
  def initialize(name, blood)
    @name = name
    @blood = blood
  end

  def hw_kill(number)
    bp = @blood
    number.times do |i|
      bp = (bp-((bp**0.1)*(bp**0.5)))
    end
    puts("Vampire: #{@name}\nStarting BP: #{@blood}\nEnding BP  : #{bp.round}\n")
  end

  def gs_kill(number)
    bp = @blood
    number.times do |i|
      bp = bp - 37
    end
    puts("Vampire: #{@name}\nStarting BP: #{@blood}\nEnding BP   : #{bp.round}\n")
  end

  def sot_kill(number)
    bp = @blood
    number.times do |i|
      bp = bp - 2.5
    end
    puts("Vampire: #{@name}\nStarting BP: #{@blood}\nEnding BP   : #{bp.round}\n")
    end
end

puts("killscript\n~~~~~~~~~~\n")
puts("Vampire Name        : ")
name = gets()
puts("Current Blood Points: ")
blood = gets().to_i

vamp = Vampire.new(name, blood)
puts("Number of items: ")
i = gets().to_i
puts("hw=1/gs=2/sot=3")

case gets().to_i
  when 1
    puts("killing with holywater")
    vamp.hw_kill(i)
  when 2
    puts("killing with garlic spray")
    vamp.gs_kill(i)
  when 3
    puts("killing with SoT")
    vamp.sot_kill(i)
end
i=gets()
