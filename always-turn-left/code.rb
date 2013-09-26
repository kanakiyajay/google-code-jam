#https://code.google.com/codejam/contest/dashboard?c=32003#s=p1
=begin

Algorithm : Always Left

(If you were to stick out your left arm and touch the wall while
following this algorithm, you'd solve the maze without ever breaking contact with the wall.)

entrance_to_exit : WRWWLWWLWWLWLWRRWRWWWRWWRWLW
exit_to_entrance : WWRRWLWLWWLWWLWWRWWRWWLW

answer = 
ac5
386
9c7
e43
9c5
=end

table = Hash.new

def trueorfalse(yesorno)
    if yesorno == "Yes" 
        return true
    else
        return false
    end
end

maze = []

File.readlines('refer_table.txt').each do |line|
    arr = line.split(' ')
    key = arr.first
    table[key] =  { "n" => trueorfalse(arr[1]) , "s" => trueorfalse(arr[2]) ,"w" => trueorfalse(arr[3]) , "e" => trueorfalse(arr[4]) }
end

entrance_to_exit = "RWWLWWLWWLWLWRRWRWWWRWWRWL" #first and last have been cut
exit_to_entrance = "WRRWLWLWWLWWLWWRWWRWWL"

@all_directions = ["s","w","n","e"]

#Structure of blocks = [ ["ynny","",""] , [ ] , [ ] ]
@blocks = [[""]]

@cr = 0
@cc = 0
@cd = 0

def clockwise(bool)
    if bool
        @cd += 1
    else
        @cd -= 1
    end

    if @cd < 0
        @cd = 3
    end

    if @cd == 4
        @cd = 0
    end
end

def generate_block
    direction = @all_directions[@cd]
    case direction
        when "n"
            @blocks.insert(@cr,["n"])
            @cr -= 1
        when "s"
            @blocks.insert(@cr+1,["s"])
            @cr += 1
        when "w"
            @blocks[@cr].insert(@cc,"w")
            @cc -= 1
        else #east
            @blocks[@cr].insert(@cc+1,"e")
            @cc += 1       
    end
end

entrance_to_exit.split('').each do |direc|
    case direc
        when "L"
            clockwise(true)
        when "W"
            generate_block()
        else
            clockwise(false)
    end
end

puts @blocks.join('')