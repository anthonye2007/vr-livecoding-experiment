rm positioning.csv

touch positioning.csv
echo "experiment,non-live,live,vertical,full" > positioning.csv

for n in {1..10}
do
  echo "$n"
  ruby processData.rb $n -f
done
