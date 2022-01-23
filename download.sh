mkdir images
mkdir metadata

for i in {0..9}
do
	curl https://opensea-creatures-api.herokuapp.com/api/creature/$i > metadata/$i.json
	curl https://storage.googleapis.com/opensea-prod.appspot.com/creature/$i.png > images/$i.png
done
echo "done"