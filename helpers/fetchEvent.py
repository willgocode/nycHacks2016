import sys
from pymongo import MongoClient
from random import randrange, uniform

def fetch_events():
	client = MongoClient('localhost', 27017)
	db = client['activegen']
	
	cursor = db.activities.find()
	endpoint = db.activities.count()-1
	rng = randrange(0, endpoint)  
	return cursor[rng]
if __name__ == "__main__":
	fetch_events(}
