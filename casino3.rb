# encoding: cp1251

if (Gem.win_platform?)
        Encoding.default_external = Encoding.find(Encoding.locale_charmap)
        Encoding.default_internal = __ENCODING__

        [STDIN, STDOUT].each do |io|
                io.set_encoding(Encoding.default_external, Encoding.default_internal)
        end
end

wintable = { '000' => 100, '111' => 10, '222' => 20, '333' => 30, '444' => 40, '555' => 50, '666' => 60, '777' => 70, '888' => 80, '999' => 90 }
fail = false
win = false

print "������� ��� ���? "
age = gets.to_i

if age >= 18
	puts "������ ����� ������� � ���������� �������!"
	puts "� ��� � ������� $100. � ��������, ��� ����� ����, ��������� $2000."
	puts "�� ������ ����� ��� ������? �� ������ �������� ������? (Y/N)"
	wannaplay = gets.strip.capitalize
		if wannaplay == "Y"
			bandit = 1
			@money = 100
			@bank = 2000
			speed = 0.1
			def moneycount(a, b, c)
				@money = @money + c
				@bank = @bank - c
				puts "�� �������� $#{c}!"
				puts "��� ����: $#{a}.\t ������� � ��������: $#{b}."  
			end
			x = 0
			y = 0
			z = 0
			while bandit == 1
				if @money >= 10
					puts "���� ���� �� �������� ����� $10. ������� Enter, ����� ������� �����!"
					gets
					@money = @money - 10
					@bank = @bank + 10
					1.upto(10) do
						x = rand(0..9).to_s
						y = rand(0..9).to_s
						z = rand(0..9).to_s
						print "\r#{x} #{y} #{z}"
						sleep speed
					end
					
				 print "\r#{x} #{y} #{z}\n"

				 result = x + y + z
				won = false
 				fail = false

 wintable.each do |key, value|
    if result == key && won == false
         @money = @money + value
         @bank = @bank - value
         puts "�� �������� $#{value}!"
         puts "��� ����: $#{@money}.\t ������� � ��������: $#{@bank}."
         won = true
    else
         fail = true
    end
 end
 if fail == true && won == false
         fail = false
         puts "�������!"
         puts "��� ����: $#{@money}.\t ������� � ��������: $#{@bank}."
 end	print "\r#{x} #{y} #{z}\n"
					result = x + y + z

					wintable.each do |key, value|
					   if result == key
						
						money = money + value
						bank = bank - value
					        puts "�� �������� $#{value}!"
						puts "��� ����: $#{money}.\t ������� � ��������: $#{bank}."
					   else 
						fail = true
		                           end
					end
					if fail == true
						fail = false
						puts "�������!"
						puts "��� ����: $#{@money}.\t ������� � ��������: $#{@bank}."
					end	
					
				elsif @money < 10
					print "� ��� ������������ �����, ����� ���������� ����. ��������� � ��� ���!"
					exit
				end
			end
		elsif wannaplay == "N"
			print "����� �� ��������� ��������� ��� �������� ���������. ��� ��� ���� ��������!"
			exit
		else
			print "�� �� ��������, ���� �� ������. �� ������ ������, ����� ���!"
			exit
		end			
else
	print "�� ������� ������! ������ - �� ����� ��� ���. ���� ��������!"
	exit
end