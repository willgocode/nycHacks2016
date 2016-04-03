import sys
from pymongo import MongoClient

def fetch_events():
	client = MongoClient('localhost', 27017)
	db = client['activegen']
	
	cursor = db.activities.find()
	
	for i in cursor:
		print i

if __name__ == "__main__":
	fetch_events()
