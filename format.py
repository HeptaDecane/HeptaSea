import json

images_base_url = "https://gateway.pinata.cloud/ipfs/QmT8V2yPBHG7qFweUDw3px3kYDQX2CzwYUCw998pRFtZyV/"
for i in range(10):
    file = open('metadata/{}.json'.format(i))
    metadata = json.load(file)
    filename = '{}.png'.format(i)
    metadata['image'] = images_base_url + filename
    file = open('metadata/{}.json'.format(i),'w')
    json.dump(metadata, file, indent=2)