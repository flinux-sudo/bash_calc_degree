#!/bin/bash
hours=`( echo $1 | sed 's/:/ /g' )`
echo "which angle:"
echo "smaller or bigger:"
flaga=""
read flaga;
echo $flaga
hour_pointer=`(echo $hours | awk '{print $1}')`
minute_pointer=`(echo $hours | awk '{print $2}')`
hour=5 #min
min=6 #stopni
circle=360
halfcirlce=180

if [ $hour_pointer -ge 12 ]; then
  hour_pointer=$(expr $hour_pointer - 12)
fi  

 let hour_to_min=($hour_pointer*$hour)
 let hour_degree=($hour_to_min*$min)
 let min_degree=($min*$minute_pointer)
    degree_h=$( expr $hour_degree - $min_degree )
    degree_m=$( expr $min_degree - $hour_degree )
 
 bigger_degree () {
   
   if [ $degree -gt $halfcirlce ]; then

      echo "bigger-28:$degree_h"

    elif [ $degree -lt $halfcirlce ]; then
     bigger_degree=$( expr $circle - $degree )
     echo "bigger-32:$bigger_degree"

   else
      echo "big:$bigger_degree"
     
   fi    

 }


 smaller_degree () {

   if [ $degree -gt $halfcirlce ]; then
    
     smaller_degree=$(expr $circle - $degree )
      echo "smaller:$smaller_degree-44"

   elif [ $degree -lt $halfcirlce ];then
      echo "smaller:$degree-47"

   else

     echo "small:$smaller_degree"

   fi 

 }


 if [ $hour_degree -gt $min_degree  ]; then
    degree=$degree_h
    
     if  [ "$flag" = "bigger"  ]; then

       bigger_degree 

     else
       
       smaller_degree
     fi  

 elif  [ $hour_degree -lt $min_degree ]; then
     degree=$degree_m
  
     
     if  [ "$flag" = "bigger"  ]; then
    
       bigger_degree

     else

       smaller_degree

     fi

 else 
   echo "$degree_h-82"

 fi
