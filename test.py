#!/usr/bin/env python
# -*- coding: utf-8 -*-
import urllib2
import json
import mysql.connector
from mysql.connector import errorcode

# DATAMAILBOX CREDENTIALS
t2mAccount = "t2macc"
t2mUsername = "t2muser"
t2mPassword = "t2mpass"
t2mDevId = "devId"

try:
    # DATABASE CONNECTION CREDENTIALS
    cnx = mysql.connector.connect(user='root',
                                  password='root',
                                  host='127.0.0.1',
                                  database='test')
    cursor = cnx.cursor()

    # Checks if transaction ID is available. Transaction IDs are used to receive only fresh data.
    transactionId = 0
    query = "SELECT transaction_id FROM datamailbox_transactions WHERE account = '%s'" % t2mAccount
    cursor.execute(query)
    for row in cursor:
        transactionId = row[0]
    print "Import initiated..."
    print("Old transaction ID = " + str(transactionId))
    cnx.commit()

    maxIterations = 10          # Prevents endless loops
    moreDataAvailable = True    # Signals if data received is not complete
    counter = 1                 # Loop counter

    # Request data until all data is received
    while (moreDataAvailable and counter < maxIterations):
        print("DMweb query #" + str(counter))

        url = "https://data.talk2m.com/syncdata?t2maccount=" + t2mAccount + \
              "&t2musername=" + t2mUsername + \
              "&t2mpassword=" + t2mPassword + \
              "&t2mdevid=" + t2mDevId + \
              "&createTransaction=1&lasttransactionId=" + str(transactionId)
        httpResponse = urllib2.urlopen(url).read()
        jsonData = json.loads(httpResponse)

        if "success" in jsonData and not jsonData["success"]:
            print("Cannot access Datamailbox!")
            exit()

        for ewon in jsonData["ewons"]:

            # create eWON if doesn't exist
            ewonId, ewonName = ewon["id"], ewon["name"]
            ewonLastSync = ewon["lastSynchroDate"].replace("T", " ", 1)[:-1]        # Parse date from ISO 8601
            query = "INSERT INTO ewon_list (id, name, last_sync_utc) VALUES (%s, '%s', '%s') " \
                    "ON DUPLICATE KEY UPDATE name = '%s', last_sync_utc = '%s'" \
                    % (ewonId, ewonName, ewonLastSync, ewonName, ewonLastSync)
            cursor.execute(query)
            cnx.commit()

            # Create tag if doesn't exist
            if "tags" in ewon:
                for tag in ewon["tags"]:
                    tagId, tagName, tagType, tagDescription, tagAlarmHint, tagEwonTagId = \
                    tag["id"], tag["name"], tag["dataType"], tag["description"], tag["alarmHint"], tag["ewonTagId"]
                    query = "INSERT INTO tag_list (id, ewon_id, name, type, description, alarm_hint, ewon_tag_id) " \
                            "VALUES (%s, '%s', '%s', '%s', '%s', '%s', '%s') " \
                            "ON DUPLICATE KEY UPDATE name = '%s', type = '%s', description = '%s', alarm_hint = '%s'" \
                            % (tagId, ewonId, tagName, tagType, tagDescription, tagAlarmHint, tagEwonTagId,
                               tagName, tagType, tagDescription, tagAlarmHint)
                    cursor.execute(query)
                    cnx.commit()

                    # Write history data if exists
                    if "history" in tag:
                        print "Importing (%s/%s): %s new history tags..." % (ewonName, tagName, len(tag["history"]))
                        for hist in tag["history"]:
                            historyDate = hist["date"].replace("T", " ", 1)[:-1]        # Parse date from ISO 8601
                            historyValue = hist["value"]
                            historyQuality = None
                            if "quality" in hist:
                                historyQuality = hist["quality"]
                            query = "INSERT INTO history (tag_id, date, quality, value) " \
                                    "VALUES (%s, '%s', '%s', %s)" \
                                    % (tagId, historyDate, historyQuality, historyValue)
                            cursor.execute(query)
                            cnx.commit()

        # Check if more data is available
        if "moreDataAvailable" in jsonData and jsonData["moreDataAvailable"]:
            print("More data available")
            moreDataAvailable = True
        else:
            moreDataAvailable = False

        # Loop counter
        counter = counter + 1

        # Fetch new transaction ID and store it to database
        if "transactionId" in jsonData:
            transactionId = jsonData["transactionId"]
            query = "INSERT INTO datamailbox_transactions (account, transaction_id) VALUES ('%s', %s) " \
                    "ON DUPLICATE KEY UPDATE transaction_id = %s" \
                    % (t2mAccount, transactionId, transactionId)
            cursor.execute(query)
            cnx.commit()
            print "New transaction ID = " + str(transactionId)

        else:
            print ("No transaction id in DataMailbox!")

    print "Finished with no errors."
    cursor.close()

except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Something is wrong with your user name or password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Database does not exist")
    else:
        print(err)
finally:
    cnx.close()
