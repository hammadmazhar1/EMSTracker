Feature: contact an MFR

  As a app user
  So that I can be helped in case of an emergency
  I want to be able to contact an MFR

Background: database status

  Given the following MFRs exist:
  | username     | password | name          | rollno   | phoneno     | gender |
  | usaidm    	 | usaidm   | Usaid Mandvia | 16100215 | 03331310724 | Male   |
  | aminas       | aminas   | Amina Saeed   | 15110032 | 03216548927 | Female |
  | rashidm      | rashidm  | Rashid Minhas | 17100020 | 03455487851 | Male   |
  | areebat      | areebat  | Areeba Tayyab | 16100222 | 03154585269 | Female |
  
  And the following Users exist:
  | username | password | rollno   | phoneno     | gender |
  | hammadm  | hammadm  | 16100032 | 03322485721 | Male   |
  | alinam	 | alinam   | 16110568 | 03132545682 | Female |
  
  And the following Locations exist:
  | mfr_id | gps_latitude | gps_longitude | location |
  |	1			 | 31.470855    | 74.412103     | M-6      |
  | 2			 | 31.380445		|	74.412103			|	SSE			 |
  
  And the following Kits exist:
  | location  | details 						| available |
  | SSE       | First Floor Lobby	  | yes				|
  | SportsCom | EMS Room            | no        |
	| Rec Room	| PDC stall						| yes				|

Scenario: get nearest MFR
	Given I am on the home page
	And I am logged in as User "hammadm"
	And my GPS coordinates are "31.470855", "73.412103"
	When I press "Get Help"
	Then I should be on the details page for "Usaid Mandvia"


Feature: MFR kit availability
		As a MFR 
		So that I can treat patients quickly
		I should be able to see the first aid kits currently available
	
Background: database status

  Given the following MFRs exist:
  | username     | password | name          | rollno   | phoneno     | gender |
  | usaidm    	 | usaidm   | Usaid Mandvia | 16100215 | 03331310724 | Male   |
  | aminas       | aminas   | Amina Saeed   | 15110032 | 03216548927 | Female |
  | rashidm      | rashidm  | Rashid Minhas | 17100020 | 03455487851 | Male   |
  | areebat      | areebat  | Areeba Tayyab | 16100222 | 03154585269 | Female |
  
  And the following Users exist:
  | username | password | rollno   | phoneno     | gender |
  | hammadm  | hammadm  | 16100032 | 03322485721 | Male   |
  | alinam	 | alinam   | 16110568 | 03132545682 | Female |
  
  And the following Locations exist:
  | mfr_id | gps_latitude | gps_longitude | location |
  |	1			 | 31.470855    | 74.412103     | M-6      |
  | 2			 | 31.380445		|	74.412103			|	SSE			 |
  
  And the following Kits exist:
  | location  | details 						| available |
  | SSE       | First Floor Lobby	  | yes				|
  | SportsCom | EMS Room            | no        |
	| Rec Room	| PDC stall						| yes				|
	
Scenario: get available kits
Given I am on the home page
And I am logged in as MFR "usaidm"
When I press "Available Kits"
Then I am on the available kits page
And I should see "SSE"
And I should see "Rec Room"


Feature: MFR history

	As a MFR
	So that I can assess my performance
	I should be able to see the cases which I treated

