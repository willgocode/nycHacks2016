import sys, getopt
from pymongo import MongoClient

def save_event():
	eventName = raw_input("Enter the event name: ")
	date = raw_input("Enter the event date in this format <April> <23>: ")
	time = raw_input("Enter the event time in this format <4:00 PM>: ")
	price = raw_input("Enter the event price in this format <$3.22>: ")
	location = raw_input("Enter the location: ")
	synopsis = raw_input("Enter the description: ")
	client = MongoClient('localhost', 27017)
	db = client['activegen']

	events = db['activities']

	event = {'Event_Name' : eventName,
			'Date' : date,
			'Time' : time,
			'Price' : price,
			'Location' : location,
			'Synopsis' : synopsis
			}

	event_id = events.insert_one(event).inserted_id


	print event['Event_Name']
	print event['Date']
	print event['Time']
	print event['Price']
	print event['Synopsis']

if __name__ == "__main__":
	save_event()
