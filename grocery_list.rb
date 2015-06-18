class Grocery

# Get the party started.

	def initialize()
		@grocery_list = {@item_name => nil, @quantity => nil}
        name_list
	end

# Some 'please fix' type responses.

	def doesnt_exist
		puts "That item doesn't exist."
		get_item
	end

	def not_an_integer
		puts "Sorry.  That's not a number."
		get_item
    end

# Introduction

	def name_list
		puts "Welcome to Grocery List Maker 3000."
		puts "What would you like to name this list?"
		@list_name = gets.chomp
		@list_name
		get_item
	end

# For exiting the program

	def thats_all
	    puts ""
	    puts ""
	    puts "Thanks for using Grocery List 3000!"
	    puts ""
        puts ""
	end

# I didn't like it, but I put in two versions of print_list. I'm sure there's something more elegant.

	def print_list_delete
		puts ""
		puts ""
		puts @list_name
		print "-" * 40
		@grocery_list.each {|k, v| puts "#{k} #{v}"}
		puts ""
		delete_item
	end

# Here's the other print_list.
	
	def print_list
	    puts ""
	    puts ""
		puts "#{@list_name}"
		print "-" * 40
		@grocery_list.each {|k, v| puts "#{k} #{v}"}
		puts ""
		get_item
	end

# Now we have a method for each of the three write/modify options.
	
	def add_item
	    puts "What is the name of the item you'd like to add?"
		@item_name = gets.chomp
		puts "And how many?"
		@quantity = gets.chomp.to_i
		if @quantity <= 0
		    puts "Please enter a number higher than 0."
		    puts "(Also, must be '1' not 'one'.)"
		else
		    @grocery_list[@item_name] = @quantity
		end
		get_item
	end
	
	def delete_item
		puts "Which item did you want to delete?"
		@delete = gets.chomp
		if @grocery_list.has_key?(@delete)
			@grocery_list.delete(@delete)
		else
			doesnt_exist
		end
		get_item
	end
	
	def modify_item
	    puts "Which item did you want to modify?"
		@item_name = gets.chomp
		puts "And how many?"
		@quantity = gets.chomp.to_i
		if @grocery_list.has_key?(@item_name) && @quantity > 0
			@grocery_list[@item_name] = @quantity
		elsif @quantity <= 0
		    puts "Please enter a number higher than 0."
		    puts "(Also, must be '1' not 'one'.)"
		else 
			doesnt_exist
		end
		get_item
	end

# The return point for making changes or viewing the list.
	
	def get_item
		puts ""
 		puts "What would you like to do?"
 		puts ""
		puts "(a)dd item, (d)elete item, (m)odify quantity, (p)rint list, or e(x)it?"
		response = gets.chomp
		response.downcase!
		if response == "a"
			add_item
		elsif response == "d"
			print_list_delete
		elsif response == "m"
			modify_item
		elsif response == "p"
			print_list
		elsif response == "x"
		    thats_all
		else
			puts "Sorry that's not one of the choices."
			get_item
		end
	end
end




new_list = Grocery.new()