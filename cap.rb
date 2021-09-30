require_relative 'p1'
require 'colorize'

class Revista
	attr_accessor :nombre
  def initialize (nombre)
	@nombre = nombre 
	end

	def menu
		puts "+-------------------------------+".colorize(:yellow)
		puts "|       Notice of today         |".colorize(:yellow)
		puts "+-------------------------------+".colorize(:yellow)
		puts
		puts "1. Notice Rabbit".colorize(:red)
		puts "2. Other Nitice".colorize(:blue)
		puts "3. Notice Rabbit and Other ".colorize(:green)
		puts "4. Exit"
		puts
	end

	def notice_rabit
		notice_rabit = Ready.new("https://www.reddit.com/.json")
		arreglo = notice_rabit.array(notice_rabit.transfor)
		time = notice_rabit.time(arreglo)
		ready = notice_rabit.array_order(time)
		ready
	end

	def puts_rabit(array)
		(0..array.length-1).each do |i|
			print "                                               Noticia # #{i} From Rabbit "
			puts "Date: #{array[i]["Fecha"]}".colorize(:blue)   
			puts
			print "Titulo : ".colorize(:green) 
			puts array[i]["Titulo"]
			print "Author : ".colorize(:red) 
			puts array[i]["Autor"]
			print "Link : ".colorize(:yellow) 
			puts array[i]["Link"]
			puts
			puts "+-------------------------------------------------------------------------------------------------------------------------------------+".colorize(:dark)
		end
	end
end

 
see = true

while see == true 
	revista = Revista.new("engel")
	revista.menu
	options = gets.chomp.to_i
	case options
		when 1
 		revista.puts_rabit(revista.notice_rabit)
		when 2
		puts " No hay notice"
		when 3
		puts	" No hay notice"
		when 4
		see = false
	end
end
		