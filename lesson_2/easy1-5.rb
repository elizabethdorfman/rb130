ALPHA = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
LETTERS = 26
CIPHER = 13
def decipher(name)
	deciphered_name = ""
	name.downcase!
	name.split("").each do |letter|
		if letter == " "
			deciphered_name << " "
			next
		end
		deciphered_name << ALPHA[(ALPHA.index(letter) + CIPHER) % LETTERS]
	end
	deciphered_name
end
puts decipher("Nqn Ybirynpr")