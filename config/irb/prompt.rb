IRB.conf[:PROMPT][:SIMPLE_COLOR] = {
  :PROMPT_I => "#{ANSI[:BLUE]} »#{ANSI[:RESET]} ",
  :PROMPT_N => "#{ANSI[:BLUE]} »#{ANSI[:RESET]} ",
  :PROMPT_C => "#{ANSI[:RED]}?»#{ANSI[:RESET]} ",
  :PROMPT_S => "#{ANSI[:YELLOW]}?»#{ANSI[:RESET]} ",
  :RETURN   => "#{ANSI[:GREEN]}=»#{ANSI[:RESET]} %s\n",
  :AUTO_INDENT => true }
IRB.conf[:PROMPT_MODE] = :SIMPLE_COLOR
