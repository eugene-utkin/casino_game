# encoding: cp1251

if (Gem.win_platform?)
        Encoding.default_external = Encoding.find(Encoding.locale_charmap)
        Encoding.default_internal = __ENCODING__

        [STDIN, STDOUT].each do |io|
                io.set_encoding(Encoding.default_external, Encoding.default_internal)
        end
end

print "Сколько вам лет? "
age = gets.to_i

if age >= 18
	puts "Пришло время сыграть в однорукого бандита!"
	puts "У вас в кармане $100. В автомате, что перед вами, находится $2000."
	puts "Вы хотите взять эти деньги? Вы готовы испытать судьбу? (Y/N)"
	wannaplay = gets.strip.capitalize
		if wannaplay == "Y"
			bandit = 1
			@money = 100
			@bank = 2000
			speed = 0.1
			def moneycount(a, b, c)
				@money = @money + c
				@bank = @bank - c
				puts "Вы выиграли $#{c}!"
				puts "Ваш счет: $#{a}.\t Остаток в автомате: $#{b}."  
			end
			x = 0
			y = 0
			z = 0
			while bandit == 1
				if @money >= 10
					puts "Одна игра на автомате стоит $10. Нажмите Enter, чтобы дернуть рычаг!"
					gets
					@money = @money - 10
					@bank = @bank + 10
					1.upto(10) do
						x = rand(0..9)
						y = rand(0..9)
						z = rand(0..9)
						print "\r#{x} #{y} #{z}"
						sleep speed
					end
					
					print "\r#{x} #{y} #{z}\n"
					

					
					if x == y && x == z
						if x == 1 && y == 1 && z == 1
					    	moneycount(@money, @bank, 10)
						end
					else
						if x == 1 && y == 2 && z == 3 && roll == 1
							puts "Джекпот! Вы выиграли $1500."
							puts "Ваш счет: $#{@money}.\t Остаток в автомате: $#{@bank}."	
						else
							puts "Неудача!"
							puts "Ваш счет: $#{@money}.\t Остаток в автомате: $#{@bank}."
						end
					end
				elsif @money < 10
					print "У вас недостаточно денег, чтобы продолжить игру. Приходите к нам еще!"
					exit
				end
			end
		elsif wannaplay == "N"
			print "Тогда мы вынуждены попросить вас покинуть заведение. Для вас игра окончена!"
			exit
		else
			print "Мы не понимаем, чего вы хотите. На всякий случай, идите вон!"
			exit
		end			
else
	print "Вы слишком молоды! Казино - не место для вас. Игра окончена!"
	exit
end