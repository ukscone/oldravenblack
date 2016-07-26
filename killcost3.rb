HOLYWATER   = 2000
GARLICSPRAY = 1000

DISCOUNT = 0.7

CHARISMA0 = 1
CHARISMA1 = 0.97
CHARISMA2 = 0.93
CHARISMA3 = 0.90

LIMIT = 1200



class Vampire
  def initialize(name,blood)
    @name = name
    @blood = blood
    @holywater = 0
    @garlicspray = 0
  end

  def holywater_kill(target)
    bp = @blood
    hw=0
    while bp > target && bp > LIMIT
      bp = (bp-((bp**0.1)*(bp**0.5)))
      hw = hw + 1
    end
    @blood = bp.round
    @holywater = hw
    puts("\nUsed #{hw} holywaters. New bp is #{bp.round}\n")
  end

  def garlicspray_kill(target)
    bp = @blood
    gs = 0
    while bp > target
      bp = bp - 37
      gs = gs + 1
    end
    if bp < 0
      bp = 0
    end
    @blood = bp
    @garlicspray = gs
    puts("Used #{gs} garlic sprays. New bp is #{bp}\n")
  end

  def results(charisma)
    hw_normal=0
    hw_discount=0
    gs_normal=0
    gs_discount=0
    puts("\nUsed #{@holywater} holywater(s) and #{@garlicspray} garlic spray(s)\n#{@name} has #{@blood} blood points now.\n")
    case charisma
      when 0
        hw_normal = (HOLYWATER*@holywater)*CHARISMA0
        hw_discount = ((HOLYWATER*DISCOUNT)*@holywater)*CHARISMA0
        gs_normal = (GARLICSPRAY*@garlicspray)*CHARISMA0
        gs_discount = ((GARLICSPRAY*DISCOUNT)*@garlicspray)*CHARISMA0
      when 1
        hw_normal = (HOLYWATER*@holywater)*CHARISMA1
        hw_discount = ((HOLYWATER*DISCOUNT)*@holywater)*CHARISMA1
        gs_normal = (GARLICSPRAY*@garlicspray)*CHARISMA1
        gs_discount = ((GARLICSPRAY*DISCOUNT)*@garlicspray)*CHARISMA1
      when 2
        hw_normal = (HOLYWATER*@holywater)*CHARISMA2
        hw_discount = ((HOLYWATER*DISCOUNT)*@holywater)*CHARISMA2
        gs_normal = (GARLICSPRAY*@garlicspray)*CHARISMA2
        gs_discount = ((GARLICSPRAY*DISCOUNT)*@garlicspray)*CHARISMA2
      when 3
        hw_normal = (HOLYWATER*@holywater)*CHARISMA3
        hw_discount = ((HOLYWATER*DISCOUNT)*@holywater)*CHARISMA3
        gs_normal = (GARLICSPRAY*@garlicspray)*CHARISMA3
        gs_discount = ((GARLICSPRAY*DISCOUNT)*@garlicspray)*CHARISMA3
     end
    puts("\n\n#{@holywater} holywater will cost #{hw_normal} gp (Normal) or #{hw_discount} gp (Discount)\n")
    puts("#{@garlicspray} garlic spray will cost #{gs_normal} gp or #{gs_discount} gp (Discount)\n")
    puts("total cost: #{hw_normal+gs_normal} gp (Normal) or #{hw_discount+gs_discount} gp (Discount)\n")
  end
end

print("killcost\n~~~~~~~~\n")
while 1
  print("Vampire Name        : ")
  name = gets.chomp()
  print("Current Blood Points: ")
  blood = gets().to_i
  print("Desired Blood Points: ")
  target = gets().to_i
  print("Your Charisma       : " )
  charisma = gets().to_i


  vamp = Vampire.new(name,blood)

   vamp.holywater_kill(target)
    if target < LIMIT
      vamp.garlicspray_kill(target)
    end
  vamp.results(charisma)
  puts("\nPress a key to continue\n")

i=STDIN.getc()
end
