class Vampire
  def initialize(name, blood)
    @name = name
    @blood = blood
  end
  def kill()
    bp = @blood
    hw = 0
    while bp > 1400
      bp = bp-((bp**0.1)*(bp**0.5))
      hw += 1
    end
    gs = bp = bp.modulo(70)
    st = bp = bp.modulo(10)
    st = st + 1
    puts("Vampire: #{@name}\n Starting BP: #{@blood}\nFinal BP: #{bp.round}\nhw needed = #{hw}\n gs needed = #{gs.round}\n SoT needed = #{st.round}\n")
    puts("Minimum AP needed: #{((hw+gs)*2)+st}\n")
end
end

vamp = Vampire.new("ukscone", 15751)
vamp.kill

