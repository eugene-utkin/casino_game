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
         puts "Вы выиграли $#{value}!"
         puts "Ваш счет: $#{@money}.\t Остаток в автомате: $#{@bank}."
         won = true
    else
         fail = true
    end
 end
 if fail == true && won == false
         fail = false
         puts "Неудача!"
         puts "Ваш счет: $#{@money}.\t Остаток в автомате: $#{@bank}."
 end	print "\r#{x} #{y} #{z}\n"
					result = x + y + z

					wintable.each do |key, value|
					   if result == key
						
						money = money + value
						bank = bank - value
					        puts "Вы выиграли $#{value}!"
						puts "Ваш счет: $#{money}.\t Остаток в автомате: $#{bank}."
					   else 
						fail = true
		                           end
					end
					if fail == true
						fail = false
						puts "Неудача!"
						puts "Ваш счет: $#{@money}.\t Остаток в автомате: $#{@bank}."
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