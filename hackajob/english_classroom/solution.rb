
class Solution
    ENGLISH_TO_MORSE = {
        "a" => ".-",
        "b" => "-...",
        "c" => "-.-.",
        "d" => "-..",
        "e" => ".",
        "f" => "..-.",
        "g" => "--.",
        "h" => "....",
        "i" => "..",
        "j" => ".---",
        "k" => "-.-",
        "l" => ".-..",
        "m" => "--",
        "n" => "-.",
        "o" => "---",
        "p" => ".--.",
        "q" => "--.-",
        "r" => ".-.",
        "s" => "...",
        "t" => "-",
        "u" => "..-",
        "v" => "...-",
        "w" => ".--",
        "x" => "-..-",
        "y" => "-.--",
        "z" => "--..",
        "." => ".-.-.-",
        "," => "--..--",
        " " => " " # Should be three spaces but we do special mapping
    }

    MORSE_TO_ENGLISH = ENGLISH_TO_MORSE.invert

    INVALID_TEXT_MSG = "Invalid Morse Code Or Spacing"

    def run(morse, text)
        text = text.downcase

    	if morse
            morse_to_english(text)
        else
            english_to_morse(text)
        end

    rescue => error
        puts error.message

        return error.message
    end

    private

    def morse_to_english(text)
        message = ""
        text_arr = text.each_char.to_a

        while !text_arr.empty?
            current_word = ""
            current_letter = text_arr.shift

            until current_letter == " " || text_arr.empty?
                current_word = current_word + current_letter
                current_letter = text_arr.shift
            end

            if text_arr.empty? && current_letter != " "
                current_word = current_word + current_letter
            end

            english_char = MORSE_TO_ENGLISH[current_word]

            raise INVALID_TEXT_MSG unless english_char
            # raise "Unmapped morse word: #{current_word}" unless english_char

            message = message + english_char

            if current_letter == " "
                if text_arr[0..1] == [" ", " "]
                    message = message + " "
                    text_arr.shift(2)
                    next
                elsif text_arr[0] == " "
                    # Exactly two spaces
                    raise INVALID_TEXT_MSG
                    # raise "Current word is: #{current_word}, current_letter is: #{current_letter}, text_arr is: #{text_arr}"
                end
            end
        end

        message
    end

    def english_to_morse(text)
        message = text.each_char.map do |char|
            morse_char = ENGLISH_TO_MORSE[char]

            # raise "Unmapped char: #{char}" unless morse_char
            raise INVALID_TEXT_MSG unless morse_char

            morse_char
        end.join(" ")

        if message[0] == " "
            message = "  " + message
        end

        if message[-1] == " "
            message = message + "  "
        end

        message
    end
end
