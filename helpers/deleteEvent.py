#ignore file 
import sys, getopt, datetime
from pymongo import MongoClient

def delete_event():
	eventName = raw_input("Enter the event name to delete: ")
    
	client = MongoClient('localhost', 27017)
	db = client['activegen']

	cursor = db.activities.find()
	dateToday = datetime.date.today()
	type(dateToday.month) 
	for activity in cursor:
		if datetime.datetime.now() ;
