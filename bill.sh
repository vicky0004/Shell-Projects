clear

navbar(){
printf "Original Bill.\t\t\t\t\t\t\tGST no.:29ABCDE1234F2K5\n" 
printf "\n"
printf "\t\t\t\tV Group of Company pvt. ltd.\n\t\t\t\tBazar Samiti,Patna, BIHAR\n\t\t\t\tcontact- 8521444439\n"
printf "\n"
}
cd /home/vicky/Desktop/b_folder
navbar
navbar > Bill.txt
d=$(date "+%D %T")
bill_n=$RANDOM
printf "Date : $d\t\t\t\t\t\tBill no.: $bill_n\n" >> Bill.txt

echo -n "Costomer name: "
read name
echo "Costomer : $name" >> Bill.txt

echo -n "Costomer Address: "
read add
echo "address : $add" >> Bill.txt
echo "------------------------------------------------------------------------------------------" >> Bill.txt
printf "Sl.\tProduct\t\t\tQnt.\tRate\t\tTotal\t\tRemark any\n" >> Bill.txt
echo "------------------------------------------------------------------------------------------" >> Bill.txt
no=0
choice=1
t_amount=0
while [ $choice -eq 1 ]
do

	printf "\n-------------------------------------------------------------------------------------------------------\n"
        no=$(( $no + 1 ))
        printf  "\t\t\t\tproduct  name : "
        read product
        printf  "\t\t\t\tquantity : "
        read qnt
        printf "\t\t\t\trate : "
        read rate
        total=$(( $qnt * $rate ))
        printf "$no.\t$product\t\t$qnt\t$rate\t\t$total\n" >> Bill.txt
        t_amount=$(( $t_amount + $total ))
        echo "product added..."
        echo "[1]-add product [0]-generate bill"
        read choice
done



echo "------------------------------------------------------------------------------------------" >> Bill.txt
echo "Amount: $t_amount rupees" >> Bill.txt
gst=`expr $t_amount \* 18 / 100`
echo "total GST(18%): $gst rupees" >> Bill.txt
t_amount=$(( $t_amount + $gst ))
echo "Total amount:  $t_amount rupees" >> Bill.txt
printf "\n" >> Bill.txt
printf "\t\t\t\t\t\t\t\tSign.-" >> Bill.txt
printf "\n" >> Bill.txt
enscript -p output.ps -B --no-header Bill.txt
ps2pdf output.ps $bill_n.pdf
rm output.ps Bill.txt
evince $bill_n.pdf
