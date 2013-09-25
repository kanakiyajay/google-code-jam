#https://code.google.com/codejam/contest/dashboard?c=32003

line_num , samples = 0

@answer_num = 1

def todecimal(number,base)
    sum = 0
    index = 0
    chars = number.to_s.split('')
    chars.reverse.each do |i|
        equi = @source[i] #Get the equivalent
        sum = sum + equi * (base ** index)
        index = index + 1
    end
    return sum
end

def tobase(number,base)
    i = 0
    binary = []
    alien_number = []
    while number !=0
        binary.push(number % base)
        number = number / base
    end
    binary.each do |x|
        alien_number.push(@target[x])
    end
    return alien_number.reverse.join('')
end

def readparams(line)
    return line.split(' ')
end

@source = Hash.new
@target = Hash.new

def doawesome(array)
    alien_number = array[0] 
    source_language = array[1] 
    target_language = array[2]

    i = 0
    j = 0

    source_language.split('').each do |x|
        @source[x] = i
        i = i + 1
    end

    target_language.split('').each do |y|
        @target[j] = y
        j = j + 1
    end

    source_base = source_language.length
    target_base = target_language.length

    decimal = todecimal(alien_number,source_base)
    answer = tobase(decimal,target_base)   

    printer(answer)
end


def printer(answer)
    @f.write("Case #"+@answer_num.to_s+": "+answer.to_s+"\n")
    @answer_num += 1
end

@f = File.open('1-A-large-practice-out','w')

File.readlines('1-A-large-practice.in').each do |line|

    if line_num == 0
        samples = line.to_i
    else
        x = readparams(line)
        doawesome(x)
    end
    line_num += 1
end

@f.close