# TimeTracker 4000 

## Goals:

* Track daily shift information for each supporter:

	* Full, half, or no shift
		* If “half” or “no” shift, was that PLANNED or UNPLANNED
	* Whether the work is remote or in-office
	* Whether the scheduled work day is an Email day or a Phone day (maybe also with an “other” shift available)
`If this info could be color coded (we have a color system in place that I can show you)` 

## II. UI Considerations
* Working from a single DAY view would be ideal.  
* View a list of supporters and have the ability to click to designate pieces above (not type)
* Consider also that we may not track each day as it happens, so we may need to scroll through days and/or make corrections/additions to other days. 

## III.  Build / view reports on this information.  
* Would be great if you could build out a specific time-frame report for each supporter
* A quick “last 4 weeks” view for each supporter. 
* On the report, quantity of expected work days during the time period (removing planned vacation time, etc) 
* Percentage of unplanned time off vs. planned work time.  [  (unplanned absence x 100) / expected work days  ] 
`Currently, we track this percentage and OVER 10% gets flagged red, 0% flagged green.  Would be nice to have this number / info flagged in some way similarly.` 

## IV.  STRETCH-GOAL:  Calendar view
> A neat thing, but not necessary for what we use the information for.  
Pull up a calendar for a specific supporter, and be able to see a color-coded view of what the month / time-frame looks like. 

#### V.  Ability to set defaults for supporters, set view for “Swim Lane A” , “Swim Lane B” , or “Whole Team”   (or just a tagging system perhaps?) 

Reporting:   Set a time-frame and report back on how many email days, phone days, remote days, unplanned out days

Push-button to clear calendar 
Push-button to mark as sick / unplanned in Paylocity

## ERD for Data Structure
![TT4K ERD](https://raw.githubusercontent.com/harringtonben/time-tracker-4000/master/TT4K%20ERD.png)

## Repos for the front and back end portions of this project:
####[Time Tracker API](https://github.com/harringtonben/time-tracker-API)
####[Time Tracker Front End](https://github.com/harringtonben/time-tracker-frontend)
