module NewFile

	def new_file(fname)
	
		if File::exists?(fname) 
			
			puts "File Already Existed"
		else
			file = File.new(fname, 'w')
			puts 'Enter Text into File (At The End type "EOF"):'
			$/ = "EOF"
			data = gets
			data.delete!("EOF")
    	                file.syswrite(data)
		        puts "One File is Created"
		        file.close # Closing File
                end #if
                	
	end #new_file(-)
	
end # NewFiles

module OpenFile

	def open_file(fname)
		
		if File::exists?(fname) 
		
			File.open(fname, 'r') do |f|  
	                	
	                	while line = f.gets  
				    puts line  
		  		end #while
		        f.close # Closing File
			end  #File Block
		else
			puts puts "File Does Not Exist"
		end # if
		
	end # open_file(-)
end #OpenFile

module UpdateFile

	def update_file(fname)
		
		if File::exists?(fname) 
		
			file = File.new(fname, 'a+')
			puts 'Enter Text into File (At The End type "EOF") :'
			$/ = "EOF"
			data =gets
			data.delete!("EOF")
		        file.syswrite(data)
			puts "One File is Updated"
			file.close # Closing File
		 else
		 	puts "File Does Not Exist"
		end #if
	
	end # update_file(-)

end #UpdateFile


class FileOperations

#Mixin
include NewFile
include OpenFile
include UpdateFile

def operations

	puts "1.Create New File"
	puts "2.Open File"
	puts "3.Update File"

	print "Enter Your Choice(1 or 2 or 3) : "
	choice=gets.chomp.to_i

	case choice
		
		when 1
			print "Enter File Name to Create a New File (.txt/.doc) : "
			fname=gets.chomp
			new_file(fname) # Method in NewFile Module
		when 2
			print "Enter File Name to Open : "
			fname=gets.chomp
			open_file(fname) # Method in OpenFile Module
		when 3
			print "Enter File Name to Update the  File : "
			fname=gets.chomp
			update_file(fname) # Method in UpdateFile Module
		else
			puts "Invalid Choice Please Try Again"
	end # case
	
end # operations

end # class

oper=FileOperations.new
oper.operations