Background: database status

  Given the following MFRs exist:
  | username     | password | name          | rollno   | phoneno     | gender |
  | usaidm    	 | usaidm   | Usaid Mandvia | 16100215 | 03331310724 | Male   |
  | aminas       | aminas   | Amina Saeed   | 15110032 | 03216548927 | Female |
  | rashidm      | rashidm  | Rashid Minhas | 17100020 | 03455487851 | Male   |
  | areebat      | areebat  | Areeba Tayyab | 16100222 | 03154585269 | Female |
  
  And the following Users exist:
  | username | password | rollno   | phoneno     | gender |
  | hammadm  | hammadm  | 16100032 | 03322485721 | Male   |
  | alinam	 | alinam   | 16110568 | 03132545682 | Female |
  
  And the following Locations exist:
  | mfr_id | gps_latitude | gps_longitude | location |
  |	1			 | 31.470855    | 74.412103     | M-6      |
  | 2			 | 31.380445		|	74.412103			|	SSE			 |
  
  And the following Kits exist:
  | location  | details 						| available |
  | SSE       | First Floor Lobby	  | yes				|
  | SportsCom | EMS Room            | no        |
	| Rec Room	| PDC stall						| yes				|
	
	And the following Emergencies exist:
	
	| mfr_id   | user_id  | location | severity | resolve_time 			       | hospital_visited | created_at 						| updated_at        |
	| 1        | 1        | SSE			 | low      | 11:00PM, April 23,2015   | false						| 10:50PM, April 23,2015| 11:05PM, April 23, 2015 |
	| 3        | 1        | M-6			 | high     | 2:00PM, February 4 ,2015 | true						  | 12:00PM, February 4,2015| 2:10PM, February 4, 2015 |	
	
Scenario: get MFR's history
	Given I am on the home page
	And I am logged in as MFR "rashidm"
	When I follow "Treated Cases"
	Then I should be on the cases page
	And I should see "M-6"
	And I should see "16100032"




Feature 
	As an MFR
	As I need to update details about cases I have treated
	I should be able to see any pending cases with imcomplete details

Background: database status

	Given the following MFRs exist:
  | username     | password | name          | rollno   | phoneno     | gender |
  | usaidm    	 | usaidm   | Usaid Mandvia | 16100215 | 03331310724 | Male   |
  | aminas       | aminas   | Amina Saeed   | 15110032 | 03216548927 | Female |
  | rashidm      | rashidm  | Rashid Minhas | 17100020 | 03455487851 | Male   |
  | areebat      | areebat  | Areeba Tayyab | 16100222 | 03154585269 | Female |
  
  And the following Users exist:
  | username | password | rollno   | phoneno     | gender |
  | hammadm  | hammadm  | 16100032 | 03322485721 | Male   |
  | alinam	 | alinam   | 16110568 | 03132545682 | Female |
  
  And the following Locations exist:
  | mfr_id | gps_latitude | gps_longitude | location |
  |	1			 | 31.470855    | 74.412103     | M-6      |
  | 2			 | 31.380445		|	74.412103			|	SSE			 |
  
  And the following Kits exist:
  | location  | details 						| available |
  | SSE       | First Floor Lobby	  | yes				|
  | SportsCom | EMS Room            | no        |
	| Rec Room	| PDC stall						| yes				|
	
	And the following Emergencies exist:
	
	| mfr_id   | user_id  | location | severity | resolve_time 			       | hospital_visited | created_at 						| updated_at        |
	| 1        | 1        | SSE			 | low      | 11:00PM, April 23,2015   | false						| 10:50PM, April 23,2015| 11:05PM, April 23, 2015 |
	| 3        | 1        | M-6			 | high     | 2:00PM, February 4 ,2015 | true						  | 12:00PM, February 4,2015| 2:10PM, February 4, 2015 |	
	| 2        | 2        | F-3			 |          | 												 |    						  | 5:36PM, March 10, 2015| 5:36PM, March 10, 2015 |	

Scenario: see missing info 
	Given I am on the home page
	And I am logged in as "aminas"
	And I follow "Pending Cases"
	Then I should be on the pending cases page
	And I should see "F-3"

Scenario: update missing info
	Given I am logged in as "aminas"
	And I am on the pending cases page
	And I follow "Complete Case 3 data"
	And I fill in "Severity" with "low"
	And I fill in "Resolve Time" with "5:50, March 10, 2015"
	And I fill in "Hospital Visited" with "false"
	And I press "Submit"
	Then I should be on the pending cases page
	And I should see "No more pending cases"



The person in emergency should 
just know the general location of the MFRs on 
duty so that they know the closest MFR
