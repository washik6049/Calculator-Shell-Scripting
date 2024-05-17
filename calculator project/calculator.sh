#!/bin/bash

projectname() {
    echo ""
    echo "*******************************************"
    echo "*******************************************"
    echo "**                                       **"
    echo "**               Calculator              **"
    echo "**                                       **"
    echo "*******************************************"
    echo "*******************************************"
    echo ""
    echo ""
}

submittedby() {
  clear

    echo ""
    echo ""
    echo "    =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
    echo "  ||          Name               |       ID            ||"
    echo "  ||***************************************************||"
    echo "  ||    1. Washik Wali Faieaz    | ID: 212-15-14763    ||"
    echo "  ||    2. Sayma Jannat          | ID: 212-15-14710    ||"
    echo "    =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
    echo ""
    echo ""
    date +"Date: %d %m %Y Time: %H:%M:%S"
    echo ""
    read -p "Do you want to select another option? (y/n): " continue_selecting

    if [ "$continue_selecting" == "y" ]
    then main
    else
      echo "Exiting calculator."
      main
    fi 
}

submittedto() {
  clear
    echo ""
    echo "  =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
    echo "||          Md. Sabab Zulfiker         ||"
    echo "||                &&                   ||"
    echo "||        Md. Abdullah Al Kafi         ||"
    echo "  =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
    echo ""
    echo ""
    date +"Date: %d %m %Y Time: %H:%M:%S"
    echo ""
    read -p "Do you want to select another option? (y/n): " continue_selecting

    if [ "$continue_selecting" == "y" ]
    then main
    else
      echo "Exiting calculator."
      main
    fi 
}

addition() {

  echo "$1 + $2" | bc
}

subtraction() {

  echo "$1 - $2" | bc
}

multiplication() {

  echo "$1 * $2" | bc
}

division() {

  if [ "$2" -eq 0 ]
  then  echo "Error: Division by zero!"
  else
    echo "scale=2; $1 / $2" | bc
  fi
}

sqrt() {

  echo "scale=4; sqrt($1)" | bc -l
}

power() {

  echo "scale=4; $1^$2" | bc -l
}

sin() {

  echo "scale=4; s($1)" | bc -l
}

cos() {

  echo "scale=4; c($1)" | bc -l
}

tan() {

  echo "scale=4; s($1) / c($1)" | bc -l
}

age_calculator() {
  clear
  projectname
  read -p "Enter your birth year: " birth_y
  read -p "Enter your birth month: " birth_m
  read -p "Enter your birth day: " birth_d
  echo ""
  echo "-----------Birth Date---------"
  echo ""
  echo $birth_d $birth_m $birth_y

  current_y=$(date +%Y)
  current_m=$(date +%-m)
  current_d=$(date +%-d)

  echo ""
  echo "-----------Current Date-------------"
  echo ""
  echo $current_d $current_m $current_y
  echo ""

  years=$((current_y - birth_y))
  months=$((current_m - birth_m))
  days=$((current_d - birth_d))

  if [ $current_m -lt $birth_m ] || ([ $current_m -eq $birth_m ] && [ $current_d -lt $birth_d ])    
   then ((years--))
    ((months += 12))
  fi

  if [ $current_d -lt $birth_d ]
  then ((months--))
     days=$((30 - birth_d + current_d))
  fi
  echo ""
  echo "-----------Age-------------------"
  echo ""
  echo "You have $years years, $months months, $days days"
  echo "" 
  
  read -p "Do you want to select another option? (y/n): " continue_selecting

  if [ "$continue_selecting" == "y" ]
  then main

  else
     echo "Close calculator"
     exit 0
  fi
}

calculator() {
  clear
  projectname
  date +"Date: %d %m %Y Time: %H:%M:%S"
  echo ""
  echo "1. Addition"
  echo "2. Subtraction"
  echo "3. Multiplication"
  echo "4. Division"
  echo "5. Square Root"
  echo "6. Power"
  echo "7. Sin"
  echo "8. Cos"
  echo "9. Tan"
  echo "10. Quit"
  echo ""
  read -p "Enter your choice (1-10): " choice
  echo ""
  if [ $choice -eq 1 ]
  then read -p "Enter first number: " num1
      read -p "Enter second number: " num2
      result=$(addition "$num1" "$num2")
      echo "Result: $result"
      
  elif [ $choice -eq 2 ]
  then read -p "Enter first number: " num1
      read -p "Enter second number: " num2
      result=$(subtraction "$num1" "$num2")
      echo "Result: $result"
      
  elif [ $choice -eq 3 ]
  then read -p "Enter first number: " num1
      read -p "Enter second number: " num2
      result=$(multiplication "$num1" "$num2")
      echo "Result: $result"
     
  elif [ $choice -eq 4 ]
  then read -p "Enter numerator: " num1
      read -p "Enter denominator: " num2
      result=$(division "$num1" "$num2")
      echo "Result: $result"
     
  elif [ $choice -eq 5 ]
  then read -p "Enter a number: " num
      result=$(sqrt "$num")
      echo "Result: $result"
      
  elif [ $choice -eq 6 ]
  then read -p "Enter the base: " base
      read -p "Enter the power: " power_of
      result=$(power "$base" "$power_of")
      echo "Result: $result"
      
  elif [ $choice -eq 7 ]
  then read -p "Enter an angle in radians: " angle
      result=$(sin "$angle")
      echo "Result: $result"
      
  elif [ $choice -eq 8 ]
  then read -p "Enter an angle in radians: " angle
      result=$(cos "$angle")
      echo "Result: $result"
      
  elif [ $choice -eq 9 ]
  then read -p "Enter an angle in radians: " angle
      result=$(tan "$angle")
      echo "Result: $result"
     
  elif [ $choice -eq 10 ]
  then echo "Exiting calculator."
      main
      
  else
      echo "Invalid choice. Please enter a number between 1 and 10."
      
  fi

  read -p "Do you want to perform another calculation? (y/n): " continue_calculation

  if [ "$continue_calculation" == "y" ]
  then calculator

  else
    echo "Exiting calculator."
    main
  fi
}

main() {

  clear
  projectname

  echo ""
  echo " __________________________ "
  echo "| ⚙️ Select your option ⚙️ |"
  echo "╭──────────────────────────╮"
  echo "│  1. Submitted By         │"
  echo "│  2. Submitted To         │"
  echo "│  3. Calculator           │"
  echo "│  4. Age Calculation      │"
  echo "│  5. Calendar             │"
  echo "│  6. Exit                 │"
  echo "╰──────────────────────────╯"
  echo ""
  read -p "Enter your choice (1-6): " choice
  echo ""
  if [ $choice -eq 1 ] 
  then submittedby 
      
  elif [ $choice -eq 2 ]     
  then submittedto
      
  elif [ $choice -eq 3 ]
  then calculator
  elif [ $choice -eq 4 ]
  then age_calculator

  elif [ $choice -eq 5 ]
  then cal 2023
      
  elif [ $choice -eq 6 ]
  then echo "Close calculator"
      exit 0
      
  else
      echo "Invalid choice. Please enter a number between 1 and 6."
      
  fi

  read -p "Do you want to select another option? (y/n): " continue_selecting

  if [ "$continue_selecting" == "y" ]
  then main

  else
     echo "Close calculator"
     exit 0
  fi
}

main
