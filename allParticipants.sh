
# Overwrite file
echo "experiment,non-live,live,vertical,full" > positioning.csv
echo "experiment,non-live,live,vertical,full" > featureLocation.csv

for n in {1..10}
do
  echo "$n"
  ruby processData.rb $n --file
done
