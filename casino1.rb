# encoding: cp1251

if (Gem.win_platform?)
        Encoding.default_external = Encoding.find(Encoding.locale_charmap)
        Encoding.default_internal = __ENCODING__

        [STDIN, STDOUT].each do |io|
                io.set_encoding(Encoding.default_external, Encoding.default_internal)
        end
end

print "������� ��� ���? "
age = gets.to_i

if age >= 18
	puts "������ ����� ������� � ���������� �������!"
	puts "� ��� � ������� $100. � ��������, ��� ����� ����, ��������� $2000."
	puts "�� ������ ����� ��� ������? �� ������ �������� ������? (Y/N)"
	wannaplay = gets.strip.capitalize
		if wannaplay == "Y"
			money = 100
			bank = 2000
			speed = 0.1
			x = 0
			y = 0
			z = 0
			1000.times do
				if money >= 10
					puts "���� ���� �� �������� ����� $10. ������� Enter, ����� ������� �����!"
					gets
					money = money - 10
					bank = bank + 10
					1.upto(10) do
						x = rand(0..9)
						y = rand(0..9)
						z = rand(0..9)
						print "\r#{x} #{y} #{z}"
						sleep speed
					end
					
					print "\r#{x} #{y} #{z}\n"
					

					
					if x == y && x == z
					    	print "���!"
					else
						if x == 1 && y == 2 && z == 3 && roll == 1
							puts "�������! �� �������� $1500."
							puts "��� ����: $#{money}.\t ������� � ��������: $#{bank}."	
						else
							puts "�������!"
							puts "��� ����: $#{money}.\t ������� � ��������: $#{bank}."
						end
					end
				elsif money < 10
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